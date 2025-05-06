unit Lista_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TListaSaida = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    CheckBox6: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label10: TLabel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Panel15: TPanel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Panel17: TPanel;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Panel18: TPanel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    DBEdit7: TDBEdit;
    Panel20: TPanel;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Panel21: TPanel;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaSaida: TListaSaida;

implementation

{$R *.dfm}

uses Data_Module;

procedure TListaSaida.SpeedButton7Click(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
