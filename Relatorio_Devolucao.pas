unit Relatorio_Devolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frCoreClasses, Vcl.ExtCtrls;

type
  TRelatorioDevolucao = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DateTimeFinal: TDateTimePicker;
    DateTimeInicial: TDateTimePicker;
    frxRelatDev: TfrxReport;
    FDQueryRelatDev: TFDQuery;
    frxDSRelatDev: TfrxDBDataset;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
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
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
