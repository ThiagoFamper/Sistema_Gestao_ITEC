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
    gEntrada: TDBGrid;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    Panel4: TPanel;
    Panel12: TPanel;
    Label9: TLabel;
    dbEntradaID: TDBEdit;
    Panel13: TPanel;
    Label6: TLabel;
    dbEntradaCod: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    cbEntradaDescricao: TDBLookupComboBox;
    Panel15: TPanel;
    Label12: TLabel;
    cbEntradaOperador: TDBLookupComboBox;
    Panel16: TPanel;
    Label13: TLabel;
    dbEntradaQtd: TDBEdit;
    Panel18: TPanel;
    Label2: TLabel;
    dbEntradaNF: TDBEdit;
    Panel19: TPanel;
    Label4: TLabel;
    dbEntradaValor: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    eEntradaEstoque: TEdit;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
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
  TelaPrincipal.habilitaMenu;
  dm.FDTabEntrada.Cancel;
end;

procedure TEntradaProd.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabEntrada.Open;
  dm.FDTabEntrada.Append;
  dbEntradaCod.SetFocus;
end;

procedure TEntradaProd.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEntrada); // botão de pesquisar
end;

procedure TEntradaProd.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TEntradaProd.SBsalvarClick(Sender: TObject); // botão de salvar
var
  produtoID, quantidade: Integer;
begin
    if dbEntradaCod.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        dbEntradaCod.SetFocus;
      end
  else
    if cbEntradaOperador.Text = '' then
      begin
        ShowMessage('O campo "Operador" deve ser preenchido!');
        cbEntradaOperador.SetFocus;
      end
    else
    if dbEntradaNF.Text = '' then
      begin
        ShowMessage('O campo "Nota Fiscal" deve ser preenchido!');
        dbEntradaNF.SetFocus;
      end
  else
    if dbEntradaValor.Text = '' then
      begin
        ShowMessage('O campo "Valor Unitário" deve ser preenchido!');
        dbEntradaValor.SetFocus;
      end
  else
    if dbEntradaQtd.Text = '' then
      begin
        ShowMessage('O campo "Quantidade" deve ser preenchido!');
        dbEntradaQtd.SetFocus;
      end
  else
    begin
      dm.FDTabEntrada.Post;

      produtoID := StrToInt(dbEntradaCod.Text);
      quantidade := StrToInt(dbEntradaQtd.Text);

      qryVerifica.Close;
      qryVerifica.ParamByName('produto_id').AsInteger := produtoID;
      qryVerifica.Open;

      if qryVerifica.FieldByName('qtd').AsInteger > 0 then
      begin
        qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
        qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
        qryUpdateEstoque.ExecSQL;
      end
      else
      begin
        qryInsertEstoque.ParamByName('produto_id').AsInteger := produtoID;
        qryInsertEstoque.ParamByName('quantidade').AsInteger := quantidade;
        qryInsertEstoque.ExecSQL;
      end;

      dm.FDTabEntrada.Close;
      dm.FDTabEstoque.Close;
      ShowMessage('Entrada cadastrada com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
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

procedure TEntradaProd.HabilitaCampos; // habilitar campos
begin
    dbEntradaCod.Enabled       := True;
    dbEntradaNF.Enabled        := True;
    dbEntradaValor.Enabled     := True;
    dbEntradaQtd.Enabled       := True;
    cbEntradaOperador.Enabled  := True;
end;

procedure TEntradaProd.DesabilitaCampos; // desabilitar campos
begin
    dbEntradaCod.Enabled       := False;
    dbEntradaNF.Enabled        := False;
    dbEntradaValor.Enabled     := False;
    dbEntradaQtd.Enabled       := False;
    cbEntradaOperador.Enabled  := False;
end;

end.
