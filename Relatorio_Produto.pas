unit Relatorio_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, Vcl.ExtCtrls;

type
  TRelatorioProduto = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSRelatProd: TfrxDBDataset;
    BitBtn1: TBitBtn;
    FDQueryRelatProd: TFDQuery;
    frxRelatProd: TfrxReport;
    DateTimeFinal: TDateTimePicker;
    DateTimeInicial: TDateTimePicker;
    Label2: TLabel;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
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
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
