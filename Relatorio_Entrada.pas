unit Relatorio_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioEntrada = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSEnt: TfrxDBDataset;
    FDQueryRelatEnt: TFDQuery;
    frxRelatEnt: TfrxReport;
    Panel2: TPanel;
    Panel3: TPanel;
    DateTimeInicial: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    DateTimeFinal: TDateTimePicker;
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
  RelatorioEntrada: TRelatorioEntrada;

implementation

{$R *.dfm}

uses Data_Module;

// botão de gerar relatório
procedure TRelatorioEntrada.bRelatClick(Sender: TObject);
begin
  try
    FDQueryRelatEnt.Close;
    FDQueryRelatEnt.ParamByName('data_inicial').AsDateTime := DateTimeInicial.DateTime;
    FDQueryRelatEnt.ParamByName('data_final').AsDateTime := DateTimeFinal.DateTime;
    FDQueryRelatEnt.Open;

    frxRelatEnt.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

// botão de cancelar
procedure TRelatorioEntrada.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
procedure TRelatorioEntrada.FormShow(Sender: TObject);
begin
  DateTimeInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.DateTime := Now;
end;

end.
