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
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TRelatorioDevolucao.BitBtn1Click(Sender: TObject);
begin
  try
    FDQueryRelatDev.Close;
    FDQueryRelatDev.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatDev.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatDev.Open;

    frxRelatDev.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

procedure TRelatorioDevolucao.FormShow(Sender: TObject);
begin
  DateTimeInicial.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.Date := Date;
  BitBtn1.Left := (ClientWidth - BitBtn1.Width) div 2;  // centraliza verticalmente o botão de gerar relatório em tempo de execução
end;

end.
