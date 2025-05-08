unit Data_Module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

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
    FDTabColaboradorcod_colaborador: TWideStringField;
    FDTabColaboradordescricao: TWideStringField;
    FDTabColaboradorcargo: TWideStringField;
    FDTabColaboradorsetor_id: TLargeintField;
    FDTabSetor: TFDTable;
    dsFDTabSetor: TDataSource;
    FDTabSetorid: TLargeintField;
    FDTabSetorcod_setor: TWideStringField;
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
    FDTabEntradaoperador: TWideStringField;
    FDTabEntradaquantidade: TIntegerField;
    FDTabEntradadata_entrada: TDateField;
    FDTabEntradanota_fiscal: TWideStringField;
    FDTabEntradavalor_total: TFMTBCDField;
    FDTabEntradavalor_unitario: TFMTBCDField;
    FDTabEmprestimoProd: TFDTable;
    dsFDTabEmprestimoProd: TDataSource;
    FDTabEmprestimoProdid: TLargeintField;
    FDTabEmprestimoProdproduto_id: TLargeintField;
    FDTabEmprestimoProddescricao: TWideStringField;
    FDTabEmprestimoProdoperador: TWideStringField;
    FDTabEmprestimoProdquantidade: TIntegerField;
    FDTabEmprestimoProddata_emprestimo: TDateField;
    FDTabEmprestimoProdcolaborador_id: TLargeintField;
    FDTabEmprestimoProdsetor: TWideStringField;
    FDTabEmprestimoProdsaldo: TFMTBCDField;
    FDTabEmprestimoProddevolvido: TWideStringField;
    FDTabSaida: TFDTable;
    dsFDTabSaida: TDataSource;
    FDTabSaidaid: TLargeintField;
    FDTabSaidaproduto_id: TLargeintField;
    FDTabSaidaoperador: TWideStringField;
    FDTabSaidaquantidade: TIntegerField;
    FDTabSaidadata_saida: TDateField;
    FDTabSaidacolaborador_id: TLargeintField;
    FDTabSaidasetor: TWideStringField;
    FDTabEstoque: TFDTable;
    dsFDTabEstoque: TDataSource;
    FDTabEmprestimoItem: TFDTable;
    dsFDTabEmprestimoItem: TDataSource;
    FDTabEstoqueid: TLargeintField;
    FDTabEstoqueproduto_id: TLargeintField;
    FDTabEstoquesaldo: TIntegerField;
    FDTabEmprestimoItemid: TLargeintField;
    FDTabEmprestimoItemdata_devolucao: TDateField;
    FDTabEmprestimoItemqtd_devolvida: TIntegerField;
    dsFDTabSede: TDataSource;
    FDTabSede: TFDTable;
    FDTabColaboradorsede_id: TLargeintField;
    FDTabSedeid: TLargeintField;
    FDTabSededescricao: TWideStringField;
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
