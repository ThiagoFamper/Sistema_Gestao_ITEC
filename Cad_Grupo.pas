unit Cad_Grupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TCadGrupo = class(TForm)
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel11: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadGrupo: TCadGrupo;

implementation

{$R *.dfm}

uses Lista_Grupos, Data_Module, Tela_Principal;

procedure TCadGrupo.SBpesquisarClick(Sender: TObject);
begin
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaGrupos); // botão de pesquisar
end;

procedure TCadGrupo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  HabilitaBotoes();
  DesabilitaCampos();
  dm.FDTabGrupo.Cancel;
  LimpaCampos();
end;

procedure TCadGrupo.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  DesabilitaBotoes();
  dm.FDTabGrupo.Insert;
  dm.FDTabGrupo.Append;
  DBEdit2.SetFocus;
end;

procedure TCadGrupo.SBsalvarClick(Sender: TObject); // botão de salvar
begin
  if SBnovo.Enabled = True then
    begin
      ShowMessage('Cadastro não está em modo de inclusão. Realize o Cadastro agora');
      SBnovo.Click;
    end
  else
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido !');
        DBEdit2.SetFocus;
      end
  else
    begin
      dm.FDTabGrupo.Post;
      dm.FDTabGrupo.Close;
      dm.FDTabGrupo.Open;
      dm.FDTabGrupo.Last;
      ShowMessage('Cadastrado com Sucesso!');
      HabilitaBotoes();
      LimpaCampos();
    end;
end;

procedure TCadGrupo.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadGrupo.HabilitaBotoes; // habilitar botões
begin
  SBnovo.Enabled       := True;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
end;

procedure TCadGrupo.DesabilitaBotoes; // desabilitar botões
begin
  SBnovo.Enabled       := False;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
end;

procedure TCadGrupo.HabilitaCampos; // habilitar campos
begin
    DBEdit1.Enabled            := True;
    DBEdit2.Enabled            := True;
end;

procedure TCadGrupo.DesabilitaCampos; // desabilitar campos
begin
    DBEdit1.Enabled            := False;
    DBEdit2.Enabled            := False;
end;

procedure TCadGrupo.LimpaCampos; // limpar campos
begin
    DBEdit1.Clear;
    DBEdit2.Clear;
end;

// foco com tab
procedure TCadGrupo.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit2.SetFocus;
end;

end.
