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
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel4: TPanel;
    dbNavColab: TDBNavigator;
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
    SBeditar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsair: TSpeedButton;
    qryUpdateColaborador: TFDQuery;
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
var
  resposta: Integer;
begin
  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpColabDescricao.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    try
      dm.FDTabColaborador.Delete;
      MessageBox(0, 'Colaborador excluído com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
    except
        MessageBox(0, 'Colaborador está sendo utilizado em outro registro!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TListaColaborador.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabColaborador.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaColaborador.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabColaborador.Open;
    dm.FDTabColaborador.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpColabDescricao.SetFocus;
end;

procedure TListaColaborador.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TListaColaborador.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpColabDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Nome" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpColabDescricao.SetFocus;
      end
  else
    if Trim(dbpColabCargo.Text) = '' then
      begin
        MessageBox(0, 'O campo "Cargo" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpColabCargo.SetFocus;
      end
  else
    if Trim(cbpColabSetor.Text) = '' then
      begin
        MessageBox(0, 'O campo "Setor" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbpColabSetor.SetFocus;
      end
  else
    if Trim(cbpColabSede.Text) = '' then
      begin
        MessageBox(0, 'O campo "Sede" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        cbpColabSede.SetFocus;
      end
  else
    begin
      qryUpdateColaborador.ParamByName('descricao').AsString := dbpColabDescricao.Text;
      qryUpdateColaborador.ParamByName('cargo').AsString := dbpColabCargo.Text;
      qryUpdateColaborador.ParamByName('setor').AsInteger := StrToInt(cbpColabSetor.KeyValue);
      qryUpdateColaborador.ParamByName('sede').AsInteger := StrToInt(cbpColabSede.KeyValue);
      qryUpdateColaborador.ParamByName('id').AsInteger := StrToInt(dbpColabID.Text);
      qryUpdateColaborador.ExecSQL;
      dm.FDTabColaborador.Close;
      MessageBox(0, 'Colaborador editado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabColaborador.Open;
      dm.FDTabColaborador.Refresh;
      dm.FDTabColaborador.Last;
      Filtro;
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
    gpColab.Enabled                 := False;
    dbNavColab.Enabled              := False;
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
    gpColab.Enabled                 := True;
    dbNavColab.Enabled              := True;
end;

procedure TListaColaborador.Filtro; // pesquisa com sql query
begin
  qryColab.ParamByName('descricao').AsString := '%' + Trim(epColabDescricao.Text) + '%';
  qryColab.ParamByName('cargo').AsString := '%' + Trim(epColabCargo.Text) + '%';
  qryColab.ParamByName('setor').AsString := '%' + Trim(epColabSetor.Text) + '%';
  qryColab.ParamByName('sede').AsString := '%' + Trim(epColabSede.Text) + '%';

  qryColab.Close;
  qryColab.Open;
end;

procedure TListaColaborador.FormShow(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  dm.FDTabSede.Open;
  Filtro;
  epColabDescricao.SetFocus;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

end.
