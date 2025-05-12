unit Relatorio_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TRelatorioEntrada = class(TForm)
    DateTimeInicial: TDateTimePicker;
    DateTimeFinal: TDateTimePicker;
    frxRelatEnt: TfrxReport;
    FDQueryRelatEnt: TFDQuery;
    frxDSEnt: TfrxDBDataset;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
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
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
