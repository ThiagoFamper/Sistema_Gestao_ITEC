unit Tela_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TTelaEntrada = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbpEntradaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbpEntradaCod: TDBEdit;
    Panel17: TPanel;
    Label16: TLabel;
    dbpEntradaQtd: TDBEdit;
    Panel18: TPanel;
    Label17: TLabel;
    dbpEntradaOperador: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    dbpEntradaNF: TDBEdit;
    Panel21: TPanel;
    Label19: TLabel;
    dbpEntradaValor: TDBEdit;
    Panel1: TPanel;
    Panel23: TPanel;
    Label7: TLabel;
    epEntradaCod: TEdit;
    Panel24: TPanel;
    Label1: TLabel;
    epEntradaDescricao: TEdit;
    Panel25: TPanel;
    Label2: TLabel;
    epEntradaOperador: TEdit;
    Panel26: TPanel;
    Label3: TLabel;
    epEntradaNF: TEdit;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    gpEntrada: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEntrada: TTelaEntrada;

implementation

{$R *.dfm}

end.
