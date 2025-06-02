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
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel1: TPanel;
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
    Label4: TLabel;
    dbpProdMarca: TDBEdit;
    Panel17: TPanel;
    Label6: TLabel;
    cbpProdGrupo: TDBLookupComboBox;
    Panel18: TPanel;
    Label5: TLabel;
    dbpProdModelo: TDBEdit;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
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
    Panel3: TPanel;
    gpProd: TDBGrid;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaEstoque: TListaEstoque;

implementation

{$R *.dfm}

end.
