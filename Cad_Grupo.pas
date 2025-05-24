unit Cad_Grupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    DBGrid1: TDBGrid;
    Panel11: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
  CadGrupo: TCadGrupo;

implementation

{$R *.dfm}

uses Lista_Grupos, Data_Module, Tela_Principal;

procedure TCadGrupo.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabGrupo.Open;
  TTelaPrincipal(Application.MainForm).AbrirFormulario(TListaGrupos); // botão de pesquisar
end;

procedure TCadGrupo.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabGrupo.Cancel;
  LimpaCampos();
end;

procedure TCadGrupo.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabGrupo.Open;
  dm.FDTabGrupo.Append;
  DBEdit2.SetFocus;
end;

procedure TCadGrupo.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    begin
      dm.FDTabGrupo.Post;
      dm.FDTabGrupo.Close;
      ShowMessage('Grupo cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabGrupo.Open;
      dm.FDTabGrupo.Refresh;
      dm.FDTabGrupo.Last;
    end;
end;

procedure TCadGrupo.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadGrupo.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
end;

procedure TCadGrupo.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
end;

procedure TCadGrupo.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
end;

end.
