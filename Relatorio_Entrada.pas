unit Relatorio_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TRelatorioEntrada = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSEnt: TfrxDBDataset;
    FDQueryRelatEnt: TFDQuery;
    frxRelatEnt: TfrxReport;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DateTimeInicial: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    DateTimeFinal: TDateTimePicker;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
      ShowMessage('Erro ao gerar relat�rio: ' + E.Message);
  end;
end;

procedure TRelatorioEntrada.FormShow(Sender: TObject);
begin
  BitBtn1.Left := (ClientWidth - BitBtn1.Width) div 2; // centraliza verticalmente o bot�o de gerar relat�rio em tempo de execu��o
end;

end.
