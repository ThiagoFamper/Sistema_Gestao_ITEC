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
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    FDQuery1: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TTelaLogin.Button1Click(Sender: TObject);
begin
    with FDQuery1 do
    begin
      Close;
      FDQuery1.Params.ParamByName('login').AsString := Edit1.Text;
      FDQuery1.Params.ParamByName('senha').AsString := Edit2.Text;
      Open;

    if IsEmpty then
    begin
      ShowMessage('Login ou Senha inválidos!');
      Exit;
    end
    else
    begin
      Application.CreateForm(TTelaPrincipal, TelaPrincipal);

      TelaPrincipal.usuarioLogado := FieldByName('login').AsString;
      TelaPrincipal.isAdmin := FieldByName('admin').AsBoolean;

      Self.Hide;
      TelaPrincipal.Show;
    end;

    end;
end;

procedure TTelaLogin.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTelaLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edit2.SetFocus;
  end;
end;

procedure TTelaLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Button1.Click;
  end;
end;

procedure TTelaLogin.FormShow(Sender: TObject);
begin
  dm.FDTabUsuario.Open;
  edit1.SetFocus;
end;

end.
