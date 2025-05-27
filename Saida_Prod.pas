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
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label7: TLabel;
    Panel15: TPanel;
    SBnovo: TSpeedButton;
    Label12: TLabel;
    Panel18: TPanel;
    Label13: TLabel;
    DBedit4: TDBEdit;
    Panel20: TPanel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
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
  dm.FDTabProduto.Cancel;
  dm.FDTabColaborador.Cancel;
  dm.FDTabEstoque.Cancel;
  dm.FDTabSaida.Cancel;
  LimpaCampos();
end;

procedure TSaidaProd.SBnovoClick(Sender: TObject); // botão de novo
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
  dm.FDTabSaida.Open;
  dm.FDTabSaida.Append;
  DBEdit2.SetFocus;
end;

procedure TSaidaProd.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaSaida); // botão de pesquisar
end;

procedure TSaidaProd.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TSaidaProd.SBsalvarClick(Sender: TObject); // botão de salvar
var
  produtoID, quantidade, saldoAtual: Integer;
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Quantidade" deve ser preenchido!');
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
      ShowMessage('Saldo insuficiente para esta saída!');
      Exit;
    end;

      dm.FDTabSaida.Post;

      FDQuery2.ParamByName('produto_id').AsInteger := produtoID;
      FDQuery2.ParamByName('quantidade').AsInteger := quantidade;
      FDQuery2.ExecSQL;

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

// foco com enter
procedure TSaidaProd.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TSaidaProd.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TSaidaProd.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TSaidaProd.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    DBEdit4.Clear;
    DBLookupComboBox1.KeyValue := 0;
end;

end.
