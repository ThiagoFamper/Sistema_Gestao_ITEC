unit Lista_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaProdutos = class(TForm)
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    Panel7: TPanel;
    SBeditar: TSpeedButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel5: TPanel;
    Panel3: TPanel;
    gpProd: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpProdID: TDBEdit;
    Panel14: TPanel;
    Label2: TLabel;
    dbpProdCod: TDBEdit;
    Panel15: TPanel;
    Label3: TLabel;
    dbpProdDescricao: TDBEdit;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label4: TLabel;
    dbpProdMarca: TDBEdit;
    Label5: TLabel;
    dbpProdModelo: TDBEdit;
    Label6: TLabel;
    Panel19: TPanel;
    Label7: TLabel;
    Panel20: TPanel;
    Label8: TLabel;
    Panel21: TPanel;
    Label9: TLabel;
    Panel22: TPanel;
    Label10: TLabel;
    Panel23: TPanel;
    Label11: TLabel;
    epProdCod: TEdit;
    epProdDescricao: TEdit;
    epProdMarca: TEdit;
    epProdModelo: TEdit;
    epProdGrupo: TEdit;
    cbpProdGrupo: TDBLookupComboBox;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure Filtro;
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaProdutos: TListaProdutos;

implementation

{$R *.dfm}

uses Cad_Produto, Data_Module, Relatorio_Produto, Tela_Principal;

procedure TListaProdutos.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabProduto.Delete;
end;

procedure TListaProdutos.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioProduto, RelatorioProduto);
  RelatorioProduto.ShowModal;
  RelatorioProduto.Free;
end;

procedure TListaProdutos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    gpProd.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaProdutos.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    gpProd.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBrelatorio.Enabled  := False;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaProdutos.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaProdutos.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpProdCod.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        dbpProdCod.SetFocus;
      end
  else
    if dbpProdDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbpProdDescricao.SetFocus;
      end
  else
    if dbpProdMarca.Text = '' then
      begin
        ShowMessage('O campo "Marca" deve ser preenchido!');
        dbpProdMarca.SetFocus;
      end
  else
    if dbpProdModelo.Text = '' then
      begin
        ShowMessage('O campo "Modelo" deve ser preenchido!');
        dbpProdModelo.SetFocus;
      end
  else
    if cbpProdGrupo.Text = '' then
      begin
        ShowMessage('O campo "Grupo" deve ser preenchido!');
        cbpProdGrupo.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      dm.FDTabProduto.Close;
      ShowMessage('Produto editado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpProd.Enabled      := True;
      SBrelatorio.Enabled  := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabProduto.Open;
      dm.FDTabProduto.Refresh;
      dm.FDTabProduto.Last;
    end;
end;

procedure TListaProdutos.HabilitaCampos; // habilitar campos
begin
    dbpProdCod.Enabled          := True;
    dbpProdDescricao.Enabled    := True;
    dbpProdModelo.Enabled       := True;
    dbpProdMarca.Enabled        := True;
    cbpProdGrupo.Enabled        := True;
end;

procedure TListaProdutos.DesabilitaCampos; // desabilitar campos
begin
    dbpProdCod.Enabled          := False;
    dbpProdDescricao.Enabled    := False;
    dbpProdModelo.Enabled       := False;
    dbpProdMarca.Enabled        := False;
    cbpProdGrupo.Enabled        := False;
end;

procedure TListaProdutos.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epProdCod.Enabled            := False;
    epProdDescricao.Enabled      := False;
    epProdModelo.Enabled         := False;
    epProdMarca.Enabled          := False;
    epProdGrupo.Enabled          := False;
end;

procedure TListaProdutos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
end;

procedure TListaProdutos.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + epProdCod.Text + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + epProdDescricao.Text + '%';
  qryProduto.ParamByName('marca').AsString := '%' + epProdModelo.Text + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + epProdMarca.Text + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + epProdGrupo.Text + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TListaProdutos.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaProdutos.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

end.
