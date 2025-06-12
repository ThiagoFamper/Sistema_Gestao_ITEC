unit Relatorio_Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioEstoque = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSRelatProd: TfrxDBDataset;
    FDQueryRelatProd: TFDQuery;
    frxRelatProd: TfrxReport;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DateTimeInicial: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    DateTimeFinal: TDateTimePicker;
    GridPanel1: TGridPanel;
    bRelat: TBitBtn;
    bCancelar: TBitBtn;
    procedure bRelatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioEstoque: TRelatorioEstoque;

implementation

{$R *.dfm}

uses Data_Module;

// botão de gerar relatório
procedure TRelatorioEstoque.bRelatClick(Sender: TObject);
begin
  try
    FDQueryRelatProd.Close;
    FDQueryRelatProd.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatProd.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatProd.Open;

    frxRelatProd.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

// botão de cancelar
procedure TRelatorioEstoque.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
procedure TRelatorioEstoque.FormShow(Sender: TObject);
begin
  DateTimeInicial.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.Date := Now;
end;

end.
