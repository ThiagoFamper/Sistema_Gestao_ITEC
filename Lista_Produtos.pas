unit Lista_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Mask,
  Vcl.Imaging.pngimage;

type
  TListaProdutos = class(TForm)
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    Panel7: TPanel;
    SBeditar: TSpeedButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel5: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label7: TLabel;
    Edit6: TEdit;
    Panel14: TPanel;
    Label11: TLabel;
    Edit2: TEdit;
    Panel15: TPanel;
    Edit1: TEdit;
    Label10: TLabel;
    Panel16: TPanel;
    Label8: TLabel;
    Edit4: TEdit;
    Panel17: TPanel;
    Label12: TLabel;
    Edit3: TEdit;
    Panel18: TPanel;
    Label9: TLabel;
    Edit5: TEdit;
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
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaProdutos: TListaProdutos;

implementation

{$R *.dfm}

uses Cad_Produto, Data_Module, Relatorio_Produto;

procedure TListaProdutos.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabProduto.Delete;
end;

procedure TListaProdutos.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioProduto, RelatorioProduto);
  RelatorioProduto.ShowModal;
  RelatorioProduto.Free;
end;

procedure TListaProdutos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    DBGrid1.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaProdutos.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBrelatorio.Enabled  := False;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaProdutos.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaProdutos.SBsalvarClick(Sender: TObject); // botão de salvar
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
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O Campo "Grupo" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      ShowMessage('Editado com Sucesso!');
      DesabilitaCampos();
      HabilitaCamposPesquisa();
      DBGrid1.Enabled      := True;
      SBrelatorio.Enabled  := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaProdutos.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TListaProdutos.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TListaProdutos.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit3.Enabled            := False;
    Edit4.Enabled            := False;
    Edit5.Enabled            := False;
end;

procedure TListaProdutos.Edit1Change(Sender: TObject); // pesquisa código
begin
    dm.FDTabProduto.Locate('cod_produto', Edit1.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaProdutos.Edit2Change(Sender: TObject); // pesquisa descricao
begin
    dm.FDTabProduto.Locate('descricao', Edit2.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaProdutos.Edit3Change(Sender: TObject); // pesquisa grupo
begin
    dm.FDTabProduto.Locate('grupo', Edit3.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaProdutos.Edit4Change(Sender: TObject); // pesquisa modelo
begin
    dm.FDTabProduto.Locate('modelo', Edit4.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaProdutos.Edit5Change(Sender: TObject); // pesquisa marca
begin
    dm.FDTabProduto.Locate('marca', Edit5.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaProdutos.HabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit3.Enabled            := True;
    Edit4.Enabled            := True;
    Edit5.Enabled            := True;
end;

end.
