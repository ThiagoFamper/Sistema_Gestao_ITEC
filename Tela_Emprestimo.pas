unit Tela_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TTelaEmprestimo = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel12: TPanel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    Panel16: TPanel;
    Label13: TLabel;
    DBedit4: TDBEdit;
    Panel20: TPanel;
    Label15: TLabel;
    SBnovo: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
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
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

uses Tela_Devolucao, Lista_Emprestimo, Data_Module, Tela_Principal;

procedure TTelaEmprestimo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabProduto.Cancel;
  LimpaCampos();
end;

procedure TTelaEmprestimo.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabProduto.Append;
  DBEdit2.SetFocus;
end;

procedure TTelaEmprestimo.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaEmprestimo); // botão de pesquisar
end;

procedure TTelaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TTelaEmprestimo.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Marca" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
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
procedure TTelaEmprestimo.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TTelaEmprestimo.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit4.Enabled            := True;
end;

procedure TTelaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit4.Enabled            := False;
end;

procedure TTelaEmprestimo.LimpaCampos; // limpar campos
begin
    DBEdit1.Clear;
    DBEdit2.Clear;
    DBEdit4.Clear;
end;

end.
