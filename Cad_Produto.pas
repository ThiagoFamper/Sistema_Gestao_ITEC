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
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

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
  TelaPrincipal.habilitaMenu;
  dm.FDTabProduto.Cancel;
end;

procedure TCadProduto.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  TelaPrincipal.desabilitaMenu;
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
    if Trim(dbProdCod.Text) = '' then
      begin
        MessageBox(0, 'O campo "Código" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbProdCod.SetFocus;
      end
  else
    if Trim(dbProdDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);;
        dbProdDescricao.SetFocus;
      end
  else
    if Trim(dbProdMarca.Text) = '' then
      begin
        MessageBox(0, 'O campo "Marca" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbProdMarca.SetFocus;
      end
  else
    if Trim(dbProdModelo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Modelo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbProdModelo.SetFocus;
      end
  else
    if Trim(cbProdGrupo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Grupo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbProdGrupo.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      dm.FDTabProduto.Close;
      MessageBox(0, 'Produto cadastrado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabProduto.Open;
      dm.FDTabProduto.Refresh;
      dm.FDTabProduto.Last;
      qryProduto.Close;
      qryProduto.Open;
    end;

end;

procedure TCadProduto.FormShow(Sender: TObject);
begin
  qryProduto.Close;
  qryProduto.Open;
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

end.
