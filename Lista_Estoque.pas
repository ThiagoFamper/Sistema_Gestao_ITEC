unit Lista_Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TListaEstoque = class(TForm)
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel5: TPanel;
    Panel19: TPanel;
    Label7: TLabel;
    epProdCod: TEdit;
    Panel20: TPanel;
    Label8: TLabel;
    epProdDescricao: TEdit;
    Panel21: TPanel;
    Label9: TLabel;
    epProdMarca: TEdit;
    Panel22: TPanel;
    Label10: TLabel;
    epProdModelo: TEdit;
    Panel23: TPanel;
    Label11: TLabel;
    epProdGrupo: TEdit;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    gEstoque: TDBGrid;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    procedure SBsairClick(Sender: TObject);
    procedure Filtro;
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaEstoque: TListaEstoque;

implementation

{$R *.dfm}

uses Tela_Principal, Data_Module;

procedure TListaEstoque.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaEstoque.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaEstoque.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaEstoque.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaEstoque.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaEstoque.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaEstoque.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + epProdCod.Text + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + epProdDescricao.Text + '%';
  qryProduto.ParamByName('marca').AsString := '%' + epProdModelo.Text + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + epProdMarca.Text + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + epProdGrupo.Text + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TListaEstoque.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  Filtro;
end;

end.
