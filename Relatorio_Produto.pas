unit Relatorio_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, Vcl.ExtCtrls, DateUtils;

type
  TRelatorioProduto = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSRelatProd: TfrxDBDataset;
    FDQueryRelatProd: TFDQuery;
    frxRelatProd: TfrxReport;
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
  RelatorioProduto: TRelatorioProduto;

implementation

{$R *.dfm}

uses Data_Module;

procedure TRelatorioProduto.BitBtn1Click(Sender: TObject);
begin
  try
    // Garante que não há transações com erro pendente
    if DM.FDEstoqueItec.InTransaction then
      DM.FDEstoqueItec.Rollback;

    FDQueryRelatProd.Close;
    FDQueryRelatProd.ParamByName('data_inicial').AsDate := DateTimeInicial.Date;
    FDQueryRelatProd.ParamByName('data_final').AsDate := DateTimeFinal.Date;
    FDQueryRelatProd.Open;

    frxRelatProd.ShowReport;
  except
    on E: Exception do
      MessageBox(0, 'Erro ao gerar relatório!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
  end;
end;

procedure TRelatorioProduto.FormShow(Sender: TObject);
begin
  DateTimeInicial.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  DateTimeFinal.Date := Date;
  BitBtn1.Left := (ClientWidth - BitBtn1.Width) div 2;  // centraliza verticalmente o botão de gerar relatório em tempo de execução
end;

end.
