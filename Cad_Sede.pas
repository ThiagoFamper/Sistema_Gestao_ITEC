unit Cad_Sede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadSede = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    Label2: TLabel;
    dbSedeDescricao: TDBEdit;
    Panel10: TPanel;
    Label1: TLabel;
    dbSedeID: TDBEdit;
    gSede: TDBGrid;
    qrySede: TFDQuery;
    dsSede: TDataSource;
    SBnovo: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsair: TSpeedButton;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

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
  TelaPrincipal.AbrirFormulario(TListaSede); // botão de pesquisar
end;

procedure TCadSede.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos;
  TelaPrincipal.habilitaMenu;
  dm.FDTabSede.Cancel;
end;

procedure TCadSede.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos;
  TelaPrincipal.desabilitaMenu;
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
    if Trim(dbSedeDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbSedeDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabSede.Post;
      dm.FDTabSede.Close;
      MessageBox(0, 'Sede cadastrada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      TelaPrincipal.habilitaMenu;
      DesabilitaCampos;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSede.Open;
      dm.FDTabSede.Refresh;
      dm.FDTabSede.Last;
      qrySede.Close;
      qrySede.Open;
    end;
end;

procedure TCadSede.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadSede.FormShow(Sender: TObject);
begin
  qrySede.Close;
  qrySede.Open;
end;

procedure TCadSede.HabilitaCampos; // habilitar campos
begin
    dbSedeDescricao.Enabled            := True;
end;

procedure TCadSede.DesabilitaCampos; // desabilitar campos
begin
    dbSedeDescricao.Enabled            := False;
end;

end.
