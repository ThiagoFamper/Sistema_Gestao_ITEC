unit Cad_Sede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TCadSede = class(TForm)
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
    Panel11: TPanel;
    Label2: TLabel;
    dbSedeDescricao: TDBEdit;
    Panel10: TPanel;
    Label1: TLabel;
    dbSedeID: TDBEdit;
    gSede: TDBGrid;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadSede: TCadSede;

implementation

{$R *.dfm}

uses Lista_Sede, Data_Module, Tela_Principal;

procedure TCadSede.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabSede.Open;
  TelaPrincipal.AbrirFormulario(TListaSede); // botão de pesquisar
end;

procedure TCadSede.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabSede.Cancel;
  LimpaCampos();
end;

procedure TCadSede.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabSede.Open;
  dm.FDTabSede.Append;
  dbSedeDescricao.SetFocus;
end;

procedure TCadSede.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbSedeDescricao.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        dbSedeDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabSede.Post;
      dm.FDTabSede.Close;
      ShowMessage('Sede cadastrada com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSede.Open;
      dm.FDTabSede.Refresh;
      dm.FDTabSede.Last;
    end;
end;

procedure TCadSede.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadSede.HabilitaCampos; // habilitar campos
begin
    dbSedeDescricao.Enabled            := True;
end;

procedure TCadSede.DesabilitaCampos; // desabilitar campos
begin
    dbSedeDescricao.Enabled            := False;
end;

procedure TCadSede.LimpaCampos; // limpar campos
begin
    dbSedeDescricao.Clear;
end;

end.
