unit Tela_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frCoreClasses, frxClass,
  frxDBSet, frxFDQueryBuilder, frxFDComponents, Data_Module;

type
  TTelaRelatorio = class(TForm)
    frxDSProd: TfrxDBDataset;
    frxRelatProd: TfrxReport;
    frxRelatEnt: TfrxReport;
    frxDSEnt: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaRelatorio: TTelaRelatorio;

implementation

{$R *.dfm}

end.
