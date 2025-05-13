unit Relatorio_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TRelatorioSaida = class(TForm)
    DateTimeInicial: TDateTimePicker;
    DateTimeFinal: TDateTimePicker;
    BitBtn1: TBitBtn;
    frxRelatSai: TfrxReport;
    FDQueryRelatSai: TFDQuery;
    frxDSRelatSai: TfrxDBDataset;
    procedure BitBtn1Click(Sender: TObject);
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

procedure TRelatorioSaida.BitBtn1Click(Sender: TObject);
begin
  try
    // Garante que não há transações com erro pendente
    if DM.FDEstoqueItec.InTransaction then
      DM.FDEstoqueItec.Rollback;

    FDQueryRelatSai.Close;
    FDQueryRelatSai.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatSai.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatSai.Open;

    frxRelatSai.ShowReport;
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
