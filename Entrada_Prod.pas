unit Entrada_Prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TEntradaProd = class(TForm)
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
    FDQueryEstoque: TFDQuery;
    dsFDQueryEstoque: TDataSource;
    FDQueryEstoquesaldo: TIntegerField;
    FDQueryAtualizaEstoque: TFDQuery;
    dsFDQueryAtualizaEstoque: TDataSource;
    FDQueryEntProd: TFDQuery;
    dsFDQueryEntProd: TDataSource;
    Panel4: TPanel;
    Panel12: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel13: TPanel;
    Label6: TLabel;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
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
    DBEdit8: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
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
    procedure DBEdit2Exit(Sender: TObject);

  private
    produto_id: Int64;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntradaProd: TEntradaProd;

implementation

{$R *.dfm}

uses Lista_Entrada, Data_Module, Tela_Principal, Cad_Produto;

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
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O Campo "Operador" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
    else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Quantidade" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    if DBEdit5.Text = '' then
      begin
        ShowMessage('O Campo "Nota Fiscal" deve ser preenchido!');
        DBEdit5.SetFocus;
      end
  else
    if DBedit7.Text = '' then
      begin
        ShowMessage('O Campo "Valor Unitário" deve ser preenchido!');
        DBedit7.SetFocus;
      end
  else
    begin
      if produto_id = 0 then
      begin
        ShowMessage('Erro: Produto não identificado. Verifique o código.');
        Exit;
      end;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      DesabilitaCampos();
      if dm.FDTabEntrada.State in [dsEdit, dsInsert] then
      begin
        dm.FDTabEntradaproduto_id.AsInteger    := produto_id;
        dm.FDTabEntradaoperador.AsString       := DBLookupComboBox1.Text;
        dm.FDTabEntradaquantidade.AsInteger    := StrToInt(DBEdit4.Text);
        dm.FDTabEntradanota_fiscal.AsString    := DBEdit5.Text;
        dm.FDTabEntradavalor_unitario.AsFloat  := StrToFloat(DBEdit7.Text);
      end;

      if dm.FDTabEstoque.State in [dsEdit, dsInsert] then
        dm.FDTabEstoque.Post;

        if DBEdit8.Text = '' then
          begin
            dm.FDTabEstoque.Insert;
            dm.FDTabEstoquecod_produto.AsString := DBEdit2.Text;
            dm.FDTabEstoquesaldo.AsInteger      := StrToInt(DBedit4.Text);
            dm.FDTabEstoque.Post;
          end
        else
        begin
          FDQueryAtualizaEstoque.Close;
          FDQueryAtualizaEstoque.ParamByName('Psaldo').AsInteger      := (StrToIntDef(DBedit4.Text, 0) + StrToIntDef(DBEdit8.Text, 0));
          FDQueryAtualizaEstoque.ParamByName('Pcodproduto').AsString  := DBEdit2.Text;
          FDQueryAtualizaEstoque.ExecSQL;
        end;
        dm.FDTabEstoque.Close;
        dm.FDTabProduto.Close;
        dm.FDTabEntrada.Close;
        dm.FDTabEntrada.Open;
        dm.FDTabEntrada.Refresh;
        dm.FDTabEntrada.Last;
        ShowMessage('Produto cadastrado com sucesso!');
        LimpaCampos();
    end;

end;

// foco com enter
procedure TEntradaProd.DBEdit2Exit(Sender: TObject);
begin
  if DBEdit2.Text <> '' then
    begin
      FDQueryEntProd.Close;
      FDQueryEntProd.ParamByName('Pcodproduto').AsString := DBEdit2.Text;
      FDQueryEntProd.Open;

      FDQueryEstoque.Close;
      FDQueryEstoque.ParamByName('Pcodproduto').AsString  := DBEdit2.Text;
      FDQueryEstoque.Open;

      if FDQueryEntProd.IsEmpty then
        begin
          ShowMessage('Produto não encontrado, por favor digite outro código');
          DBEdit2.Clear;
          DBEdit3.Clear;
          DBEdit2.SetFocus;

          if MessageDlg('Você deseja incluir um Novo Produto?',mtConfirmation,[mbyes,mbno],0)=mryes then
          begin
            CadProduto.ShowModal;
            LimpaCampos;
          end;
        end
      else
      begin
        DBEdit3.Text := FDQueryEntProd.FieldByName('descricao').AsString;
        produto_id   := FDQueryEntProd.FieldByName('id').AsLargeInt;
        DBedit4.SetFocus;
      end;
    end;
end;

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
    DBEdit8.Enabled            := False;
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
