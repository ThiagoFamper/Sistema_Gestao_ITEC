unit Tela_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaSaida = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbSaidaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbSaidaCod: TDBEdit;
    Panel9: TPanel;
    bSaida: TButton;
    Panel10: TPanel;
    Label4: TLabel;
    Panel15: TPanel;
    Label5: TLabel;
    cbSaidaOperador: TDBLookupComboBox;
    Panel29: TPanel;
    Label15: TLabel;
    dbSaidaDescricaoProd: TDBEdit;
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
    Panel16: TPanel;
    Label6: TLabel;
    eEntradaGrupo: TEdit;
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
    Panel3: TPanel;
    gSaida: TDBGrid;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    Panel19: TPanel;
    Label16: TLabel;
    dbSaidaDescricao: TEdit;
    dbSaidaQtd: TEdit;
    procedure SBcancelarClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure Filtro;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCamposPesquisa;
    procedure FormShow(Sender: TObject);
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure bSaidaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaSaida: TTelaSaida;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Saida, Tela_Principal;

procedure TTelaSaida.SBcancelarClick(Sender: TObject);
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    gSaida.Enabled       := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    bSaida.Enabled       := False;
    dm.FDTabSaida.Cancel;
end;

procedure TTelaSaida.SBeditarClick(Sender: TObject);
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    gSaida.Enabled       := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    bSaida.Enabled       := True;
    dm.FDTabSaida.Open;
    dm.FDTabSaida.Append;
    cbSaidaOperador.SetFocus;
end;

procedure TTelaSaida.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioSaida) then
    Application.CreateForm(TRelatorioSaida, RelatorioSaida);

  RelatorioSaida.ShowModal;
end;

procedure TTelaSaida.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaSaida.HabilitaCampos; // habilitar campos
begin
    cbSaidaOperador.Enabled      := True;
    dbSaidaQtd.Enabled           := True;
    dbSaidaDescricao.Enabled     := True;
end;

procedure TTelaSaida.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
    gSaida.Enabled               := True;
end;

procedure TTelaSaida.bSaidaClick(Sender: TObject);
var
  produtoID, quantidade, saldoAtual: Integer;
begin
    if cbSaidaOperador.Text = '' then
      begin
        ShowMessage('O campo "Operador" deve ser preenchido!');
        cbSaidaOperador.SetFocus;
      end
  else
    if dbSaidaQtd.Text = '' then
      begin
        ShowMessage('O campo "Quantidade" deve ser preenchido!');
        dbSaidaQtd.SetFocus;
      end
  else
    if dbSaidaDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbSaidaQtd.SetFocus;
      end
  else
    begin
      produtoID  := StrToInt(dbSaidaID.Text);
      quantidade := StrToInt(dbSaidaQtd.Text);

      qryVerifica.Close;
      qryVerifica.ParamByName('produto_id').AsInteger := produtoID;
      qryVerifica.Open;

    if qryVerifica.IsEmpty then
    begin
      ShowMessage('Produto não encontrado no estoque!');
      Exit;
    end;

      saldoAtual := qryVerifica.FieldByName('saldo').AsInteger;

    if saldoAtual < quantidade then
    begin
      ShowMessage('Saldo insuficiente para esta saída!');
      Exit;
    end;

      dm.FDTabSaida.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabSaida.FieldByName('quantidade').AsInteger := quantidade;
      dm.FDTabSaida.FieldByName('descricao').AsString   := dbSaidaDescricao.Text;
      dm.FDTabSaida.FieldByName('operador').AsInteger   := cbSaidaOperador.KeyValue;
      dm.FDTabSaida.Post;

      qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
      qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
      qryUpdateEstoque.ExecSQL;

      dm.FDTabSaida.Close;
      ShowMessage('Saida cadastrada com sucesso!');
      DesabilitaCampos;
      HabilitaCamposPesquisa;
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBcancelar.Enabled   := False;
      SBeditar.Enabled     := True;
      SBrelatorio.Enabled  := True;
      bSaida.Enabled       := False;
      dm.FDTabSaida.Open;
      dm.FDTabSaida.Refresh;
      dm.FDTabSaida.Last;
      Filtro;
    end;
end;

procedure TTelaSaida.DesabilitaCampos; // desabilitar campos
begin
    cbSaidaOperador.Enabled      := False;
    dbSaidaQtd.Enabled           := False;
    dbSaidaDescricao.Enabled     := False;
end;

procedure TTelaSaida.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epProdCod.Enabled            := False;
    epProdDescricao.Enabled      := False;
    epProdModelo.Enabled         := False;
    epProdMarca.Enabled          := False;
    epProdGrupo.Enabled          := False;
    gSaida.Enabled               := False;
end;

procedure TTelaSaida.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + epProdCod.Text + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + epProdDescricao.Text + '%';
  qryProduto.ParamByName('marca').AsString := '%' + epProdModelo.Text + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + epProdMarca.Text + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + epProdGrupo.Text + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TTelaSaida.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  Filtro;
end;

end.
