unit Lista_Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TListaEntrada = class(TForm)
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
    gpEntrada: TDBGrid;
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
  ListaEntrada: TListaEntrada;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Entrada, Tela_Principal;

procedure TListaEntrada.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabEntrada.Delete;
end;

procedure TListaEntrada.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioEntrada) then
    Application.CreateForm(TRelatorioEntrada, RelatorioEntrada);

  RelatorioEntrada.ShowModal;
end;

procedure TListaEntrada.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    gpEntrada.Enabled    := True;
    SBrelatorio.Enabled  := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaEntrada.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    gpEntrada.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBrelatorio.Enabled  := False;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaEntrada.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaEntrada.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpEntradaCod.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        dbpEntradaCod.SetFocus;
      end
  else
    if dbpEntradaQtd.Text = '' then
      begin
        ShowMessage('O Campo "Quantidade" deve ser preenchido!');
        dbpEntradaQtd.SetFocus;
      end
  else
    if dbpEntradaOperador.Text = '' then
      begin
        ShowMessage('O Campo "Operador" deve ser preenchido!');
        dbpEntradaOperador.SetFocus;
      end
  else
    if dbpEntradaNF.Text = '' then
      begin
        ShowMessage('O Campo "Nota Fiscal" deve ser preenchido!');
        dbpEntradaNF.SetFocus;
      end
  else
    if dbpEntradaValor.Text = '' then
      begin
        ShowMessage('O Campo "Valor Unitário" deve ser preenchido!');
        dbpEntradaValor.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      ShowMessage('Editado com Sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpEntrada.Enabled      := True;
      SBrelatorio.Enabled  := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaEntrada.HabilitaCampos; // habilitar campos
begin
    dbpEntradaCod.Enabled           := True;
    dbpEntradaQtd.Enabled           := True;
    dbpEntradaOperador.Enabled      := True;
    dbpEntradaNF.Enabled            := True;
    dbpEntradaValor.Enabled         := True;
end;

procedure TListaEntrada.DesabilitaCampos; // desabilitar campos
begin
    dbpEntradaCod.Enabled           := False;
    dbpEntradaQtd.Enabled           := False;
    dbpEntradaOperador.Enabled      := False;
    dbpEntradaNF.Enabled            := False;
    dbpEntradaValor.Enabled         := False;
end;

procedure TListaEntrada.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epEntradaCod.Enabled           := False;
    epEntradaDescricao.Enabled     := False;
    epEntradaNF.Enabled            := False;
    epEntradaOperador.Enabled      := False;
end;

procedure TListaEntrada.FormShow(Sender: TObject);
begin
  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;
end;

procedure TListaEntrada.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epEntradaCod.Enabled           := True;
    epEntradaDescricao.Enabled     := True;
    epEntradaNF.Enabled            := True;
    epEntradaOperador.Enabled      := True;
end;

end.
