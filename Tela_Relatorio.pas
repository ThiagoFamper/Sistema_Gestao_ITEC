unit Tela_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frCoreClasses, frxClass,
  frxDBSet, frxFDQueryBuilder, frxFDComponents, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TTelaRelatorio = class(TForm)
    frxRelatEnt: TfrxReport;
    frxDSEnt: TfrxDBDataset;
    FDEstoqueItec: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaRelatorio: TTelaRelatorio;

implementation

{$R *.dfm}

uses Data_Module;

end.
