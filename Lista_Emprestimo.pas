unit Lista_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Bind.Controls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.WinXPickers;

type
  TListaEmprestimo = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Label9: TLabel;
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
    Label10: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Panel15: TPanel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Panel17: TPanel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Panel18: TPanel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel19: TPanel;
    Label1: TLabel;
    DBEdit6: TDBEdit;
    Panel20: TPanel;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Panel21: TPanel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaEmprestimo: TListaEmprestimo;

implementation

{$R *.dfm}

uses Data_Module;

procedure TListaEmprestimo.SpeedButton7Click(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
