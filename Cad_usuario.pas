unit Cad_usuario;

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
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel11: TPanel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel12: TPanel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Panel13: TPanel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Panel14: TPanel;
    CheckBox1: TCheckBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
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

procedure TCadUsuario.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabUsuario.Cancel;
  LimpaCampos();
end;

procedure TCadUsuario.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabUsuario.Open;
  dm.FDTabUsuario.Append;
  DBEdit2.SetFocus;
end;

procedure TCadUsuario.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaUsuario); // botão de pesquisar
end;

procedure TCadUsuario.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadUsuario.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Nome" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Login" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Senha" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    begin
      dm.FDTabUsuario.FieldByName('Admin').AsBoolean := Checkbox1.Checked;
      dm.FDTabUsuario.Post;
      dm.FDTabUsuario.Close;
      ShowMessage('Usuário cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
    end;

end;

// foco com enter
procedure TCadUsuario.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit3.SetFocus;
end;

procedure TCadUsuario.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TCadUsuario.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    CheckBox1.Enabled          := True;
end;

procedure TCadUsuario.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    CheckBox1.Enabled          := False;
end;

procedure TCadUsuario.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    DBEdit3.Clear;
    DBEdit4.Clear;
    CheckBox1.Checked := False;
end;

end.
