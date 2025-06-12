unit Relatorio_Devolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frCoreClasses, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioDevolucao = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxRelatDev: TfrxReport;
    FDQueryRelatDev: TFDQuery;
    frxDSRelatDev: TfrxDBDataset;
    Panel5: TPanel;
    DateTimeFinal: TDateTimePicker;
    Panel4: TPanel;
    Panel3: TPanel;
    DateTimeInicial: TDateTimePicker;
    Panel2: TPanel;
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
  RelatorioDevolucao: TRelatorioDevolucao;

implementation

{$R *.dfm}

uses Data_Module;

// botão de gerar relatório
procedure TRelatorioDevolucao.bRelatClick(Sender: TObject);
begin
  try
    FDQueryRelatDev.Close;
    FDQueryRelatDev.ParamByName('data_inicial').AsDateTime := DateTimeInicial.DateTime;
    FDQueryRelatDev.ParamByName('data_final').AsDateTime := DateTimeFinal.DateTime;
    FDQueryRelatDev.Open;

    frxRelatDev.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

// botão de cancelar
procedure TRelatorioDevolucao.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
procedure TRelatorioDevolucao.FormShow(Sender: TObject);
begin
  DateTimeInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.DateTime := Now;
end;

end.
