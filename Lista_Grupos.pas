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
    gpGrupo: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpGrupoID: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    dbpGrupoDescricao: TDBEdit;
    Panel11: TPanel;
    Label3: TLabel;
    epGrupoDescricao: TEdit;
    dsGrupo: TDataSource;
    qryGrupo: TFDQuery;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure epGrupoDescricaoChange(Sender: TObject);
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

uses Cad_Grupo, Data_Module, Tela_Principal;

procedure TListaGrupos.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabGrupo.Delete;
end;

procedure TListaGrupos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabGrupo.Cancel;
    gpGrupo.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaGrupos.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabGrupo.Edit;
    gpGrupo.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpGrupoDescricao.SetFocus;
end;

procedure TListaGrupos.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaGrupos.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpGrupoDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbpGrupoDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabGrupo.Post;
      dm.FDTabGrupo.Close;
      ShowMessage('Grupo editado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpGrupo.Enabled      := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabGrupo.Open;
      dm.FDTabGrupo.Refresh;
      dm.FDTabGrupo.Last;
    end;
end;

procedure TListaGrupos.HabilitaCampos; // habilitar campos
begin
    dbpGrupoDescricao.Enabled            := True;
end;

procedure TListaGrupos.DesabilitaCampos; // desabilitar campos
begin
    dbpGrupoDescricao.Enabled            := False;
end;

procedure TListaGrupos.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epGrupoDescricao.Enabled            := False;
end;

procedure TListaGrupos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epGrupoDescricao.Enabled            := True;
end;

procedure TListaGrupos.Filtro; // pesquisa com sql query
begin
  qryGrupo.ParamByName('descricao').AsString := '%' + epGrupoDescricao.Text + '%';

  qryGrupo.Close;
  qryGrupo.Open;
end;

procedure TListaGrupos.FormShow(Sender: TObject);
begin
  dm.FDTabGrupo.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaGrupos.epGrupoDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

end.
