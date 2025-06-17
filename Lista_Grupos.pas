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
    Panel4: TPanel;
    dbNavGrupo: TDBNavigator;
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
    qryUpdateGrupo: TFDQuery;
    qryDelete: TFDQuery;
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
var
  resposta: Integer;
begin
  if Trim(dbpGrupoID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para excluir!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;

  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpGrupoDescricao.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    try
      dm.FDTabGrupo.Open;
      qryDelete.ParamByName('id').AsInteger := StrToInt(dbpGrupoID.Text);
      qryDelete.ExecSQL;
      MessageBox(0, 'Grupo excluído com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
    except
        MessageBox(0, 'Grupo está sendo utilizado em outro registro!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TListaGrupos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  if dm.FDTabGrupo.State in [dsEdit, dsInsert] then
  begin
    dm.FDTabGrupo.Cancel;
  end;
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabGrupo.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaGrupos.SBeditarClick(Sender: TObject); // botão de editar
begin
  if Trim(dbpGrupoID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para editar!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabGrupo.Open;
    dm.FDTabGrupo.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpGrupoDescricao.SetFocus;
end;

procedure TListaGrupos.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TListaGrupos.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpGrupoDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpGrupoDescricao.SetFocus;
      end
  else
    begin
    try
      qryUpdateGrupo.ParamByName('descricao').AsString := dbpGrupoDescricao.Text;
      qryUpdateGrupo.ParamByName('id').AsInteger := StrToInt(dbpGrupoID.Text);
      qryUpdateGrupo.ExecSQL;
      dm.FDTabGrupo.Close;
      MessageBox(0, 'Grupo editado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabGrupo.Open;
      dm.FDTabGrupo.Refresh;
      dm.FDTabGrupo.Last;
      Filtro;
    except
      MessageBox(0, PChar('O Grupo "' + dbpGrupoDescricao.Text + '" já foi cadastrado!'), 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      dbpGrupoDescricao.SetFocus;
    end;
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
    dbNavGrupo.Enabled                  := False;
    gpGrupo.Enabled                     := False;
end;

procedure TListaGrupos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epGrupoDescricao.Enabled            := True;
    dbNavGrupo.Enabled                  := True;
    gpGrupo.Enabled                     := True;
end;

procedure TListaGrupos.Filtro; // pesquisa com sql query
begin
  qryGrupo.ParamByName('descricao').AsString := '%' + Trim(epGrupoDescricao.Text) + '%';

  qryGrupo.Close;
  qryGrupo.Open;
end;

procedure TListaGrupos.FormShow(Sender: TObject);
begin
  Filtro;
  epGrupoDescricao.SetFocus;

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
