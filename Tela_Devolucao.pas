unit Tela_Devolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Mask;

type
  TTelaDevolucao = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
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
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit6: TEdit;
    Button2: TButton;
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
    Panel3: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Panel15: TPanel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Panel17: TPanel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Panel18: TPanel;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Panel20: TPanel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    Panel21: TPanel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    Panel22: TPanel;
    DBGrid1: TDBGrid;
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDevolucao: TTelaDevolucao;

implementation

{$R *.dfm}

uses Data_Module;

procedure TTelaDevolucao.SpeedButton7Click(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
