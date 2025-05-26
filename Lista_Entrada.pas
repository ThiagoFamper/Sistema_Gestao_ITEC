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
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Panel17: TPanel;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Panel18: TPanel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    DBEdit7: TDBEdit;
    Panel21: TPanel;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    Panel23: TPanel;
    Label7: TLabel;
    Edit1: TEdit;
    Panel24: TPanel;
    Label1: TLabel;
    Edit2: TEdit;
    Panel25: TPanel;
    Label2: TLabel;
    Edit3: TEdit;
    Panel26: TPanel;
    Label3: TLabel;
    Edit4: TEdit;
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaEntrada: TListaEntrada;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Entrada;

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
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    DBGrid1.Enabled      := True;
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
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    DBGrid1.Enabled      := False;
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
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit5.Text = '' then
      begin
        ShowMessage('O Campo "Quantidade" deve ser preenchido!');
        DBEdit5.SetFocus;
      end
  else
    if DBEdit6.Text = '' then
      begin
        ShowMessage('O Campo "Operador" deve ser preenchido!');
        DBEdit6.SetFocus;
      end
  else
    if DBEdit7.Text = '' then
      begin
        ShowMessage('O Campo "Nota Fiscal" deve ser preenchido!');
        DBEdit7.SetFocus;
      end
  else
    if DBEdit9.Text = '' then
      begin
        ShowMessage('O Campo "Valor Unitário" deve ser preenchido!');
        DBEdit9.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      ShowMessage('Editado com Sucesso!');
      DesabilitaCampos();
      HabilitaCamposPesquisa();
      DBGrid1.Enabled      := True;
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
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit6.Enabled            := True;
    DBEdit7.Enabled            := True;
    DBEdit9.Enabled            := True;
end;

procedure TListaEntrada.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit6.Enabled            := False;
    DBEdit7.Enabled            := False;
    DBEdit9.Enabled            := False;
end;

procedure TListaEntrada.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit3.Enabled            := False;
    Edit4.Enabled            := False;
end;

procedure TListaEntrada.HabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit3.Enabled            := True;
    Edit4.Enabled            := True;
end;

end.
