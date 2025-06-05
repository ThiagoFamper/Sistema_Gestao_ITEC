unit Tela_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaLogin = class(TForm)
    lLogin: TLabel;
    lSenha: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    bEntrar: TButton;
    bCancelar: TButton;
    eLogin: TEdit;
    qryUsuario: TFDQuery;
    eSenha: TEdit;
    mostrarSenha: TImage;
    login: TImage;
    senha: TImage;
    esconderSenha: TImage;
    mostrarSenhaClone: TImage;
    procedure bEntrarClick(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eLoginKeyPress(Sender: TObject; var Key: Char);
    procedure eSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure mostrarSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

uses Data_Module, Tela_Principal;

procedure TTelaLogin.bEntrarClick(Sender: TObject);
begin
    with qryUsuario do
    begin
      Close;
      qryUsuario.Params.ParamByName('login').AsString := eLogin.Text;
      qryUsuario.Params.ParamByName('senha').AsString := eSenha.Text;
      Open;

    if IsEmpty then
    begin
      MessageBox(0, 'Login ou Senha inválidos!', 'Controle de Estoque ITEC', MB_OK or MB_ICONWARNING);
      Exit;
    end
    else
    begin
      Application.CreateForm(TTelaPrincipal, TelaPrincipal);

      TelaPrincipal.usuarioLogado := FieldByName('nome').AsString;
      TelaPrincipal.isAdmin := FieldByName('admin').AsBoolean;

      Self.Hide;
      TelaPrincipal.Show;
    end;

    end;
end;

procedure TTelaLogin.bCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTelaLogin.eLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    eSenha.SetFocus;
  end;
end;

procedure TTelaLogin.eSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    bEntrar.Click;
  end;
end;

procedure TTelaLogin.FormShow(Sender: TObject);
begin
  dm.FDTabUsuario.Open;
  eLogin.SetFocus;
end;

procedure TTelaLogin.mostrarSenhaClick(Sender: TObject);
begin
  if eSenha.PasswordChar = '*' then
  begin
    eSenha.PasswordChar := #0;
    mostrarSenha.Picture.Assign(esconderSenha.Picture);
  end
  else
  begin
    eSenha.PasswordChar := '*';
    mostrarSenha.Picture.Assign(mostrarSenhaClone.Picture);
  end;
end;

end.
