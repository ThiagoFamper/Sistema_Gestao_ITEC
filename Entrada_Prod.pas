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
    DBEdit2: TDBEdit;
    FDQuery1: TFDQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
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
  dm.FDTabProduto.Cancel;
  dm.FDTabColaborador.Cancel;
  dm.FDTabEstoque.Cancel;
  dm.FDTabEntrada.Cancel;
  LimpaCampos();
end;

procedure TEntradaProd.SBnovoClick(Sender: TObject); // botão de novo
begin
  dm.FDTabColaborador.Open;
  dm.FDTabEstoque.Open;
  dm.FDTabProduto.Open;
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabEntrada.Open;
  dm.FDTabEntrada.Append;
  dm.FDTabEstoque.Append;
  DBEdit2.SetFocus;
end;

procedure TEntradaProd.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaEntrada); // botão de pesquisar
end;

procedure TEntradaProd.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TEntradaProd.SBsalvarClick(Sender: TObject); // botão de salvar
var
  produtoID, quantidade: Integer;
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
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
      dm.FDTabEntrada.Post;

      produtoID := StrToInt(DBEdit2.Text);
      quantidade := StrToInt(DBEdit4.Text);

      FDQuery1.Close;
      FDQuery1.ParamByName('produto_id').AsInteger := produtoID;
      FDQuery1.Open;

      if FDQuery1.FieldByName('qtd').AsInteger > 0 then
      begin
        FDQuery2.ParamByName('produto_id').AsInteger := produtoID;
        FDQuery2.ParamByName('quantidade').AsInteger := quantidade;
        FDQuery2.ExecSQL;
      end
      else
      begin
        FDQuery3.ParamByName('produto_id').AsInteger := produtoID;
        FDQuery3.ParamByName('quantidade').AsInteger := quantidade;
        FDQuery3.ExecSQL;
      end;

      dm.FDTabEntrada.Close;
      dm.FDTabEstoque.Close;
      ShowMessage('Entrada cadastrada com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabEntrada.Open;
      dm.FDTabEntrada.Refresh;
      dm.FDTabEntrada.Last;
    end;

end;

procedure TEntradaProd.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit2.SetFocus;
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
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit7.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TEntradaProd.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit7.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TEntradaProd.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    Edit1.Clear;
    DBEdit4.Clear;
    DBEdit5.Clear;
    DBEdit7.Clear;
    Edit2.Clear;
    DBLookupComboBox1.KeyValue := 0;
end;

end.
