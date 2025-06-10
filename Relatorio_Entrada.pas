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
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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

procedure TRelatorioEntrada.BitBtn1Click(Sender: TObject);
begin
  try
    FDQueryRelatEnt.Close;
    FDQueryRelatEnt.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatEnt.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatEnt.Open;

    frxRelatEnt.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

procedure TRelatorioEntrada.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TRelatorioEntrada.FormShow(Sender: TObject);
begin
  DateTimeInicial.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.Date := Date;
end;

end.
