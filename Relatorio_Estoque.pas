unit Relatorio_Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, Vcl.ExtCtrls, DateUtils,
  Vcl.DBCtrls;

type
  TRelatorioEstoque = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSRelatEstoque: TfrxDBDataset;
    FDQueryRelatEstoque: TFDQuery;
    frxRelatEstoque: TfrxReport;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    GridPanel1: TGridPanel;
    bRelat: TBitBtn;
    bCancelar: TBitBtn;
    FDQueryGrupo: TFDQuery;
    FDQueryModelo: TFDQuery;
    FDQueryMarca: TFDQuery;
    Label3: TLabel;
    DBLookupComboMarca: TDBLookupComboBox;
    DBLookupComboModelo: TDBLookupComboBox;
    DBLookupComboGrupo: TDBLookupComboBox;
    //procedure bRelatClick(Sender: TObject);
    //procedure FormShow(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
    //procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioEstoque: TRelatorioEstoque;

implementation

{$R *.dfm}

uses Data_Module, Cad_Produto, Cad_Grupo;

// botão de gerar relatório
//procedure TRelatorioEstoque.bRelatClick(Sender: TObject);
//begin
//  try
//    FDQueryRelatEstoque.Close;
//    FDQueryRelatEstoque.ParamByName('data_inicial').AsDateTime := DateTimeInicial.DateTime;
//    FDQueryRelatEstoque.ParamByName('data_final').AsDateTime := DateTimeFinal.DateTime;
//    FDQueryRelatEstoque.Open;
//
//    frxRelatEstoque.ShowReport;
//  except
//    on E: Exception do
//      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
//  end;
//end;

// botão de cancelar
procedure TRelatorioEstoque.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
//procedure TRelatorioEstoque.FormShow(Sender: TObject);
//begin
//  DateTimeInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
//  DateTimeFinal.DateTime := Now;
//end;


end.
