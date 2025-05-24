unit Lista_Grupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaGrupos = class(TForm)
    Panel5: TPanel;
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
    Panel13: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel11: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
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
  ListaGrupos: TListaGrupos;

implementation

{$R *.dfm}

uses Cad_Grupo, Data_Module;

procedure TListaGrupos.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabGrupo.Delete;
end;

procedure TListaGrupos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabGrupo.Cancel;
    DBGrid1.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaGrupos.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabGrupo.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaGrupos.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaGrupos.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    begin
      dm.FDTabGrupo.Post;
      ShowMessage('Grupo editado com sucesso!');
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

procedure TListaGrupos.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
end;

procedure TListaGrupos.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
end;

procedure TListaGrupos.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
end;

procedure TListaGrupos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
end;

procedure TListaGrupos.Filtro; // pesquisa com sql query
begin
  FDQuery1.ParamByName('descricao').AsString := '%' + Edit1.Text + '%';

  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TListaGrupos.FormShow(Sender: TObject);
begin
  dm.FDTabGrupo.Open;
  Filtro;
end;

procedure TListaGrupos.Edit1Change(Sender: TObject);
begin
  Filtro;
end;

end.
