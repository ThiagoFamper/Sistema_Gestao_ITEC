unit Entrada_Prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TEntradaProd = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel12: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel13: TPanel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Panel16: TPanel;
    Label13: TLabel;
    DBedit4: TDBEdit;
    Panel17: TPanel;
    Label14: TLabel;
    MaskEdit1: TMaskEdit;
    Panel18: TPanel;
    Label2: TLabel;
    DBedit5: TDBEdit;
    Panel19: TPanel;
    Label4: TLabel;
    DBedit7: TDBEdit;
    Panel20: TPanel;
    Label3: TLabel;
    DBedit6: TDBEdit;
    Panel21: TPanel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    procedure SBsairClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntradaProd: TEntradaProd;

implementation

{$R *.dfm}

uses Lista_Entrada, Data_Module, Tela_Principal;

procedure TEntradaProd.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaEntrada); // botão de pesquisar
end;

procedure TEntradaProd.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
