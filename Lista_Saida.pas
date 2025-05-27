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
    Panel17: TPanel;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Panel18: TPanel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Panel22: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Panel26: TPanel;
    Label2: TLabel;
    Edit5: TEdit;
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
  ListaSaida: TListaSaida;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Saida, Tela_Principal;

procedure TListaSaida.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabSaida.Delete;
end;

procedure TListaSaida.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioSaida, RelatorioSaida);
  RelatorioSaida.ShowModal;
  RelatorioSaida.Free;
end;

procedure TListaSaida.SBcancelarClick(Sender: TObject); // botão de cancelar
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

procedure TListaSaida.SBeditarClick(Sender: TObject); // botão de editar
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

procedure TListaSaida.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaSaida.SBsalvarClick(Sender: TObject); // botão de salvar
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

procedure TListaSaida.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit6.Enabled            := True;
end;

procedure TListaSaida.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit6.Enabled            := False;
end;

procedure TListaSaida.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit5.Enabled            := False;
end;

procedure TListaSaida.FormShow(Sender: TObject);
begin
  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;
end;

procedure TListaSaida.HabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit5.Enabled            := True;
end;

end.
