unit Cad_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadProduto = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    gProd: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbProdID: TDBEdit;
    Panel11: TPanel;
    Label2: TLabel;
    dbProdCod: TDBEdit;
    Panel12: TPanel;
    Label3: TLabel;
    dbProdDescricao: TDBEdit;
    Panel13: TPanel;
    Label4: TLabel;
    dbProdMarca: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    cbProdGrupo: TDBLookupComboBox;
    Panel15: TPanel;
    Label6: TLabel;
    dbProdModelo: TDBEdit;
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
  CadProduto: TCadProduto;

implementation

{$R *.dfm}

uses Cad_Grupo, Lista_Grupos, Lista_Produtos, Data_Module, Tela_Principal;

procedure TCadProduto.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabGrupo.Cancel;
  dm.FDTabProduto.Cancel;
  LimpaCampos();
end;

procedure TCadProduto.SBnovoClick(Sender: TObject); // botão de novo
begin
  dm.FDTabGrupo.Open;
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabProduto.Open;
  dm.FDTabProduto.Append;
  dbProdCod.SetFocus;
end;

procedure TCadProduto.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  TelaPrincipal.AbrirFormulario(TListaProdutos); // botão de pesquisar
end;

procedure TCadProduto.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TCadProduto.SBsalvarClick(Sender: TObject); // botão de salvar
var
  NewID: Integer;
begin
    if dbProdCod.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        dbProdCod.SetFocus;
      end
  else
    if dbProdDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbProdDescricao.SetFocus;
      end
  else
    if dbProdMarca.Text = '' then
      begin
        ShowMessage('O campo "Marca" deve ser preenchido!');
        dbProdMarca.SetFocus;
      end
  else
    if dbProdModelo.Text = '' then
      begin
        ShowMessage('O campo "Modelo" deve ser preenchido!');
        dbProdModelo.SetFocus;
      end
  else
    if cbProdGrupo.Text = '' then
      begin
        ShowMessage('O campo "Grupo" deve ser preenchido!');
        cbProdGrupo.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      dm.FDTabGrupo.Close;
      dm.FDTabProduto.Close;
      ShowMessage('Produto cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabProduto.Open;
      dm.FDTabProduto.Refresh;
      dm.FDTabProduto.Last;
    end;

end;

procedure TCadProduto.HabilitaCampos; // habilitar campos
begin
    dbProdCod.Enabled        := True;
    dbProdDescricao.Enabled  := True;
    dbProdModelo.Enabled     := True;
    dbProdMarca.Enabled      := True;
    cbProdGrupo.Enabled      := True;
end;

procedure TCadProduto.DesabilitaCampos; // desabilitar campos
begin
    dbProdCod.Enabled        := False;
    dbProdDescricao.Enabled  := False;
    dbProdModelo.Enabled     := False;
    dbProdMarca.Enabled      := False;
    cbProdGrupo.Enabled      := False;
end;

procedure TCadProduto.LimpaCampos; // limpar campos
begin
    dbProdCod.Clear;
    dbProdDescricao.Clear;
    dbProdModelo.Clear;
    dbProdMarca.Clear;
    cbProdGrupo.KeyValue := 0;
end;

end.
