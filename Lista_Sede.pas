unit Lista_Sede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TListaSede = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel11: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Filtro;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaSede: TListaSede;

implementation

{$R *.dfm}

uses Cad_Sede, Data_Module;

procedure TListaSede.SBexcluirClick(Sender: TObject); // bot�o de excluir
begin
  if MessageDlg('Voc� tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabSede.Delete;
end;

procedure TListaSede.SBcancelarClick(Sender: TObject); // bot�o de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabSede.Cancel;
    DBGrid1.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaSede.SBeditarClick(Sender: TObject); // bot�o de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabSede.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaSede.SBsairClick(Sender: TObject);
begin
  Close(); // bot�o de sair
end;

procedure TListaSede.SBsalvarClick(Sender: TObject); // bot�o de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O campo "C�digo" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    begin
      dm.FDTabSede.Post;
      ShowMessage('Sede editada com sucesso!');
      DesabilitaCampos();
      HabilitaCamposPesquisa();
      DBGrid1.Enabled      := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaSede.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
end;

procedure TListaSede.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
end;

procedure TListaSede.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
end;

procedure TListaSede.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
end;

procedure TListaSede.Filtro; // pesquisa com sql query
begin
  FDQuery1.ParamByName('descricao').AsString := '%' + Edit1.Text + '%';

  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TListaSede.FormShow(Sender: TObject);
begin
  dm.FDTabSede.Open;
  Filtro;
end;

procedure TListaSede.Edit1Change(Sender: TObject);
begin
  Filtro;
end;

end.
