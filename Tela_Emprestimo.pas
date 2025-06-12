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
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    Panel4: TPanel;
    dbNavEmprestimo: TDBNavigator;
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
    gEmp: TDBGrid;
    SBcancelar: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBestoque: TSpeedButton;
    SBsair: TSpeedButton;
    gpEmp: TGridPanel;
    Panel3: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbEmpID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbEmpCod: TDBEdit;
    Panel29: TPanel;
    Label15: TLabel;
    dbEmpDescricao: TDBEdit;
    Panel9: TPanel;
    bEmp: TButton;
    Panel10: TPanel;
    Label4: TLabel;
    dbEmpQtd: TEdit;
    Panel19: TPanel;
    Label16: TLabel;
    cbEmpColaborador: TDBLookupComboBox;
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
    procedure SBestoqueClick(Sender: TObject);
    procedure LimpaCampos;
    procedure dbEmpQtdKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Emprestimo, Tela_Principal, Lista_Estoque;

procedure TTelaEmprestimo.FormShow(Sender: TObject);
begin
  Filtro;
  epProdCod.SetFocus;
end;

procedure TTelaEmprestimo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    LimpaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    gEmp.Enabled         := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBestoque.Enabled    := True;
    SBcancelar.Enabled   := False;
    bEmp.Enabled         := False;
    dm.FDTabEmprestimoProd.Cancel;
    dm.FDTabEmprestimoItem.Cancel;
end;

procedure TTelaEmprestimo.SBeditarClick(Sender: TObject); // botão de emprestimo
begin
    HabilitaCampos;
    LimpaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    gEmp.Enabled         := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    SBestoque.Enabled    := False;
    bEmp.Enabled         := True;
    dm.FDTabColaborador.Open;
    dm.FDTabEmprestimoProd.Open;
    dm.FDTabEmprestimoProd.Append;
    dm.FDTabEmprestimoItem.Open;
    dm.FDTabEmprestimoItem.Append;
    cbEmpColaborador.SetFocus;
end;

procedure TTelaEmprestimo.SBestoqueClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEstoque); // botão de estoque
end;

// botão de relatório
procedure TTelaEmprestimo.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioEmprestimo) then
    Application.CreateForm(TRelatorioEmprestimo, RelatorioEmprestimo);

  RelatorioEmprestimo.ShowModal;
end;

procedure TTelaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TTelaEmprestimo.HabilitaCampos; // habilitar campos
begin
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
    dbNavEmprestimo.Enabled      := True;
end;

procedure TTelaEmprestimo.bEmpClick(Sender: TObject);
var
  produtoID, quantidade, saldoAtual, emprestimoID: Integer;
begin
    if Trim(cbEmpColaborador.Text) = '' then
      begin
        MessageBox(0, 'O campo "Colaborador" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbEmpColaborador.SetFocus;
      end
  else
    if Trim(dbEmpQtd.Text) = '' then
      begin
        MessageBox(0, 'O campo "Quantidade" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEmpQtd.SetFocus;
      end
  else
    if StrToInt(dbEmpQtd.Text) <= 0 then
      begin
        MessageBox(0, 'O campo "Quantidade" não pode ser menor ou igual a 0!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbEmpQtd.SetFocus;
      end
  else
    begin
      produtoID := StrToInt(dbEmpID.Text);
      quantidade := StrToInt(dbEmpQtd.Text);

      qryVerifica.Close;
      qryVerifica.ParamByName('produto_id').AsInteger := produtoID;
      qryVerifica.Open;

    // verifica se o produto existe no estoque
    if qryVerifica.IsEmpty then
    begin
      MessageBox(0, 'Produto não encontrado no estoque!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      Exit;
    end;

      saldoAtual := qryVerifica.FieldByName('saldo').AsInteger;

    // verifica se tem produto suficiente para o emprestimo
    if saldoAtual < quantidade then
    begin
      MessageBox(0, 'Estoque insuficiente para este empréstimo!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      dbEmpQtd.SetFocus;
      Exit;
    end;

      dm.FDTabEmprestimoProd.FieldByName('saldo').AsInteger := quantidade;
      dm.FDTabEmprestimoProd.FieldByName('quantidade').AsInteger := quantidade;
      dm.FDTabEmprestimoProd.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabEmprestimoProd.FieldByName('operador').AsInteger := TelaPrincipal.usuarioID;
      dm.FDTabEmprestimoProd.FieldByName('colaborador_id').AsInteger := cbEmpColaborador.KeyValue;
      dm.FDTabEmprestimoProd.Post;
      dm.FDTabEmprestimoProd.Refresh;
      dm.FDTabEmprestimoProd.Last;

      emprestimoID := dm.FDTabEmprestimoProd.FieldByName('id').AsInteger;

      // faz update no estoque para tirar o produto
      qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
      qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
      qryUpdateEstoque.ExecSQL;

      // salva o emprestimo id na tabela item emprestimo
      qryInsertEstoque.ParamByName('emprestimo_id').AsInteger := emprestimoID;
      qryInsertEstoque.ExecSQL;

      dm.FDTabEmprestimoProd.Close;
      MessageBox(0, 'Empréstimo realizado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      LimpaCampos;
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBcancelar.Enabled   := False;
      SBeditar.Enabled     := True;
      SBestoque.Enabled    := True;
      SBrelatorio.Enabled  := True;
      bEmp.Enabled         := False;
      dm.FDTabEmprestimoProd.Open;
      dm.FDTabEmprestimoProd.Refresh;
      dm.FDTabEmprestimoProd.Last;
      Filtro;
    end;
end;

// impede valores negativos na quantidade
procedure TTelaEmprestimo.dbEmpQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TTelaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
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
    dbNavEmprestimo.Enabled      := False;
end;

procedure TTelaEmprestimo.LimpaCampos;
begin
  cbEmpColaborador.KeyValue := 0;
  dbEmpQtd.Clear;
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
  qryProduto.ParamByName('codigo').AsString := '%' + Trim(epProdCod.Text) + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + Trim(epProdDescricao.Text) + '%';
  qryProduto.ParamByName('marca').AsString := '%' + Trim(epProdModelo.Text) + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + Trim(epProdMarca.Text) + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + Trim(epProdGrupo.Text) + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

end.
