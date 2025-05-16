unit Relatorio_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TRelatorioEmprestimo = class(TForm)
    DateTimeInicial: TDateTimePicker;
    DateTimeFinal: TDateTimePicker;
    BitBtn1: TBitBtn;
    frxRelatEmp: TfrxReport;
    FDQueryRelatEmp: TFDQuery;
    frxDSRelatEmp: TfrxDBDataset;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioEmprestimo: TRelatorioEmprestimo;

implementation

{$R *.dfm}

uses Data_Module;

procedure TRelatorioEmprestimo.BitBtn1Click(Sender: TObject);
begin
  try
    FDQueryRelatEmp.Close;
    FDQueryRelatEmp.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatEmp.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatEmp.Open;

    frxRelatEmp.ShowReport;
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
