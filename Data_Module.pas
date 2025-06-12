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
    dsFDTabProduto: TDataSource;
    FDTabGrupo: TFDTable;
    dsFDTabGrupo: TDataSource;
    dsFDTabColaborador: TDataSource;
    FDTabColaborador: TFDTable;
    FDTabSetor: TFDTable;
    dsFDTabSetor: TDataSource;
    FDTabSetorid: TLargeintField;
    FDTabSetordescricao: TWideStringField;
    FDTabUsuario: TFDTable;
    dsFDTabUsuario: TDataSource;
    FDTabEntrada: TFDTable;
    dsFDTabEntrada: TDataSource;
    FDTabEmprestimoProd: TFDTable;
    dsFDTabEmprestimoProd: TDataSource;
    FDTabSaida: TFDTable;
    dsFDTabSaida: TDataSource;
    FDTabEstoque: TFDTable;
    dsFDTabEstoque: TDataSource;
    FDTabEmprestimoItem: TFDTable;
    dsFDTabEmprestimoItem: TDataSource;
    dsFDTabSede: TDataSource;
    FDTabSede: TFDTable;
    FDTabSedeid: TLargeintField;
    FDTabSededescricao: TWideStringField;
    FDTabEstoqueid: TLargeintField;
    FDTabEstoquesaldo: TIntegerField;
    FDTabEstoqueproduto_id: TLargeintField;
    FDTabGrupoid: TLargeintField;
    FDTabGrupodescricao: TWideStringField;
    FDTabColaboradorid: TLargeintField;
    FDTabColaboradordescricao: TWideStringField;
    FDTabColaboradorcargo: TWideStringField;
    FDTabColaboradorsetor_id: TLargeintField;
    FDTabColaboradorsede_id: TLargeintField;
    FDTabUsuarioid: TLargeintField;
    FDTabUsuariologin: TWideStringField;
    FDTabUsuariosenha: TWideStringField;
    FDTabUsuarioadmin: TBooleanField;
    FDTabUsuarionome: TLargeintField;
    FDTabEmprestimoProdid: TLargeintField;
    FDTabEmprestimoProdproduto_id: TLargeintField;
    FDTabEmprestimoProdquantidade: TIntegerField;
    FDTabEmprestimoProdsaldo: TIntegerField;
    FDTabEmprestimoProdoperador: TLargeintField;
    FDTabEmprestimoProddevolvido: TBooleanField;
    FDTabEmprestimoProdcolaborador_id: TLargeintField;
    FDTabEmprestimoItemid: TLargeintField;
    FDTabEmprestimoItemqtd_devolvida: TIntegerField;
    FDTabEmprestimoItememprestimo_id: TLargeintField;
    FDTabEntradaid: TLargeintField;
    FDTabEntradaproduto_id: TLargeintField;
    FDTabEntradaquantidade: TIntegerField;
    FDTabEntradanota_fiscal: TWideStringField;
    FDTabEntradavalor_unitario: TFMTBCDField;
    FDTabEntradaoperador: TLargeintField;
    FDTabEntradadata_entrada: TSQLTimeStampField;
    FDTabEmprestimoProddata_emprestimo: TSQLTimeStampField;
    FDTabEmprestimoItemdata_devolucao: TSQLTimeStampField;
    FDTabSaidaid: TLargeintField;
    FDTabSaidaproduto_id: TLargeintField;
    FDTabSaidaquantidade: TIntegerField;
    FDTabSaidadata_saida: TSQLTimeStampField;
    FDTabSaidaoperador: TLargeintField;
    FDTabSaidadescricao: TWideStringField;
    FDTabProdutoid: TLargeintField;
    FDTabProdutocod_produto: TWideStringField;
    FDTabProdutodescricao: TWideStringField;
    FDTabProdutomarca: TWideStringField;
    FDTabProdutomodelo: TWideStringField;
    FDTabProdutogrupo_id: TLargeintField;
    FDTabProdutodata: TSQLTimeStampField;
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
