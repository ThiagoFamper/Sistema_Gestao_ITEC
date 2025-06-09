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
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Panel4: TPanel;
    dbNavProd: TDBNavigator;
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
    SBeditar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsair: TSpeedButton;
    qryUpdateProd: TFDQuery;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
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

uses Cad_Produto, Data_Module, Tela_Principal;

procedure TListaProdutos.SBexcluirClick(Sender: TObject); // botão de excluir
var
  resposta: Integer;
begin
  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpProdDescricao.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    try
      dm.FDTabProduto.Delete;
      MessageBox(0, 'Produto excluído com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
    except
        MessageBox(0, 'Produto está sendo utilizado em outro registro!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TListaProdutos.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabProduto.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaProdutos.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabProduto.Open;
    dm.FDTabProduto.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpProdCod.SetFocus;
end;

procedure TListaProdutos.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaProdutos.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpProdCod.Text) = '' then
      begin
        MessageBox(0, 'O campo "Código" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpProdCod.SetFocus;
      end
  else
    if Trim(dbpProdDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpProdDescricao.SetFocus;
      end
  else
    if Trim(dbpProdMarca.Text) = '' then
      begin
        MessageBox(0, 'O campo "Marca" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpProdMarca.SetFocus;
      end
  else
    if Trim(dbpProdModelo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Modelo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpProdModelo.SetFocus;
      end
  else
    if Trim(cbpProdGrupo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Grupo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbpProdGrupo.SetFocus;
      end
  else
    begin
      qryUpdateProd.ParamByName('codigo').AsString := dbpProdCod.Text;
      qryUpdateProd.ParamByName('descricao').AsString := dbpProdDescricao.Text;
      qryUpdateProd.ParamByName('marca').AsString := dbpProdMarca.Text;
      qryUpdateProd.ParamByName('modelo').AsString := dbpProdModelo.Text;
      qryUpdateProd.ParamByName('grupo').AsInteger := cbpProdGrupo.KeyValue;
      qryUpdateProd.ParamByName('id').AsInteger := StrToInt(dbpProdID.Text);
      qryUpdateProd.ExecSQL;
      dm.FDTabProduto.Close;
      MessageBox(0, 'Produto editado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabProduto.Open;
      dm.FDTabProduto.Refresh;
      dm.FDTabProduto.Last;
      Filtro;
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
    gpProd.Enabled               := False;
    dbNavProd.Enabled            := False;
end;

procedure TListaProdutos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
    gpProd.Enabled               := True;
    dbNavProd.Enabled            := True;
end;

procedure TListaProdutos.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + Trim(epProdCod.Text) + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + Trim(epProdDescricao.Text) + '%';
  qryProduto.ParamByName('marca').AsString := '%' + Trim(epProdMarca.Text) + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + Trim(epProdModelo.Text) + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + Trim(epProdGrupo.Text) + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TListaProdutos.FormShow(Sender: TObject);
begin
  Filtro;
  epProdCod.SetFocus;

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
