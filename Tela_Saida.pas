unit Tela_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TTelaSaida = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    dbpSaidaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbpSaidaCod: TDBEdit;
    Panel17: TPanel;
    Label16: TLabel;
    dbpSaidaQtd: TDBEdit;
    Panel18: TPanel;
    Label17: TLabel;
    dbpSaidaOperador: TDBEdit;
    Panel1: TPanel;
    Panel22: TPanel;
    Label5: TLabel;
    epSaidaCod: TEdit;
    Panel26: TPanel;
    Label2: TLabel;
    epSaidaOperador: TEdit;
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
    gpSaida: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaSaida: TTelaSaida;

implementation

{$R *.dfm}

end.
