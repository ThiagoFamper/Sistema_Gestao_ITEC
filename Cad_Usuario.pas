unit Cad_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadUsuario = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gUsuario: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    dbUsuarioID: TDBEdit;
    Panel11: TPanel;
    Label5: TLabel;
    Panel12: TPanel;
    Label2: TLabel;
    dbUsuarioLogin: TDBEdit;
    Panel13: TPanel;
    Label3: TLabel;
    dbUsuarioSenha: TDBEdit;
    Panel14: TPanel;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    SBnovo: TSpeedButton;
    SBcancelar: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBpesquisar: TSpeedButton;
    SBsair: TSpeedButton;
    dbUsuarioNome: TDBLookupComboBox;
    cbUsuarioAdmin: TDBCheckBox;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUsuario: TCadUsuario;

implementation

{$R *.dfm}

uses Lista_Usuario, Data_Module, Tela_Principal;

procedure TCadUsuario.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos;
  TelaPrincipal.habilitaMenu;
  dm.FDTabUsuario.Cancel;
end;

procedure TCadUsuario.SBnovoClick(Sender: TObject); // botão de novo
begin
  HabilitaCampos;
  TelaPrincipal.desabilitaMenu;
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabUsuario.Open;
  dm.FDTabUsuario.Append;
  dbUsuarioNome.SetFocus;
end;

procedure TCadUsuario.SBpesquisarClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaUsuario); // botão de pesquisar
end;

procedure TCadUsuario.SBsairClick(Sender: TObject);
begin
  close(); // botão de sair
end;

procedure TCadUsuario.SBsalvarClick(Sender: TObject); // botão de salvar
begin
    if Trim(dbUsuarioNome.Text) = '' then
      begin
        MessageBox(0, 'O campo "Nome" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbUsuarioNome.SetFocus;
      end
  else
    if Trim(dbUsuarioLogin.Text) = '' then
      begin
        MessageBox(0, 'O campo "Login" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbUsuarioLogin.SetFocus;
      end
  else
    if Trim(dbUsuarioSenha.Text) = '' then
      begin
        MessageBox(0, 'O campo "Senha" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbUsuarioSenha.SetFocus;
      end
  else
    begin
      dm.FDTabUsuario.FieldByName('admin').AsBoolean := cbUsuarioAdmin.Checked;
      dm.FDTabUsuario.Post;
      dm.FDTabUsuario.Close;
      MessageBox(0, 'Usuário cadastrado com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      TelaPrincipal.habilitaMenu;
      DesabilitaCampos;
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabUsuario.Open;
      dm.FDTabUsuario.Refresh;
      dm.FDTabUsuario.Last;
      qryUsuario.Close;
      qryUsuario.Open;
    end;

end;

procedure TCadUsuario.FormShow(Sender: TObject);
begin
  qryUsuario.Close;
  qryUsuario.Open;
end;

procedure TCadUsuario.gUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  TextToDraw: string;
begin
  if Column.Title.Caption = 'Usuário é Admin?' then
  begin
    if qryUsuario.FieldByName('admin').AsBoolean then
      TextToDraw := 'Sim'
    else
      TextToDraw := 'Não';

    gUsuario.Canvas.FillRect(Rect);
    gUsuario.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TextToDraw);
  end
  else
  begin
    gUsuario.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TCadUsuario.HabilitaCampos; // habilitar campos
begin
    dbUsuarioNome.Enabled           := True;
    dbUsuarioLogin.Enabled          := True;
    dbUsuarioSenha.Enabled          := True;
    cbUsuarioAdmin.Enabled          := True;
end;

procedure TCadUsuario.DesabilitaCampos; // desabilitar campos
begin
    dbUsuarioNome.Enabled           := False;
    dbUsuarioLogin.Enabled          := False;
    dbUsuarioSenha.Enabled          := False;
    cbUsuarioAdmin.Enabled          := False;
end;

end.
