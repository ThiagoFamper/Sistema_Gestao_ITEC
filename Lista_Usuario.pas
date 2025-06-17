unit Lista_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TListaUsuario = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel4: TPanel;
    dbNavUsuario: TDBNavigator;
    Panel3: TPanel;
    gpUsuario: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpUsuarioID: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    Panel15: TPanel;
    Label2: TLabel;
    dbpUsuarioLogin: TDBEdit;
    Panel16: TPanel;
    Label4: TLabel;
    dbpUsuarioSenha: TDBEdit;
    Panel11: TPanel;
    Label8: TLabel;
    epUsuarioNome: TEdit;
    Panel18: TPanel;
    Label6: TLabel;
    epUsuarioLogin: TEdit;
    Panel19: TPanel;
    cbpUsuarioAdmin: TCheckBox;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    SBeditar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsair: TSpeedButton;
    dbpUsuarioNome: TDBLookupComboBox;
    qryUpdateUsuario: TFDQuery;
    Panel7: TPanel;
    dbpUsuarioAdmin: TDBCheckBox;
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
    procedure FormShow(Sender: TObject);
    procedure Filtro;
    procedure epUsuarioNomeChange(Sender: TObject);
    procedure epUsuarioLoginChange(Sender: TObject);
    procedure cbpUsuarioAdminClick(Sender: TObject);
    procedure gpUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaUsuario: TListaUsuario;

implementation

{$R *.dfm}

uses Cad_Usuario, Data_Module, Tela_Principal;

procedure TListaUsuario.SBexcluirClick(Sender: TObject); // botão de excluir
var
  resposta: Integer;
begin
  if Trim(dbpUsuarioID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para excluir!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;

  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpUsuarioNome.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
      qryDelete.ParamByName('id').AsInteger := StrToInt(dbpUsuarioID.Text);
      qryDelete.ExecSQL;
      MessageBox(0, 'Usuário excluído com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
  end;
end;

procedure TListaUsuario.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabUsuario.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaUsuario.SBeditarClick(Sender: TObject); // botão de editar
begin
  if Trim(dbpUsuarioID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para editar!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabUsuario.Open;
    dm.FDTabUsuario.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpUsuarioNome.SetFocus;
end;

procedure TListaUsuario.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TListaUsuario.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpUsuarioNome.Text) = '' then
      begin
        MessageBox(0, 'O campo "Nome" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpUsuarioNome.SetFocus;
      end
  else
    if Trim(dbpUsuarioLogin.Text) = '' then
      begin
        MessageBox(0, 'O campo "Login" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpUsuarioLogin.SetFocus;
      end
  else
    if Trim(dbpUsuarioSenha.Text) = '' then
      begin
        MessageBox(0, 'O campo "Senha" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpUsuarioSenha.SetFocus;
      end
  else
    begin
    try
      qryUpdateUsuario.ParamByName('nome').AsInteger := dbpUsuarioNome.KeyValue;
      qryUpdateUsuario.ParamByName('login').AsString := dbpUsuarioLogin.Text;
      qryUpdateUsuario.ParamByName('senha').AsString := dbpUsuarioSenha.Text;
      qryUpdateUsuario.ParamByName('admin').AsBoolean := dbpUsuarioAdmin.Checked;
      qryUpdateUsuario.ParamByName('id').AsInteger := StrToInt(dbpUsuarioID.Text);
      qryUpdateUsuario.ExecSQL;
      dm.FDTabUsuario.Close;
      MessageBox(0, 'Usuário editado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabUsuario.Open;
      dm.FDTabUsuario.Refresh;
      dm.FDTabUsuario.Close;
      Filtro;
    except
      MessageBox(0, PChar('O Login "' + dbpUsuarioLogin.Text + '" já foi cadastrado!'), 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      dbpUsuarioLogin.SetFocus;
    end;
    end;
end;

procedure TListaUsuario.HabilitaCampos; // habilitar campos
begin
    dbpUsuarioNome.Enabled            := True;
    dbpUsuarioLogin.Enabled           := True;
    dbpUsuarioSenha.Enabled           := True;
    dbpUsuarioAdmin.Enabled           := True;
end;

procedure TListaUsuario.cbpUsuarioAdminClick(Sender: TObject);
begin
  Filtro;
end;

procedure TListaUsuario.DesabilitaCampos; // desabilitar campos
begin
    dbpUsuarioNome.Enabled            := False;
    dbpUsuarioLogin.Enabled           := False;
    dbpUsuarioSenha.Enabled           := False;
    dbpUsuarioAdmin.Enabled           := False;
end;

procedure TListaUsuario.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epUsuarioNome.Enabled          := False;
    epUsuarioLogin.Enabled         := False;
    cbpUsuarioAdmin.Enabled        := False;
    gpUsuario.Enabled              := False;
    dbNavUsuario.Enabled           := False;
end;

procedure TListaUsuario.epUsuarioNomeChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaUsuario.epUsuarioLoginChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaUsuario.Filtro; // pesquisa com sql query
begin
  qryUsuario.ParamByName('nome').AsString := '%' + Trim(epUsuarioNome.Text) + '%';
  qryUsuario.ParamByName('login').AsString := '%' + Trim(epUsuarioLogin.Text) + '%';
  qryUsuario.ParamByName('admin').AsBoolean := cbpUsuarioAdmin.Checked;

  qryUsuario.Close;
  qryUsuario.Open;
end;

procedure TListaUsuario.FormShow(Sender: TObject);
begin
  dm.FDTabColaborador.Open;
  Filtro;
  epUsuarioNome.SetFocus;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

// desenha sim e não no campo admin
procedure TListaUsuario.gpUsuarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  TextToDraw: string;
begin
  if Column.Title.Caption = 'Usuário é Admin?' then
  begin
    if qryUsuario.FieldByName('admin').AsBoolean then
      TextToDraw := 'Sim'
    else
      TextToDraw := 'Não';

    gpUsuario.Canvas.FillRect(Rect);
    gpUsuario.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TextToDraw);
  end
  else
  begin
    gpUsuario.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TListaUsuario.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epUsuarioNome.Enabled          := True;
    epUsuarioLogin.Enabled         := True;
    cbpUsuarioAdmin.Enabled        := True;
    gpUsuario.Enabled              := True;
    dbNavUsuario.Enabled           := True;
end;

end.
