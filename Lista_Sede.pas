unit Lista_Sede;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TListaSede = class(TForm)
    Panel5: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    dbpSedeID: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    dbpSedeDescricao: TDBEdit;
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
    gpSede: TDBGrid;
    Panel11: TPanel;
    Label3: TLabel;
    epSedeDescricao: TEdit;
    qrySede: TFDQuery;
    dsSede: TDataSource;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure epSedeDescricaoChange(Sender: TObject);
    procedure Filtro;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaSede: TListaSede;

implementation

{$R *.dfm}

uses Cad_Sede, Data_Module, Tela_Principal;

procedure TListaSede.SBexcluirClick(Sender: TObject); // botão de excluir
var
  resposta: Integer;
begin
  resposta := MessageBox(0, 'Você tem certeza que deseja excluir este registro?',
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    dm.FDTabGrupo.Delete;
    Filtro;
  end;
end;

procedure TListaSede.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabSede.Cancel;
    gpSede.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaSede.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabSede.Edit;
    gpSede.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaSede.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaSede.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if dbpSedeDescricao.Text = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpSedeDescricao.SetFocus;
      end
  else
    begin
      dm.FDTabSede.Post;
      dm.FDTabSede.Close;
      MessageBox(0, 'Sede editada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpSede.Enabled       := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabSede.Open;
      dm.FDTabSede.Refresh;
      dm.FDTabSede.Last;
    end;
end;

procedure TListaSede.HabilitaCampos; // habilitar campos
begin
    dbpSedeDescricao.Enabled            := True;
end;

procedure TListaSede.DesabilitaCampos; // desabilitar campos
begin
    dbpSedeDescricao.Enabled            := False;
end;

procedure TListaSede.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epSedeDescricao.Enabled            := False;
end;

procedure TListaSede.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epSedeDescricao.Enabled            := True;
end;

procedure TListaSede.Filtro; // pesquisa com sql query
begin
  qrySede.ParamByName('descricao').AsString := '%' + epSedeDescricao.Text + '%';

  qrySede.Close;
  qrySede.Open;
end;

procedure TListaSede.FormShow(Sender: TObject);
begin
  dm.FDTabSede.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaSede.epSedeDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

end.
