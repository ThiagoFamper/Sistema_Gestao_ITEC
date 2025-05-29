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
    gpUsuario: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpUsuarioID: TDBEdit;
    Panel14: TPanel;
    dbpUsuarioNome: TDBEdit;
    Label5: TLabel;
    Panel15: TPanel;
    Label2: TLabel;
    dbpUsuarioLogin: TDBEdit;
    Panel16: TPanel;
    Label4: TLabel;
    dbpUsuarioSenha: TDBEdit;
    Panel17: TPanel;
    Panel11: TPanel;
    Label8: TLabel;
    epUsuarioNome: TEdit;
    Panel18: TPanel;
    Label6: TLabel;
    epUsuarioLogin: TEdit;
    Panel19: TPanel;
    dbpUsuarioAdmin: TCheckBox;
    cbpUsuarioAdmin: TCheckBox;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
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
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabUsuario.Delete;
end;

procedure TListaUsuario.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabUsuario.Cancel;
    gpUsuario.Enabled    := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaUsuario.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabUsuario.Edit;
    gpUsuario.Enabled    := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaUsuario.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaUsuario.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpUsuarioNome.Text = '' then
      begin
        ShowMessage('O Campo "Nome" deve ser preenchido!');
        dbpUsuarioNome.SetFocus;
      end
  else
    if dbpUsuarioLogin.Text = '' then
      begin
        ShowMessage('O Campo "Login" deve ser preenchido!');
        dbpUsuarioLogin.SetFocus;
      end
  else
    if dbpUsuarioSenha.Text = '' then
      begin
        ShowMessage('O Campo "Senha" deve ser preenchido!');
        dbpUsuarioSenha.SetFocus;
      end
  else
    begin
      dm.FDTabUsuario.FieldByName('Admin').AsBoolean := dbpUsuarioAdmin.Checked;
      dm.FDTabUsuario.Post;
      dm.FDTabUsuario.Close;
      ShowMessage('Usuário editado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpUsuario.Enabled    := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabUsuario.Open;
      dm.FDTabUsuario.Refresh;
      dm.FDTabUsuario.Close;
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
  qryUsuario.ParamByName('nome').AsString := '%' + epUsuarioNome.Text + '%';
  qryUsuario.ParamByName('login').AsString := '%' + epUsuarioLogin.Text + '%';
  qryUsuario.ParamByName('admin').AsBoolean := cbpUsuarioAdmin.Checked;

  qryUsuario.Close;
  qryUsuario.Open;
end;

procedure TListaUsuario.FormShow(Sender: TObject);
begin
  dm.FDTabUsuario.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaUsuario.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epUsuarioNome.Enabled          := True;
    epUsuarioLogin.Enabled         := True;
    cbpUsuarioAdmin.Enabled        := True;
end;

end.
