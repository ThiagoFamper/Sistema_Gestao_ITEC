unit Lista_Colaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    gpColab: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpColabID: TDBEdit;
    Panel15: TPanel;
    Label2: TLabel;
    dbpColabDescricao: TDBEdit;
    Panel16: TPanel;
    Label4: TLabel;
    Panel17: TPanel;
    Label3: TLabel;
    Panel18: TPanel;
    Label6: TLabel;
    Panel19: TPanel;
    Label11: TLabel;
    epColabDescricao: TEdit;
    Panel20: TPanel;
    Label8: TLabel;
    epColabSetor: TEdit;
    Panel21: TPanel;
    Label9: TLabel;
    epColabCargo: TEdit;
    Panel22: TPanel;
    Label7: TLabel;
    epColabSede: TEdit;
    dbpColabCargo: TDBEdit;
    cbpColabSetor: TDBLookupComboBox;
    cbpColabSede: TDBLookupComboBox;
    dsColab: TDataSource;
    qryColab: TFDQuery;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure Filtro;
    procedure FormShow(Sender: TObject);
    procedure epColabDescricaoChange(Sender: TObject);
    procedure epColabCargoChange(Sender: TObject);
    procedure epColabSetorChange(Sender: TObject);
    procedure epColabSedeChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaColaborador: TListaColaborador;

implementation

{$R *.dfm}

uses Cad_Colaborador, Data_Module, Tela_Principal;

procedure TListaColaborador.SBexcluirClick(Sender: TObject); // botão de excluir
begin
  if MessageDlg('Você tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabColaborador.Delete;
end;

procedure TListaColaborador.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabColaborador.Cancel;
    gpColab.Enabled      := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaColaborador.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabColaborador.Edit;
    gpColab.Enabled      := False;
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
    if dbpColabDescricao.Text = '' then
      begin
        ShowMessage('O Campo "Descrição" deve ser preenchido!');
        dbpColabDescricao.SetFocus;
      end
  else
    if dbpColabCargo.Text = '' then
      begin
        ShowMessage('O Campo "Cargo" deve ser preenchido!');
        dbpColabCargo.SetFocus;
      end
  else
    if cbpColabSetor.Text = '' then
      begin
        ShowMessage('O Campo "Setor" deve ser preenchido!');
        cbpColabSetor.SetFocus;
      end
  else
    if cbpColabSede.Text = '' then
      begin
        ShowMessage('O Campo "Sede" deve ser preenchido!');
        cbpColabSede.SetFocus;
      end
  else
    begin
      dm.FDTabColaborador.Post;
      ShowMessage('Colaborador editado com sucesso!');
      DesabilitaCampos();
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa();
      gpColab.Enabled      := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaColaborador.HabilitaCampos; // habilitar campos
begin
    dbpColabDescricao.Enabled     := True;
    dbpColabCargo.Enabled         := True;
    cbpColabSetor.Enabled         := True;
    cbpColabSede.Enabled          := True;
end;

procedure TListaColaborador.DesabilitaCampos; // desabilitar campos
begin
    dbpColabDescricao.Enabled     := False;
    dbpColabCargo.Enabled         := False;
    cbpColabSetor.Enabled         := False;
    cbpColabSede.Enabled          := False;
end;

procedure TListaColaborador.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epColabDescricao.Enabled        := False;
    epColabCargo.Enabled            := False;
    epColabSetor.Enabled            := False;
    epColabSede.Enabled             := False;
end;

procedure TListaColaborador.epColabDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaColaborador.epColabCargoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaColaborador.epColabSetorChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaColaborador.epColabSedeChange(Sender: TObject);
begin
  Filtro;
end;

procedure TListaColaborador.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epColabDescricao.Enabled        := True;
    epColabCargo.Enabled            := True;
    epColabSetor.Enabled            := True;
    epColabSede.Enabled             := True;
end;

procedure TListaColaborador.Filtro; // pesquisa com sql query
begin
  qryColab.ParamByName('descricao').AsString := '%' + epColabDescricao.Text + '%';
  qryColab.ParamByName('cargo').AsString := '%' + epColabCargo.Text + '%';
  qryColab.ParamByName('setor').AsString := '%' + epColabSetor.Text + '%';
  qryColab.ParamByName('sede').AsString := '%' + epColabSede.Text + '%';

  qryColab.Close;
  qryColab.Open;
end;

procedure TListaColaborador.FormShow(Sender: TObject);
begin
  dm.FDTabColaborador.Open;
  dm.FDTabSetor.Open;
  dm.FDTabSede.Open;
  Filtro;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

end.
