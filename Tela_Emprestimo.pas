unit Tela_Emprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TTelaEmprestimo = class(TForm)
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
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Panel12: TPanel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Panel14: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    DBText4: TDBText;
    Panel15: TPanel;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Panel16: TPanel;
    Label13: TLabel;
    TDBedit3: TDBEdit;
    Panel17: TPanel;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    Panel18: TPanel;
    Label8: TLabel;
    DBComboBox2: TDBComboBox;
    Panel19: TPanel;
    Label11: TLabel;
    DBComboBox3: TDBComboBox;
    Panel20: TPanel;
    Label15: TLabel;
    Panel7: TPanel;
    DBText5: TDBText;
    SBnovo: TSpeedButton;
    procedure Button7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaEmprestimo: TTelaEmprestimo;

implementation

{$R *.dfm}

uses Tela_Devolucao, Lista_Emprestimo, Data_Module, Tela_Principal;

procedure TTelaEmprestimo.Button7Click(Sender: TObject);
begin
    TelaDevolucao.Show;
end;

procedure TTelaEmprestimo.SpeedButton1Click(Sender: TObject);
begin
    ListaEmprestimo.Show;
end;

procedure TTelaEmprestimo.SpeedButton8Click(Sender: TObject);
begin
    teladevolucao.Show;
end;

procedure TTelaEmprestimo.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaEmprestimo); // botão de pesquisar
end;

procedure TTelaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

end.
