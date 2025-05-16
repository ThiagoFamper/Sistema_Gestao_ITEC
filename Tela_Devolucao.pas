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
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDevolucao: TTelaDevolucao;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Devolucao;

procedure TTelaDevolucao.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabProduto.Delete;
end;

procedure TTelaDevolucao.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioDevolucao, RelatorioDevolucao);
  RelatorioDevolucao.ShowModal;
  RelatorioDevolucao.Free;
end;

procedure TTelaDevolucao.SBcancelarClick(Sender: TObject); // botão de cancelar
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

procedure TTelaDevolucao.SBeditarClick(Sender: TObject); // botão de editar
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

procedure TTelaDevolucao.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaDevolucao.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Data Empréstimo" deve ser preenchido!');
        DBEdit4.SetFocus;
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
        ShowMessage('O Campo "Quantidade em Estoque" deve ser preenchido!');
        DBEdit7.SetFocus;
      end
  else
    if DBEdit8.Text = '' then
      begin
        ShowMessage('O Campo "Colaborador" deve ser preenchido!');
        DBEdit8.SetFocus;
      end
  else
    if DBEdit9.Text = '' then
      begin
        ShowMessage('O Campo "Devolvido" deve ser preenchido!');
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

procedure TTelaDevolucao.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit6.Enabled            := True;
    DBEdit7.Enabled            := True;
    DBEdit8.Enabled            := True;
    DBEdit9.Enabled            := True;
end;

procedure TTelaDevolucao.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit6.Enabled            := False;
    DBEdit7.Enabled            := False;
    DBEdit8.Enabled            := False;
    DBEdit9.Enabled            := False;
end;

procedure TTelaDevolucao.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit3.Enabled            := False;
    Edit4.Enabled            := False;
    Edit5.Enabled            := False;
    DateTimePicker1.enabled  := False;
    DateTimePicker2.enabled  := False;
end;

procedure TTelaDevolucao.Edit1Change(Sender: TObject); // pesquisa código
begin
    dm.FDTabColaborador.Locate('id', Edit1.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TTelaDevolucao.Edit2Change(Sender: TObject); // pesquisa descricao
begin
    dm.FDTabColaborador.Locate('descricao', Edit2.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TTelaDevolucao.Edit3Change(Sender: TObject); // pesquisa colaborador
begin
    dm.FDTabColaborador.Locate('colaborador', Edit3.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TTelaDevolucao.Edit4Change(Sender: TObject); // pesquisa setor
begin
    dm.FDTabColaborador.Locate('setor', Edit4.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TTelaDevolucao.Edit5Change(Sender: TObject); // pesquisa operador
begin
    dm.FDTabColaborador.Locate('operador', Edit5.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TTelaDevolucao.HabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit3.Enabled            := True;
    Edit4.Enabled            := True;
    Edit5.Enabled            := True;
    DateTimePicker1.enabled  := True;
    DateTimePicker2.enabled  := True;
end;

end.
