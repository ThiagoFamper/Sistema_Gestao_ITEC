unit Entrada_Prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TEntradaProd = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBGrid1: TDBGrid;
    Panel12: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel13: TPanel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    Panel16: TPanel;
    Label13: TLabel;
    DBedit4: TDBEdit;
    Panel18: TPanel;
    Label2: TLabel;
    DBedit5: TDBEdit;
    Panel19: TPanel;
    Label4: TLabel;
    DBedit7: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
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
  EntradaProd: TEntradaProd;

implementation

{$R *.dfm}

uses Lista_Entrada, Data_Module, Tela_Principal;

procedure TEntradaProd.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabEstoque.Cancel;
  dm.FDTabProduto.Cancel;
  dm.FDTabEntrada.Cancel;
  LimpaCampos();
end;

procedure TEntradaProd.SBnovoClick(Sender: TObject); // botão de novo
begin
  dm.FDTabEstoque.open;
  dm.FDTabProduto.Open;
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabEntrada.Open;
  dm.FDTabEntrada.Append;
  DBEdit2.SetFocus;
end;

procedure TEntradaProd.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabEntrada.Open;
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaEntrada); // botão de pesquisar
end;

procedure TEntradaProd.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TEntradaProd.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Marca" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    if DBEdit5.Text = '' then
      begin
        ShowMessage('O Campo "Modelo" deve ser preenchido!');
        DBEdit5.SetFocus;
      end
  else
    begin
      dm.FDTabEntrada.Post;
      dm.FDTabEstoque.Post;
      dm.FDTabEstoque.Close;
      dm.FDTabProduto.Close;
      dm.FDTabEntrada.Close;
      ShowMessage('Produto cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabEntrada.Open;
      dm.FDTabEntrada.Last;
    end;

end;

// foco com enter
procedure TEntradaProd.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit3.SetFocus;
end;

procedure TEntradaProd.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TEntradaProd.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit5.SetFocus;
end;

procedure TEntradaProd.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit7.Enabled            := True;
    DBEdit8.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TEntradaProd.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit7.Enabled            := False;
    DBEdit8.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TEntradaProd.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    DBEdit3.Clear;
    DBEdit4.Clear;
    DBEdit5.Clear;
    DBEdit7.Clear;
    DBEdit8.Clear;
    DBLookupComboBox1.KeyValue := 0;
end;

end.
