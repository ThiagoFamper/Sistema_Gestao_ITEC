unit Saida_Prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSaidaProd = class(TForm)
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
    Panel12: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    dbSaidaID: TDBEdit;
    Panel14: TPanel;
    Label7: TLabel;
    Panel15: TPanel;
    SBnovo: TSpeedButton;
    Label12: TLabel;
    Panel18: TPanel;
    Label13: TLabel;
    dbSaidaQtd: TDBEdit;
    Panel20: TPanel;
    Label10: TLabel;
    dbSaidaCod: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    cbSaidaDescricao: TEdit;
    eSaidaEstoque: TEdit;
    cbSaidaOperador: TDBLookupComboBox;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
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
  SaidaProd: TSaidaProd;

implementation

{$R *.dfm}

uses Lista_Saida, Data_Module, Tela_Principal;

procedure TSaidaProd.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabSaida.Cancel;
  LimpaCampos();
end;

procedure TSaidaProd.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabSaida.Open;
  dm.FDTabSaida.Append;
  dbSaidaCod.SetFocus;
end;

procedure TSaidaProd.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaSaida); // botão de pesquisar
end;

procedure TSaidaProd.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TSaidaProd.SBsalvarClick(Sender: TObject); // botão de salvar
var
  produtoID, quantidade, saldoAtual: Integer;
begin
    if dbSaidaCod.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        dbSaidaCod.SetFocus;
      end
  else
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
    begin
      produtoID := StrToInt(dbSaidaCod.Text);
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

      dm.FDTabSaida.Post;

      qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
      qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
      qryUpdateEstoque.ExecSQL;

      dm.FDTabSaida.Close;
      ShowMessage('Saida cadastrada com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSaida.Open;
      dm.FDTabSaida.Refresh;
      dm.FDTabSaida.Last;
    end;

end;

procedure TSaidaProd.HabilitaCampos; // habilitar campos
begin
    dbSaidaCod.Enabled       := True;
    dbSaidaQtd.Enabled       := True;
    cbSaidaOperador.Enabled  := True;
end;

procedure TSaidaProd.DesabilitaCampos; // desabilitar campos
begin
    dbSaidaCod.Enabled       := False;
    dbSaidaQtd.Enabled       := False;
    cbSaidaOperador.Enabled  := False;
end;

procedure TSaidaProd.LimpaCampos; // limpar campos
begin
    dbSaidaCod.Clear;
    dbSaidaQtd.Clear;
    cbSaidaOperador.KeyValue := 0;
end;

end.
