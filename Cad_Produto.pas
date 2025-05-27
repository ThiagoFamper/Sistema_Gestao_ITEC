unit Cad_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadProduto = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
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
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel11: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel12: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Panel13: TPanel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel14: TPanel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel15: TPanel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    procedure SBsairClick(Sender: TObject);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure SBnovoClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBpesquisarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadProduto: TCadProduto;

implementation

{$R *.dfm}

uses Cad_Grupo, Lista_Grupos, Lista_Produtos, Data_Module, Tela_Principal;

procedure TCadProduto.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
  SBpesquisar.Enabled  := True;
  SBsair.Enabled       := True;
  SBnovo.Enabled       := True;
  SBsalvar.Enabled     := False;
  SBcancelar.Enabled   := False;
  DesabilitaCampos();
  dm.FDTabGrupo.Cancel;
  dm.FDTabProduto.Cancel;
  LimpaCampos();
end;

procedure TCadProduto.SBnovoClick(Sender: TObject); // botão de novo
begin
  dm.FDTabGrupo.Open;
  HabilitaCampos();
  SBcancelar.Enabled   := True;
  SBsalvar.Enabled     := True;
  SBpesquisar.Enabled  := False;
  SBsair.Enabled       := False;
  SBnovo.Enabled       := False;
  dm.FDTabProduto.Open;
  dm.FDTabProduto.Append;
  DBEdit2.SetFocus;
end;

procedure TCadProduto.SBpesquisarClick(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  TelaPrincipal.AbrirFormulario(TListaProdutos); // botão de pesquisar
end;

procedure TCadProduto.SBsairClick(Sender: TObject);
begin
  Close; // botão de sair
end;

procedure TCadProduto.SBsalvarClick(Sender: TObject); // botão de salvar
var
  NewID: Integer;
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O campo "Código" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O campo "Descrição" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O campo "Marca" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    if DBEdit5.Text = '' then
      begin
        ShowMessage('O campo "Modelo" deve ser preenchido!');
        DBEdit5.SetFocus;
      end
  else
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O campo "Grupo" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      dm.FDTabGrupo.Close;
      dm.FDTabProduto.Close;
      ShowMessage('Produto cadastrado com sucesso!');
      LimpaCampos();
      DesabilitaCampos();
      SBpesquisar.Enabled  := True;
      SBsair.Enabled       := True;
      SBnovo.Enabled       := True;
      SBsalvar.Enabled     := False;
      SBcancelar.Enabled   := False;
      dm.FDTabProduto.Open;
      dm.FDTabProduto.Refresh;
      dm.FDTabProduto.Last;
    end;

end;

// foco com enter
procedure TCadProduto.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit3.SetFocus;
end;

procedure TCadProduto.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit4.SetFocus;
end;

procedure TCadProduto.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBEdit5.SetFocus;
end;

procedure TCadProduto.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    DBLookupComboBox1.SetFocus;
end;

procedure TCadProduto.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TCadProduto.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TCadProduto.LimpaCampos; // limpar campos
begin
    DBEdit2.Clear;
    DBEdit3.Clear;
    DBEdit4.Clear;
    DBEdit5.Clear;
    DBLookupComboBox1.KeyValue := 0;
end;

end.
