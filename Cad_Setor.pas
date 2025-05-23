unit Cad_Setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TCadSetor = class(TForm)
    Panel5: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel12: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadSetor: TCadSetor;

implementation

{$R *.dfm}

uses Lista_Setor, Data_Module, Tela_Principal;

procedure TCadSetor.SBcancelarClick(Sender: TObject); // bot�o de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabSetor.Cancel;
  LimpaCampos();
end;

procedure TCadSetor.SBnovoClick(Sender: TObject); // bot�o de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabSetor.Open;
  dm.FDTabSetor.Append;
  DBEdit3.SetFocus;
end;

procedure TCadSetor.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaSetor); // bot�o de pesquisar
end;

procedure TCadSetor.SBsairClick(Sender: TObject);
begin
  close(); // bot�o de sair
end;

procedure TCadSetor.SBsalvarClick(Sender: TObject); // bot�o de salvar
begin
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descri��o" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    begin
      dm.FDTabSetor.Post;
      dm.FDTabSetor.Close;
      ShowMessage('Setor cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSetor.Open;
      dm.FDTabSetor.Last;
    end;

end;

// foco com enter
procedure TCadSetor.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit3.SetFocus;
end;

procedure TCadSetor.HabilitaCampos; // habilitar campos
begin
    DBEdit3.Enabled            := True;
end;

procedure TCadSetor.DesabilitaCampos; // desabilitar campos
begin
    DBEdit3.Enabled            := False;
end;

procedure TCadSetor.LimpaCampos; // limpar campos
begin
    DBEdit3.Clear;
end;

end.
