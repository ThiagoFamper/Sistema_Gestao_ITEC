unit Lista_Colaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.pngimage;

type
  TListaColaborador = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
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
    Panel12: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel15: TPanel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    Label4: TLabel;
    Panel17: TPanel;
    Label3: TLabel;
    Panel18: TPanel;
    Label6: TLabel;
    Panel11: TPanel;
    Label12: TLabel;
    Edit1: TEdit;
    Panel19: TPanel;
    Label11: TLabel;
    Edit2: TEdit;
    Panel20: TPanel;
    Label8: TLabel;
    Edit3: TEdit;
    Panel21: TPanel;
    Label9: TLabel;
    Edit4: TEdit;
    Panel22: TPanel;
    Label7: TLabel;
    Edit5: TEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaColaborador: TListaColaborador;

implementation

{$R *.dfm}

uses Cad_Colaborador, Data_Module;

procedure TListaColaborador.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabColaborador.Delete;
end;

procedure TListaColaborador.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabColaborador.Cancel;
    DBGrid1.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaColaborador.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabColaborador.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaColaborador.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaColaborador.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Cargo" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O Campo "Setor" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
  else
    if DBLookupComboBox2.Text = '' then
      begin
        ShowMessage('O Campo "Sede" deve ser preenchido!');
        DBLookupComboBox2.SetFocus;
      end
  else
    begin
      dm.FDTabColaborador.Post;
      ShowMessage('Colaborador editado com sucesso!');
      DesabilitaCampos();
      HabilitaCamposPesquisa();
      DBGrid1.Enabled      := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaColaborador.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
    DBLookupComboBox2.Enabled  := True;
end;

procedure TListaColaborador.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
    DBLookupComboBox2.Enabled  := False;
end;

procedure TListaColaborador.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit3.Enabled            := False;
    Edit4.Enabled            := False;
    Edit5.Enabled            := False;
end;

procedure TListaColaborador.Edit1Change(Sender: TObject); // pesquisa código
begin
    dm.FDTabColaborador.Locate('cod_colaborador', Edit1.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaColaborador.Edit2Change(Sender: TObject); // pesquisa descricao
begin
    dm.FDTabColaborador.Locate('descricao', Edit2.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaColaborador.Edit3Change(Sender: TObject); // pesquisa cargo
begin
    dm.FDTabColaborador.Locate('cargo', Edit3.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaColaborador.Edit4Change(Sender: TObject); // pesquisa setor
begin
    dm.FDTabColaborador.Locate('setor_id', Edit4.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaColaborador.Edit5Change(Sender: TObject); // pesquisa sede
begin
    dm.FDTabColaborador.Locate('sede', Edit5.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TListaColaborador.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit3.Enabled            := True;
    Edit4.Enabled            := True;
    Edit5.Enabled            := True;
end;

end.
