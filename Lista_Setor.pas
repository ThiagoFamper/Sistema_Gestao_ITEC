unit Lista_Setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaSetor = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel4: TPanel;
    dbNavSetor: TDBNavigator;
    Panel3: TPanel;
    gpSetor: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    dbpSetorID: TDBEdit;
    Panel15: TPanel;
    Label2: TLabel;
    dbpSetorDescricao: TDBEdit;
    Panel16: TPanel;
    Label7: TLabel;
    epSetorDescricao: TEdit;
    qrySetor: TFDQuery;
    dsSetor: TDataSource;
    SBeditar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsair: TSpeedButton;
    qryUpdateSetor: TFDQuery;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure epSetorDescricaoChange(Sender: TObject);
    procedure Filtro;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaSetor: TListaSetor;

implementation

{$R *.dfm}

uses Cad_Setor, Data_Module, Tela_Principal;

procedure TListaSetor.SBexcluirClick(Sender: TObject); // botão de excluir
var
  resposta: Integer;
begin
  resposta := MessageBox(0, PChar('Você tem certeza que deseja excluir este registro: ' + dbpSetorDescricao.Text + '?'),
  'Confirmação de Exclusão', MB_YESNO or MB_ICONWARNING);

  if resposta = IDYES then
  begin
    try
      dm.FDTabSetor.Delete;
      MessageBox(0, 'Setor excluído com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      Filtro;
    except
        MessageBox(0, 'Setor está sendo utilizado em outro registro!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TListaSetor.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabSetor.Cancel;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaSetor.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabSetor.Open;
    dm.FDTabSetor.Edit;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    dbpSetorDescricao.SetFocus;
end;

procedure TListaSetor.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TListaSetor.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbpSetorDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbpSetorDescricao.SetFocus;
      end
  else
    begin
      qryUpdateSetor.ParamByName('descricao').AsString := dbpSetorDescricao.Text;
      qryUpdateSetor.ParamByName('id').AsInteger := StrToInt(dbpSetorID.Text);
      qryUpdateSetor.ExecSQL;
      dm.FDTabSetor.Close;
      MessageBox(0, 'Setor editado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      HabilitaCamposPesquisa;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
      dm.FDTabSetor.Open;
      dm.FDTabSetor.Refresh;
      dm.FDTabSetor.Last;
      Filtro;
    end;
end;

procedure TListaSetor.HabilitaCampos; // habilitar campos
begin
    dbpSetorDescricao.Enabled            := True;
end;

procedure TListaSetor.DesabilitaCampos; // desabilitar campos
begin
    dbpSetorDescricao.Enabled            := False;
end;

procedure TListaSetor.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epSetorDescricao.Enabled            := False;
    gpSetor.Enabled                     := False;
    dbNavSetor.Enabled                  := False;
end;

procedure TListaSetor.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epSetorDescricao.Enabled            := True;
    gpSetor.Enabled                     := True;
    dbNavSetor.Enabled                  := True;
end;

procedure TListaSetor.Filtro; // pesquisa com sql query
begin
  qrySetor.ParamByName('descricao').AsString := '%' + Trim(epSetorDescricao.Text) + '%';

  qrySetor.Close;
  qrySetor.Open;
end;

procedure TListaSetor.FormShow(Sender: TObject);
begin
  Filtro;
  epSetorDescricao.SetFocus;

  if not TelaPrincipal.isAdmin then
  begin
    SBeditar.Enabled  := False;
    SBexcluir.Enabled := False;
  end;

end;

procedure TListaSetor.epSetorDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

end.
