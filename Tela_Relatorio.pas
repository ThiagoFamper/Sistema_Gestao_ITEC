unit Tela_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frCoreClasses, frxClass,
  frxDBSet, frxFDQueryBuilder, frxFDComponents;

type
  TTelaRelatorio = class(TForm)
    RelatProduto: TfrxReport;
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
