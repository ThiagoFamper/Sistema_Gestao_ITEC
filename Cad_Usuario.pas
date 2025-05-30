unit Cad_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadUsuario = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    gUsuario: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbUsuarioID: TDBEdit;
    Panel11: TPanel;
    Label5: TLabel;
    dbUsuarioNome: TDBEdit;
    Panel12: TPanel;
    Label2: TLabel;
    dbUsuarioLogin: TDBEdit;
    Panel13: TPanel;
    Label3: TLabel;
    dbUsuarioSenha: TDBEdit;
    Panel14: TPanel;
    cbUsuarioAdmin: TCheckBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUsuario: TCadUsuario;

implementation

{$R *.dfm}

uses Lista_Usuario, Data_Module, Tela_Principal;

procedure TCadUsuario.SBcancelarClick(Sender: TObject); // bot„o de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  TelaPrincipal.habilitaMenu;
  dm.FDTabUsuario.Cancel;
end;

procedure TCadUsuario.SBnovoClick(Sender: TObject); // bot„o de novo
begin
  HabilitaCampos();
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabUsuario.Open;
  dm.FDTabUsuario.Append;
  dbUsuarioNome.SetFocus;
end;

procedure TCadUsuario.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaUsuario); // bot„o de pesquisar
  dm.FDTabUsuario.Open;
  TelaPrincipal.AbrirFormulario(TListaUsuario); // bot„o de pesquisar
end;

procedure TCadUsuario.SBsairClick(Sender: TObject);
begin
  close(); // bot„o de sair
end;

procedure TCadUsuario.SBsalvarClick(Sender: TObject); // bot„o de salvar
begin
    if dbUsuarioNome.Text = '' then
      begin
        ShowMessage('O campo "Nome" deve ser preenchido!');
        dbUsuarioNome.SetFocus;
      end
  else
    if dbUsuarioLogin.Text = '' then
      begin
        ShowMessage('O campo "Login" deve ser preenchido!');
        dbUsuarioLogin.SetFocus;
      end
  else
    if dbUsuarioSenha.Text = '' then
      begin
        ShowMessage('O campo "Senha" deve ser preenchido!');
        dbUsuarioSenha.SetFocus;
      end
  else
    begin
      dm.FDTabUsuario.FieldByName('Admin').AsBoolean := cbUsuarioAdmin.Checked;
      dm.FDTabUsuario.Post;
      dm.FDTabUsuario.Close;
      ShowMessage('Usu·rio cadastrado com sucesso!');
      ShowMessage('Usu√°rio cadastrado com sucesso!');
      TelaPrincipal.habilitaMenu;
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabUsuario.Open;
      dm.FDTabUsuario.Refresh;
      dm.FDTabUsuario.Last;
    end;

end;

procedure TCadUsuario.HabilitaCampos; // habilitar campos
begin
    dbUsuarioNome.Enabled           := True;
    dbUsuarioLogin.Enabled          := True;
    dbUsuarioSenha.Enabled          := True;
    cbUsuarioAdmin.Enabled          := True;
end;

procedure TCadUsuario.DesabilitaCampos; // desabilitar campos
begin
    dbUsuarioNome.Enabled           := False;
    dbUsuarioLogin.Enabled          := False;
    dbUsuarioSenha.Enabled          := False;
    cbUsuarioAdmin.Enabled          := False;
end;

end.
