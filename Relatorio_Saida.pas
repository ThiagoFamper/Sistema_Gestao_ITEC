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
    Label1: TLabel;
    DateTimeInicial: TDateTimePicker;
    Panel3: TPanel;
    Label2: TLabel;
    DateTimeFinal: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

procedure TRelatorioSaida.FormShow(Sender: TObject);
begin
  DateTimeInicial.Date := EncodeDate(YearOf(Date), 1, 1);
  DateTimeFinal.Date := Date;
  BitBtn1.Left := (Panel1.Width - BitBtn1.Width) div 2;  // centraliza verticalmente o botão de gerar relatório em tempo de execução
end;

end.
