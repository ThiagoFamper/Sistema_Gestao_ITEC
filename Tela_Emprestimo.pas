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
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel12: TPanel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    Panel16: TPanel;
    Label13: TLabel;
    DBedit4: TDBEdit;
    Panel20: TPanel;
    Label15: TLabel;
    SBnovo: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);

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
  dm.FDTabEmprestimoProd.Cancel;
  LimpaCampos();
end;

procedure TTelaEmprestimo.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabEmprestimoProd.Open;
  dm.FDTabEmprestimoProd.Append;
  DBEdit2.SetFocus;
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
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O campo "Operador" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O campo "Quantidade" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    begin
      produtoID := StrToInt(DBEdit2.Text);
      quantidade := StrToInt(DBEdit4.Text);

      FDQuery1.Close;
      FDQuery1.ParamByName('produto_id').AsInteger := produtoID;
      FDQuery1.Open;

    if FDQuery1.IsEmpty then
    begin
      ShowMessage('Produto não encontrado no estoque!');
      Exit;
    end;

      saldoAtual := FDQuery1.FieldByName('saldo').AsInteger;

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

      FDQuery2.ParamByName('produto_id').AsInteger := produtoID;
      FDQuery2.ParamByName('quantidade').AsInteger := quantidade;
      FDQuery2.ExecSQL;

      FDQuery3.ParamByName('emprestimo_id').AsInteger := emprestimoID;
      FDQuery3.ExecSQL;

      dm.FDTabEmprestimoProd.Close;
      ShowMessage('Empréstimo cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
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

// foco com enter
procedure TTelaEmprestimo.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBLookupComboBox1.SetFocus;
end;

procedure TTelaEmprestimo.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TTelaEmprestimo.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit4.Enabled            := True;
end;

procedure TTelaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit4.Enabled            := False;
end;

procedure TTelaEmprestimo.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    DBEdit4.Clear;
end;

end.
