unit Relatorio_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioEmprestimo = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxRelatEmp: TfrxReport;
    FDQueryRelatEmp: TFDQuery;
    frxDSRelatEmp: TfrxDBDataset;
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
  RelatorioEmprestimo: TRelatorioEmprestimo;

implementation

{$R *.dfm}

uses Data_Module;

// bot�o de gerar relat�rio
procedure TRelatorioEmprestimo.bRelatClick(Sender: TObject);
begin
  try
    FDQueryRelatEmp.Close;
    FDQueryRelatEmp.ParamByName('data_inicial').AsDateTime := DateTimeInicial.DateTime;
    FDQueryRelatEmp.ParamByName('data_final').AsDateTime := DateTimeFinal.DateTime;
    FDQueryRelatEmp.Open;

    frxRelatEmp.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relat�rio!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

// bot�o de cancelar
procedure TRelatorioEmprestimo.bCancelarClick(Sender: TObject);
begin
  Close;
end;

// arruma datas automaticamente
procedure TRelatorioEmprestimo.FormShow(Sender: TObject);
begin
  DateTimeInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.DateTime := Now;
end;

end.
