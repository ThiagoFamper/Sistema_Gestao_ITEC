unit Tela_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TTelaEmprestimo = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label10: TLabel;
    dbpEmpID: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    dbpEmpCod: TDBEdit;
    Panel18: TPanel;
    Label5: TLabel;
    dbpEmpQtd: TDBEdit;
    Panel19: TPanel;
    Label1: TLabel;
    dbpEmpOperador: TDBEdit;
    Panel15: TPanel;
    Label3: TLabel;
    dbpEmpSaldo: TDBEdit;
    Panel1: TPanel;
    Panel22: TPanel;
    Label9: TLabel;
    epEmpCod: TEdit;
    Panel23: TPanel;
    Label2: TLabel;
    epEmpDescricao: TEdit;
    Panel26: TPanel;
    Label7: TLabel;
    epEmpOperador: TEdit;
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
    gpEmp: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

end.
