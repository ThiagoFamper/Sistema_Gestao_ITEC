unit Cad_Colaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadColaborador = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBnovo: TSpeedButton;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    gColab: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbColabID: TDBEdit;
    Panel12: TPanel;
    Label2: TLabel;
    dbColabDescricao: TDBEdit;
    Panel13: TPanel;
    Label3: TLabel;
    dbColabCargo: TDBEdit;
    Panel14: TPanel;
    Label4: TLabel;
    cbColabSetor: TDBLookupComboBox;
    Panel15: TPanel;
    Label6: TLabel;
    cbColabSede: TDBLookupComboBox;
    qryColaborador: TFDQuery;
    dsColaborador: TDataSource;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadColaborador: TCadColaborador;

implementation

{$R *.dfm}

uses Cad_Setor, Lista_Setor, Lista_Colaborador, Data_Module, Tela_Principal;

procedure TCadColaborador.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos;
  TelaPrincipal.habilitaMenu;
  dm.FDTabColaborador.Cancel;
end;

procedure TCadColaborador.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos;
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabColaborador.Open;
  dm.FDTabColaborador.Append;
  dbColabDescricao.SetFocus;
end;

procedure TCadColaborador.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaColaborador); // botão de pesquisar
end;

procedure TCadColaborador.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadColaborador.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbColabDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Nome" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbColabDescricao.SetFocus;
      end
  else
    if Trim(dbColabCargo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Cargo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbColabCargo.SetFocus;
      end
  else
    if Trim(cbColabSetor.Text) = '' then
      begin
        MessageBox(0, 'O campo "Setor" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbColabSetor.SetFocus;
      end
  else
    if Trim(cbColabSede.Text) = '' then
      begin
        MessageBox(0, 'O campo "Sede" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbColabSede.SetFocus;
      end
  else
    begin
      dm.FDTabColaborador.Post;
      dm.FDTabColaborador.Close;
      MessageBox(0, 'Colaborador cadastrado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabColaborador.Open;
      dm.FDTabColaborador.Refresh;
      dm.FDTabColaborador.Last;
      qryColaborador.Close;
      qryColaborador.Open;
    end;
end;

procedure TCadColaborador.FormShow(Sender: TObject);
begin
  qryColaborador.Close;
  qryColaborador.Open;
end;

procedure TCadColaborador.HabilitaCampos; // habilitar campos
begin
    dbColabDescricao.Enabled    := True;
    dbColabCargo.Enabled        := True;
    cbColabSetor.Enabled        := True;
    cbColabSede.Enabled         := True;
end;

procedure TCadColaborador.DesabilitaCampos; // desabilitar campos
begin
    dbColabDescricao.Enabled    := False;
    dbColabCargo.Enabled        := False;
    cbColabSetor.Enabled        := False;
    cbColabSede.Enabled         := False;
end;

end.
