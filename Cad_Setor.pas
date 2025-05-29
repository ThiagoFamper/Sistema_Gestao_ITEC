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
    gSetor: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbSetorID: TDBEdit;
    Panel12: TPanel;
    Label3: TLabel;
    dbSetorDescricao: TDBEdit;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
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

procedure TCadSetor.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  TelaPrincipal.habilitaMenu;
  dm.FDTabSetor.Cancel;
  LimpaCampos();
end;

procedure TCadSetor.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabSetor.Open;
  dm.FDTabSetor.Append;
  dbSetorDescricao.SetFocus;
end;

procedure TCadSetor.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  TelaPrincipal.AbrirFormulario(TListaSetor); // botão de pesquisar
end;

procedure TCadSetor.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadSetor.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbSetorDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbSetorDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabSetor.Post;
      dm.FDTabSetor.Close;
      ShowMessage('Setor cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSetor.Open;
      dm.FDTabSetor.Refresh;
      dm.FDTabSetor.Last;
    end;

end;

procedure TCadSetor.HabilitaCampos; // habilitar campos
begin
    dbSetorDescricao.Enabled            := True;
end;

procedure TCadSetor.DesabilitaCampos; // desabilitar campos
begin
    dbSetorDescricao.Enabled            := False;
end;

procedure TCadSetor.LimpaCampos; // limpar campos
begin
    dbSetorDescricao.Clear;
end;

end.
