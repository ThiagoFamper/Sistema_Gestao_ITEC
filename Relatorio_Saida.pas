unit Relatorio_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioSaida = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxRelatSai: TfrxReport;
    FDQueryRelatSai: TFDQuery;
    frxDSRelatSai: TfrxDBDataset;
    Panel2: TPanel;
    DateTimeInicial: TDateTimePicker;
    Panel3: TPanel;
    DateTimeFinal: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
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
  RelatorioSaida: TRelatorioSaida;

implementation

{$R *.dfm}

uses Data_Module;

// botão de gerar relatório
procedure TRelatorioSaida.bRelatClick(Sender: TObject);
begin
  try
    FDQueryRelatSai.Close;
    FDQueryRelatSai.ParamByName('data_inicial').AsDateTime := DateTimeInicial.DateTime;
    FDQueryRelatSai.ParamByName('data_final').AsDateTime := DateTimeFinal.DateTime;
    FDQueryRelatSai.Open;

    frxRelatSai.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

// botão de cancelar
procedure TRelatorioSaida.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
procedure TRelatorioSaida.FormShow(Sender: TObject);
begin
  DateTimeInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.DateTime := Now;
end;

end.
