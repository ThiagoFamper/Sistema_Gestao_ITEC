unit Tela_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaEntrada = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbEntradaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbEntradaCod: TDBEdit;
    Panel1: TPanel;
    Panel23: TPanel;
    Label7: TLabel;
    eEntradaCod: TEdit;
    Panel24: TPanel;
    Label1: TLabel;
    eEntradaDescricao: TEdit;
    Panel25: TPanel;
    Label2: TLabel;
    eEntradaMarca: TEdit;
    Panel26: TPanel;
    Label3: TLabel;
    eEntradaModelo: TEdit;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    gEntrada: TDBGrid;
    Panel9: TPanel;
    bEntrada: TButton;
    Panel21: TPanel;
    Label19: TLabel;
    Panel19: TPanel;
    Label18: TLabel;
    Panel10: TPanel;
    Label4: TLabel;
    Panel15: TPanel;
    Label5: TLabel;
    cbEntradaOperador: TDBLookupComboBox;
    Panel16: TPanel;
    Label6: TLabel;
    eEntradaGrupo: TEdit;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    dbEntradaNF: TDBEdit;
    dbEntradaValor: TDBEdit;
    dbEntradaQtd: TDBEdit;
    Panel17: TPanel;
    Panel18: TPanel;
    Label8: TLabel;
    epProdCod: TEdit;
    Panel20: TPanel;
    Label9: TLabel;
    epProdDescricao: TEdit;
    Panel22: TPanel;
    Label10: TLabel;
    epProdMarca: TEdit;
    Panel27: TPanel;
    Label13: TLabel;
    epProdModelo: TEdit;
    Panel28: TPanel;
    Label14: TLabel;
    epProdGrupo: TEdit;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    Panel29: TPanel;
    Label15: TLabel;
    dbEntradaDescricao: TDBEdit;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCamposPesquisa;
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure bEntradaClick(Sender: TObject);
    procedure Filtro;
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEntrada: TTelaEntrada;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Entrada, Tela_Principal;

procedure TTelaEntrada.SBcancelarClick(Sender: TObject);
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    gEntrada.Enabled     := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    bEntrada.Enabled     := False;
    dm.FDTabEntrada.Cancel;
end;

procedure TTelaEntrada.SBeditarClick(Sender: TObject);
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    gEntrada.Enabled     := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    bEntrada.Enabled     := True;
    dm.FDTabEntrada.Open;
    dm.FDTabEntrada.Append;
    cbEntradaOperador.SetFocus;
end;

procedure TTelaEntrada.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioEntrada) then
    Application.CreateForm(TRelatorioEntrada, RelatorioEntrada);

  RelatorioEntrada.ShowModal;
end;

procedure TTelaEntrada.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaEntrada.HabilitaCampos; // habilitar campos
begin
    cbEntradaOperador.Enabled      := True;
    dbEntradaNF.Enabled            := True;
    dbEntradaValor.Enabled         := True;
    dbEntradaQtd.Enabled           := True;
end;

procedure TTelaEntrada.bEntradaClick(Sender: TObject);
var
  produtoID, quantidade: Integer;
begin
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

      produtoID := StrToInt(dbEntradaID.Text);
      quantidade := StrToInt(dbEntradaQtd.Text);

      dm.FDTabEntrada.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabEntrada.Post;

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
      DesabilitaCampos;
      HabilitaCamposPesquisa;
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBrelatorio.Enabled  := True;
      bEntrada.Enabled     := False;
      dm.FDTabEntrada.Open;
      dm.FDTabEntrada.Refresh;
      dm.FDTabEntrada.Last;
      Filtro;
    end;
end;

procedure TTelaEntrada.DesabilitaCampos; // desabilitar campos
begin
    cbEntradaOperador.Enabled      := False;
    dbEntradaNF.Enabled            := False;
    dbEntradaValor.Enabled         := False;
    dbEntradaQtd.Enabled           := False;
end;

procedure TTelaEntrada.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epProdCod.Enabled            := False;
    epProdDescricao.Enabled      := False;
    epProdModelo.Enabled         := False;
    epProdMarca.Enabled          := False;
    epProdGrupo.Enabled          := False;
end;

procedure TTelaEntrada.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEntrada.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEntrada.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEntrada.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEntrada.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEntrada.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
end;

procedure TTelaEntrada.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + epProdCod.Text + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + epProdDescricao.Text + '%';
  qryProduto.ParamByName('marca').AsString := '%' + epProdModelo.Text + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + epProdMarca.Text + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + epProdGrupo.Text + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TTelaEntrada.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  Filtro;
end;

end.
