unit Saida_Prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TSaidaProd = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Panel14: TPanel;
    Label7: TLabel;
    Panel6: TPanel;
    DBText4: TDBText;
    Panel15: TPanel;
    SBnovo: TSpeedButton;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Panel16: TPanel;
    Label1: TLabel;
    DBComboBox2: TDBComboBox;
    Panel17: TPanel;
    Label2: TLabel;
    DBComboBox3: TDBComboBox;
    Panel18: TPanel;
    Label13: TLabel;
    TDBedit3: TDBEdit;
    Panel19: TPanel;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    Panel20: TPanel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    Panel7: TPanel;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaidaProd: TSaidaProd;

implementation

{$R *.dfm}

uses Lista_Saida, Data_Module, Tela_Principal;

procedure TSaidaProd.SpeedButton10Click(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaSaida); // botão de pesquisar
end;

procedure TSaidaProd.SpeedButton9Click(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
