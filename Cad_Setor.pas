unit Cad_Setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadSetor = class(TForm)
    Panel5: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gSetor: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbSetorID: TDBEdit;
    Panel12: TPanel;
    Label3: TLabel;
    dbSetorDescricao: TDBEdit;
    qrySetor: TFDQuery;
    dsSetor: TDataSource;
    SBnovo: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsair: TSpeedButton;
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
  CadSetor: TCadSetor;

implementation

{$R *.dfm}

uses Lista_Setor, Data_Module, Tela_Principal;

procedure TCadSetor.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos;
  TelaPrincipal.habilitaMenu;
  dm.FDTabSetor.Cancel;
end;

procedure TCadSetor.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos;
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabSetor.Open;
  dm.FDTabSetor.Append;
  dbSetorDescricao.SetFocus;
end;

procedure TCadSetor.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaSetor); // botão de pesquisar
end;

procedure TCadSetor.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TCadSetor.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbSetorDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbSetorDescricao.SetFocus;
      end
  else
    begin
    try
      dm.FDTabSetor.Post;
      dm.FDTabSetor.Close;
      MessageBox(0, 'Setor cadastrado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      TelaPrincipal.habilitaMenu;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabSetor.Open;
      dm.FDTabSetor.Refresh;
      dm.FDTabSetor.Last;
      qrySetor.Close;
      qrySetor.Open;
    except
      MessageBox(0, PChar('O Setor "' + dbSetorDescricao.Text + '" já foi cadastrado!'), 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      dbSetorDescricao.SetFocus;
    end;
    end;

end;

procedure TCadSetor.FormShow(Sender: TObject);
begin
  qrySetor.Close;
  qrySetor.Open;
end;

procedure TCadSetor.HabilitaCampos; // habilitar campos
begin
    dbSetorDescricao.Enabled            := True;
end;

procedure TCadSetor.DesabilitaCampos; // desabilitar campos
begin
    dbSetorDescricao.Enabled            := False;
end;

end.
