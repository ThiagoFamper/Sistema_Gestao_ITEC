unit Tela_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaEmprestimo = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbEmpID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbEmpCod: TDBEdit;
    Panel9: TPanel;
    bEmp: TButton;
    Panel10: TPanel;
    Label4: TLabel;
    dbEmpQtd: TEdit;
    Panel15: TPanel;
    Label5: TLabel;
    cbEmpOperador: TDBLookupComboBox;
    Panel19: TPanel;
    Label16: TLabel;
    Panel29: TPanel;
    Label15: TLabel;
    dbEmpDescricao: TDBEdit;
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
    gEmp: TDBGrid;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    cbEmpColaborador: TDBLookupComboBox;
    FDTabColaboradorClone: TFDTable;
    dsColaboradorClone: TDataSource;
    FDTabColaboradorCloneid: TLargeintField;
    FDTabColaboradorClonedescricao: TWideStringField;
    FDTabColaboradorClonecargo: TWideStringField;
    FDTabColaboradorClonesetor_id: TLargeintField;
    FDTabColaboradorClonesede_id: TLargeintField;
    procedure SBcancelarClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtro;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCamposPesquisa;
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure bEmpClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Emprestimo, Tela_Principal;

procedure TTelaEmprestimo.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  Filtro;
end;

procedure TTelaEmprestimo.SBcancelarClick(Sender: TObject);
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    gEmp.Enabled         := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    bEmp.Enabled         := False;
    dm.FDTabEmprestimoProd.Cancel;
    dm.FDTabEmprestimoItem.Cancel;
end;

procedure TTelaEmprestimo.SBeditarClick(Sender: TObject);
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    gEmp.Enabled         := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    bEmp.Enabled         := True;
    dm.FDTabEmprestimoProd.Open;
    dm.FDTabEmprestimoProd.Append;
    dm.FDTabEmprestimoItem.Open;
    dm.FDTabEmprestimoItem.Append;
    cbEmpOperador.SetFocus;
end;

procedure TTelaEmprestimo.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioEmprestimo) then
    Application.CreateForm(TRelatorioEmprestimo, RelatorioEmprestimo);

  RelatorioEmprestimo.ShowModal;
end;

procedure TTelaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaEmprestimo.HabilitaCampos; // habilitar campos
begin
    cbEmpOperador.Enabled      := True;
    dbEmpQtd.Enabled           := True;
    cbEmpColaborador.Enabled   := True;
end;

procedure TTelaEmprestimo.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
    gEmp.Enabled                 := True;
end;

procedure TTelaEmprestimo.bEmpClick(Sender: TObject);
var
  produtoID, quantidade, saldoAtual, emprestimoID: Integer;
begin
    if cbEmpOperador.Text = '' then
      begin
        ShowMessage('O campo "Operador" deve ser preenchido!');
        cbEmpOperador.SetFocus;
      end
  else
    if cbEmpColaborador.Text = '' then
      begin
        ShowMessage('O campo "Colaborador" deve ser preenchido!');
        cbEmpColaborador.SetFocus;
      end
  else
    if dbEmpQtd.Text = '' then
      begin
        ShowMessage('O campo "Quantidade" deve ser preenchido!');
        dbEmpQtd.SetFocus;
      end
  else
    begin
      produtoID := StrToInt(dbEmpID.Text);
      quantidade := StrToInt(dbEmpQtd.Text);

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
      ShowMessage('Saldo insuficiente para este empréstimo!');
      Exit;
    end;

      dm.FDTabEmprestimoProd.FieldByName('saldo').AsInteger := quantidade;
      dm.FDTabEmprestimoProd.FieldByName('quantidade').AsInteger := quantidade;
      dm.FDTabEmprestimoProd.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabEmprestimoProd.FieldByName('operador').AsInteger := cbEmpOperador.KeyValue;
      dm.FDTabEmprestimoProd.FieldByName('colaborador_id').AsInteger := cbEmpColaborador.KeyValue;
      dm.FDTabEmprestimoProd.Post;
      dm.FDTabEmprestimoProd.Refresh;
      dm.FDTabEmprestimoProd.Last;

      emprestimoID := dm.FDTabEmprestimoProd.FieldByName('id').AsInteger;

      qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
      qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
      qryUpdateEstoque.ExecSQL;

      qryInsertEstoque.ParamByName('emprestimo_id').AsInteger := emprestimoID;
      qryInsertEstoque.ExecSQL;

      dm.FDTabEmprestimoProd.Close;
      ShowMessage('Empréstimo cadastrado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBcancelar.Enabled   := False;
      SBeditar.Enabled     := True;
      SBrelatorio.Enabled  := True;
      bEmp.Enabled         := False;
      dm.FDTabEmprestimoProd.Open;
      dm.FDTabEmprestimoProd.Refresh;
      dm.FDTabEmprestimoProd.Last;
      Filtro;
    end;
end;

procedure TTelaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
    cbEmpOperador.Enabled      := False;
    dbEmpQtd.Enabled           := False;
    cbEmpColaborador.Enabled   := False;
end;

procedure TTelaEmprestimo.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epProdCod.Enabled            := False;
    epProdDescricao.Enabled      := False;
    epProdModelo.Enabled         := False;
    epProdMarca.Enabled          := False;
    epProdGrupo.Enabled          := False;
    gEmp.Enabled                 := False;
end;

procedure TTelaEmprestimo.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEmprestimo.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEmprestimo.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEmprestimo.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEmprestimo.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaEmprestimo.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + epProdCod.Text + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + epProdDescricao.Text + '%';
  qryProduto.ParamByName('marca').AsString := '%' + epProdModelo.Text + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + epProdMarca.Text + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + epProdGrupo.Text + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

end.
