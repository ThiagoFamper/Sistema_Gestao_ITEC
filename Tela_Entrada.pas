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
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    Panel4: TPanel;
    dbNavEntrada: TDBNavigator;
    gEntrada: TDBGrid;
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
    SBestoque: TSpeedButton;
    gpEntrada: TGridPanel;
    Panel3: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbEntradaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbEntradaCod: TDBEdit;
    Panel29: TPanel;
    Label15: TLabel;
    dbEntradaDescricao: TDBEdit;
    Panel9: TPanel;
    bEntrada: TButton;
    Panel21: TPanel;
    Label19: TLabel;
    dbEntradaValor: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    dbEntradaNF: TDBEdit;
    Panel10: TPanel;
    Label4: TLabel;
    dbEntradaQtd: TDBEdit;
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
    procedure SBestoqueClick(Sender: TObject);
    procedure dbEntradaValorKeyPress(Sender: TObject; var Key: Char);
    procedure dbEntradaQtdKeyPress(Sender: TObject; var Key: Char);
    procedure Panel9Resize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEntrada: TTelaEntrada;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Entrada, Tela_Principal, Lista_Estoque;

procedure TTelaEntrada.SBcancelarClick(Sender: TObject);
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBestoque.Enabled    := True;
    SBcancelar.Enabled   := False;
    bEntrada.Enabled     := False;
    dm.FDTabEntrada.Cancel;
end;

procedure TTelaEntrada.SBeditarClick(Sender: TObject);
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    SBestoque.Enabled    := False;
    bEntrada.Enabled     := True;
    dm.FDTabEntrada.Open;
    dm.FDTabEntrada.Append;
    dbEntradaNF.SetFocus;
end;

procedure TTelaEntrada.SBestoqueClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEstoque); // botão de pesquisar
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
    dbEntradaNF.Enabled            := True;
    dbEntradaValor.Enabled         := True;
    dbEntradaQtd.Enabled           := True;
end;

procedure TTelaEntrada.bEntradaClick(Sender: TObject);
var
  produtoID, quantidade: Integer;
begin
    if Trim(dbEntradaNF.Text) = '' then
      begin
        MessageBox(0, 'O campo "Nota Fiscal" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEntradaNF.SetFocus;
      end
  else
    if Trim(dbEntradaValor.Text) = '' then
      begin
        MessageBox(0, 'O campo "Valor Unitário" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEntradaValor.SetFocus;
      end
  else
    if StrToInt(dbEntradaValor.Text) <= 0 then
      begin
        MessageBox(0, 'O campo "Valor Unitário" não pode ser menor ou igual a 0!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEntradaValor.SetFocus;
      end
  else
    if Trim(dbEntradaQtd.Text) = '' then
      begin
        MessageBox(0, 'O campo "Quantidade" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEntradaQtd.SetFocus;
      end
  else
    if StrToInt(dbEntradaQtd.Text) <= 0 then
      begin
        MessageBox(0, 'O campo "Quantidade" não pode ser menor ou igual a 0!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEntradaQtd.SetFocus;
      end
  else
    begin

      produtoID := StrToInt(dbEntradaID.Text);
      quantidade := StrToInt(dbEntradaQtd.Text);

      dm.FDTabEntrada.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabEntrada.FieldByName('operador').AsInteger := TelaPrincipal.usuarioID;
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
      MessageBox(0, 'Entrada realizada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      HabilitaCamposPesquisa;
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBestoque.Enabled    := True;
      SBcancelar.Enabled   := False;
      SBrelatorio.Enabled  := True;
      bEntrada.Enabled     := False;
      dm.FDTabEntrada.Open;
      dm.FDTabEntrada.Refresh;
      dm.FDTabEntrada.Last;
      Filtro;
    end;
end;



procedure TTelaEntrada.dbEntradaQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-' then
  begin
    Key := #0;
  end;
end;

procedure TTelaEntrada.dbEntradaValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-' then
  begin
    Key := #0;
  end;
end;

procedure TTelaEntrada.DesabilitaCampos; // desabilitar campos
begin
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
    gEntrada.Enabled             := False;
    dbNavEntrada.Enabled         := False;
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
    gEntrada.Enabled             := True;
    dbNavEntrada.Enabled         := True;
end;

procedure TTelaEntrada.Panel9Resize(Sender: TObject);
begin
  // Centraliza horizontalmente o botão dentro do painel
  bEntrada.Left := (Panel9.Width - bEntrada.Width) div 2;
  // Centraliza verticalmente o botão dentro do painel
  bEntrada.Top := (Panel9.Height - bEntrada.Height * 2) div 1;
end;

procedure TTelaEntrada.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + Trim(epProdCod.Text) + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + Trim(epProdDescricao.Text) + '%';
  qryProduto.ParamByName('marca').AsString := '%' + Trim(epProdModelo.Text) + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + Trim(epProdMarca.Text) + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + Trim(epProdGrupo.Text) + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TTelaEntrada.FormShow(Sender: TObject);
begin
  Filtro;
  // Centraliza horizontalmente o botão dentro do painel
    bEntrada.Left := (Panel9.Width - bEntrada.Width) div 2;
  // Centraliza verticalmente o botão dentro do painel
    bEntrada.Top := (Panel9.Height - bEntrada.Height * 2) div 1;
end;

end.
