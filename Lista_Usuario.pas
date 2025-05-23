unit Lista_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Mask;

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
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Panel15: TPanel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel17: TPanel;
    Panel11: TPanel;
    Label8: TLabel;
    Edit1: TEdit;
    Panel18: TPanel;
    Label6: TLabel;
    Edit2: TEdit;
    Panel19: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
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
    procedure Edit2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaUsuario: TListaUsuario;

implementation

{$R *.dfm}

uses Cad_Usuario, Data_Module;

procedure TListaUsuario.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabUsuario.Delete;
end;

procedure TListaUsuario.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabUsuario.Cancel;
    DBGrid1.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaUsuario.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabUsuario.Edit;
    DBGrid1.Enabled      := False;
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
      ShowMessage('Usuário editado com sucesso!');
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

procedure TListaUsuario.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    CheckBox1.Enabled          := True;
end;

procedure TListaUsuario.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    CheckBox1.Enabled          := False;
end;

procedure TListaUsuario.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    CheckBox2.Enabled        := False;
end;

procedure TListaUsuario.Edit1Change(Sender: TObject); // pesquisa código
begin
    dm.FDTabColaborador.Locate('id', Edit1.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaUsuario.Edit2Change(Sender: TObject); // pesquisa descricao
begin
    dm.FDTabColaborador.Locate('descricao', Edit2.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaUsuario.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    CheckBox2.Enabled        := True;
end;

end.
