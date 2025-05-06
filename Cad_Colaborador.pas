unit Cad_Colaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TCadColaborador = class(TForm)
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
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
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel11: TPanel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Panel12: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel13: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Panel14: TPanel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
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
  CadColaborador: TCadColaborador;

implementation

{$R *.dfm}

uses Cad_Setor, Lista_Colaborador, Data_Module, Tela_Principal;

procedure TCadColaborador.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabColaborador.Cancel;
  LimpaCampos();
end;

procedure TCadColaborador.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabColaborador.Insert;
  dm.FDTabColaborador.Append;
  DBEdit2.SetFocus;
end;

procedure TCadColaborador.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaColaborador); // botão de pesquisar
end;

procedure TCadColaborador.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadColaborador.SBsalvarClick(Sender: TObject); // botão de salvar
begin
  if SBnovo.Enabled = True then
    begin
      ShowMessage('Cadastro não está em modo de inclusão. Realize o Cadastro agora');
      SBnovo.Click;
    end
  else
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido !');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido !');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Cargo" deve ser preenchido !');
        DBEdit4.SetFocus;
      end
  else
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O Campo "Setor" deve ser preenchido !');
        DBLookupComboBox1.SetFocus;
      end
  else
    begin
      dm.FDTabColaborador.Post;
      dm.FDTabColaborador.Close;
      dm.FDTabColaborador.Open;
      dm.FDTabColaborador.Last;
      ShowMessage('Cadastrado com Sucesso!');
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
procedure TCadColaborador.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit3.SetFocus;
end;

procedure TCadColaborador.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TCadColaborador.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBLookupComboBox1.SetFocus;
end;

procedure TCadColaborador.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TCadColaborador.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TCadColaborador.LimpaCampos; // limpar campos
begin
    DBEdit1.Clear;
    DBEdit2.Clear;
    DBEdit3.Clear;
    DBEdit4.Clear;
    DBLookupComboBox1.KeyValue := 0;
end;

end.
