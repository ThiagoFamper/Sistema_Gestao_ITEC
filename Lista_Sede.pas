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
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel4: TPanel;
    dbNavSede: TDBNavigator;
    Panel3: TPanel;
    gpSede: TDBGrid;
    Panel11: TPanel;
    Label3: TLabel;
    epSedeDescricao: TEdit;
    qrySede: TFDQuery;
    dsSede: TDataSource;
    SBeditar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsair: TSpeedButton;
    qryUpdateSede: TFDQuery;
    qryDelete: TFDQuery;
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
  if Trim(dbpSedeID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para excluir!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;

  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpSedeDescricao.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    try
      dm.FDTabSede.Open;
      qryDelete.ParamByName('id').AsInteger := StrToInt(dbpSedeID.Text);
      qryDelete.ExecSQL;
      MessageBox(0, 'Sede excluída com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
    except
        MessageBox(0, 'Sede está sendo utilizada em outro registro!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TListaSede.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  if dm.FDTabSede.State in [dsEdit, dsInsert] then
  begin
    dm.FDTabSede.Cancel;
  end;
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabSede.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaSede.SBeditarClick(Sender: TObject); // botão de editar
begin
  if Trim(dbpSedeID.Text) = '' then
  begin
    MessageBox(0, 'Selecione um registro válido para editar!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    Exit;
  end;
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabSede.Open;
    dm.FDTabSede.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpSedeDescricao.SetFocus;
end;

procedure TListaSede.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TListaSede.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpSedeDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpSedeDescricao.SetFocus;
      end
  else
    begin
    try
      qryUpdateSede.ParamByName('descricao').AsString := dbpSedeDescricao.Text;
      qryUpdateSede.ParamByName('id').AsInteger := StrToInt(dbpSedeID.Text);
      qryUpdateSede.ExecSQL;
      dm.FDTabSede.Close;
      MessageBox(0, 'Sede editada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabSede.Open;
      dm.FDTabSede.Refresh;
      dm.FDTabSede.Last;
      Filtro;
    except
      MessageBox(0, PChar('A Sede "' + dbpSedeDescricao.Text + '" já foi cadastrada!'), 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      dbpSedeDescricao.SetFocus;
    end;
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
    gpSede.Enabled                     := False;
    dbNavSede.Enabled                  := False;
end;

procedure TListaSede.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epSedeDescricao.Enabled            := True;
    gpSede.Enabled                     := True;
    dbNavSede.Enabled                  := True;
end;

procedure TListaSede.Filtro; // pesquisa com sql query
begin
  qrySede.ParamByName('descricao').AsString := '%' + Trim(epSedeDescricao.Text) + '%';

  qrySede.Close;
  qrySede.Open;
end;

procedure TListaSede.FormShow(Sender: TObject);
begin
  Filtro;
  epSedeDescricao.SetFocus;

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
