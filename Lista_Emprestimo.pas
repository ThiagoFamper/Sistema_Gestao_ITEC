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
    gpEmp: TDBGrid;
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
    Panel22: TPanel;
    Label9: TLabel;
    epEmpCod: TEdit;
    Panel23: TPanel;
    Label2: TLabel;
    epEmpDescricao: TEdit;
    Panel26: TPanel;
    Label7: TLabel;
    epEmpOperador: TEdit;
    Panel15: TPanel;
    Label3: TLabel;
    dbpEmpSaldo: TDBEdit;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaEmprestimo: TListaEmprestimo;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Emprestimo, Tela_Principal;

procedure TListaEmprestimo.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabProduto.Delete;
end;

procedure TListaEmprestimo.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioEmprestimo, RelatorioEmprestimo);
  RelatorioEmprestimo.ShowModal;
  RelatorioEmprestimo.Free;
end;

procedure TListaEmprestimo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    gpEmp.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaEmprestimo.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    gpEmp.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBrelatorio.Enabled  := False;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaEmprestimo.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaEmprestimo.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpEmpCod.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        dbpEmpCod.SetFocus;
      end
  else
    if dbpEmpQtd.Text = '' then
      begin
        ShowMessage('O Campo "Quantidade" deve ser preenchido!');
        dbpEmpQtd.SetFocus;
      end
  else
    if dbpEmpOperador.Text = '' then
      begin
        ShowMessage('O Campo "Operador" deve ser preenchido!');
        dbpEmpOperador.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      ShowMessage('Editado com Sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpEmp.Enabled      := True;
      SBrelatorio.Enabled  := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaEmprestimo.HabilitaCampos; // habilitar campos
begin
    dbpEmpCod.Enabled            := True;
    dbpEmpOperador.Enabled       := True;
    dbpEmpQtd.Enabled            := True;
    dbpEmpSaldo.Enabled          := True;
end;

procedure TListaEmprestimo.DesabilitaCampos; // desabilitar campos
begin
    dbpEmpCod.Enabled            := False;
    dbpEmpOperador.Enabled       := False;
    dbpEmpQtd.Enabled            := False;
    dbpEmpSaldo.Enabled          := False;
end;

procedure TListaEmprestimo.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epEmpCod.Enabled            := False;
    epEmpDescricao.Enabled      := False;
    epEmpOperador.Enabled       := False;
end;

procedure TListaEmprestimo.FormShow(Sender: TObject);
begin
  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;
end;

procedure TListaEmprestimo.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epEmpCod.Enabled            := True;
    epEmpDescricao.Enabled      := True;
    epEmpOperador.Enabled       := True;
end;

end.
