unit Data_Module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, frxSmartMemo, frxClass, frCoreClasses, frxDBSet;

type
  TDM = class(TDataModule)
    FDEstoqueItec: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTabProduto: TFDTable;
    FDTabProdutoid: TLargeintField;
    FDTabProdutodescricao: TWideStringField;
    FDTabProdutomarca: TWideStringField;
    FDTabProdutomodelo: TWideStringField;
    FDTabProdutogrupo_id: TLargeintField;
    dsFDTabProduto: TDataSource;
    FDTabGrupo: TFDTable;
    dsFDTabGrupo: TDataSource;
    FDTabGrupoid: TLargeintField;
    FDTabGrupodescricao: TWideStringField;
    FDTabProdutocod_produto: TWideStringField;
    dsFDTabColaborador: TDataSource;
    FDTabColaborador: TFDTable;
    FDTabColaboradorid: TLargeintField;
    FDTabColaboradordescricao: TWideStringField;
    FDTabColaboradorcargo: TWideStringField;
    FDTabColaboradorsetor_id: TLargeintField;
    FDTabSetor: TFDTable;
    dsFDTabSetor: TDataSource;
    FDTabSetorid: TLargeintField;
    FDTabSetordescricao: TWideStringField;
    FDTabUsuario: TFDTable;
    dsFDTabUsuario: TDataSource;
    FDTabUsuarioid: TIntegerField;
    FDTabUsuarionome: TWideStringField;
    FDTabUsuariologin: TWideStringField;
    FDTabUsuariosenha: TWideStringField;
    FDTabUsuarioadmin: TBooleanField;
    FDTabEntrada: TFDTable;
    dsFDTabEntrada: TDataSource;
    FDTabEntradaid: TLargeintField;
    FDTabEntradaproduto_id: TLargeintField;
    FDTabEntradaquantidade: TIntegerField;
    FDTabEntradadata_entrada: TDateField;
    FDTabEntradanota_fiscal: TWideStringField;
    FDTabEntradavalor_unitario: TFMTBCDField;
    FDTabEmprestimoProd: TFDTable;
    dsFDTabEmprestimoProd: TDataSource;
    FDTabSaida: TFDTable;
    dsFDTabSaida: TDataSource;
    FDTabEstoque: TFDTable;
    dsFDTabEstoque: TDataSource;
    FDTabEmprestimoItem: TFDTable;
    dsFDTabEmprestimoItem: TDataSource;
    FDTabEmprestimoItemid: TLargeintField;
    FDTabEmprestimoItemdata_devolucao: TDateField;
    FDTabEmprestimoItemqtd_devolvida: TIntegerField;
    dsFDTabSede: TDataSource;
    FDTabSede: TFDTable;
    FDTabColaboradorsede_id: TLargeintField;
    FDTabSedeid: TLargeintField;
    FDTabSededescricao: TWideStringField;
    FDTabSaidaid: TLargeintField;
    FDTabSaidaproduto_id: TLargeintField;
    FDTabSaidaquantidade: TIntegerField;
    FDTabSaidadata_saida: TDateField;
    FDTabEmprestimoProdid: TLargeintField;
    FDTabEmprestimoProdproduto_id: TLargeintField;
    FDTabEmprestimoProdquantidade: TIntegerField;
    FDTabEmprestimoProddata_emprestimo: TDateField;
    FDTabProdutodata: TDateField;
    FDTabEstoqueid: TLargeintField;
    FDTabEstoquesaldo: TIntegerField;
    FDTabEstoqueproduto_id: TLargeintField;
    FDTabEntradaoperador: TLargeintField;
    FDTabSaidaoperador: TLargeintField;
    FDTabEmprestimoProdoperador: TLargeintField;
    FDTabEmprestimoProddevolvido: TBooleanField;
    FDTabEmprestimoItememprestimo_id: TLargeintField;
    FDTabEmprestimoProdsaldo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
