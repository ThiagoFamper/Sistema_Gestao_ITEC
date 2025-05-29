unit Lista_Setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaSetor = class(TForm)
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
    gpSetor: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpSetorID: TDBEdit;
    Panel15: TPanel;
    Label2: TLabel;
    dbpSetorDescricao: TDBEdit;
    Panel16: TPanel;
    Label7: TLabel;
    epSetorDescricao: TEdit;
    qrySetor: TFDQuery;
    dsSetor: TDataSource;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure epSetorDescricaoChange(Sender: TObject);
    procedure Filtro;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaSetor: TListaSetor;

implementation

{$R *.dfm}

uses Cad_Setor, Data_Module, Tela_Principal;

procedure TListaSetor.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabSetor.Delete;
end;

procedure TListaSetor.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabSetor.Cancel;
    gpSetor.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaSetor.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabSetor.Edit;
    gpSetor.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaSetor.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaSetor.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpSetorDescricao.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        dbpSetorDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabSetor.Post;
      ShowMessage('Setor editado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpSetor.Enabled      := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaSetor.HabilitaCampos; // habilitar campos
begin
    dbpSetorDescricao.Enabled            := True;
end;

procedure TListaSetor.DesabilitaCampos; // desabilitar campos
begin
    dbpSetorDescricao.Enabled            := False;
end;

procedure TListaSetor.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epSetorDescricao.Enabled            := False;
end;

procedure TListaSetor.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epSetorDescricao.Enabled            := True;
end;

procedure TListaSetor.Filtro; // pesquisa com sql query
begin
  qrySetor.ParamByName('descricao').AsString := '%' + epSetorDescricao.Text + '%';

  qrySetor.Close;
  qrySetor.Open;
end;

procedure TListaSetor.FormShow(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaSetor.epSetorDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

end.
