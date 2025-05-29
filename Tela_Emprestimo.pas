unit Tela_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaEmprestimo = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBNavigator1: TDBNavigator;
    gEmp: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    dbEmpID: TDBEdit;
    Panel12: TPanel;
    Label10: TLabel;
    dbEmpCod: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    Panel16: TPanel;
    Label13: TLabel;
    dbEmpQtd: TDBEdit;
    Panel20: TPanel;
    Label15: TLabel;
    SBnovo: TSpeedButton;
    eEmpEstoque: TEdit;
    cbEmpDescricao: TEdit;
    cbEmpOperador: TDBLookupComboBox;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    qryInsertEstoque: TFDQuery;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
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
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

uses Tela_Devolucao, Lista_Emprestimo, Data_Module, Tela_Principal;

procedure TTelaEmprestimo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  TelaPrincipal.habilitaMenu;
  dm.FDTabEmprestimoProd.Cancel;
  LimpaCampos();
end;

procedure TTelaEmprestimo.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabEmprestimoProd.Open;
  dm.FDTabEmprestimoProd.Append;
  dbEmpCod.SetFocus;
end;

procedure TTelaEmprestimo.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEmprestimo); // botão de pesquisar
end;

procedure TTelaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TTelaEmprestimo.SBsalvarClick(Sender: TObject); // botão de salvar
var
  produtoID, quantidade, saldoAtual, emprestimoID: Integer;
begin
    if dbEmpCod.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        dbEmpCod.SetFocus;
      end
  else
    if cbEmpOperador.Text = '' then
      begin
        ShowMessage('O campo "Operador" deve ser preenchido!');
        cbEmpOperador.SetFocus;
      end
  else
    if dbEmpQtd.Text = '' then
      begin
        ShowMessage('O campo "Quantidade" deve ser preenchido!');
        dbEmpQtd.SetFocus;
      end
  else
    begin
      produtoID := StrToInt(dbEmpCod.Text);
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
      LimpaCampos();
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabEmprestimoProd.Open;
      dm.FDTabEmprestimoProd.Refresh;
      dm.FDTabEmprestimoProd.Last;
    end;

end;

procedure TTelaEmprestimo.HabilitaCampos; // habilitar campos
begin
    dbEmpCod.Enabled            := True;
    dbEmpQtd.Enabled            := True;
end;

procedure TTelaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
    dbEmpCod.Enabled            := False;
    dbEmpQtd.Enabled            := False;
end;

procedure TTelaEmprestimo.LimpaCampos; // limpar campos
begin
    dbEmpCod.Clear;
    dbEmpQtd.Clear;
end;

end.
