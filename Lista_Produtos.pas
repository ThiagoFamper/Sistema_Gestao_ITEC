unit Lista_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaProdutos = class(TForm)
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBexcluir: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    Panel7: TPanel;
    SBeditar: TSpeedButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    DBNavigator1: TDBNavigator;
    Panel5: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel15: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Panel19: TPanel;
    Label7: TLabel;
    Panel20: TPanel;
    Label8: TLabel;
    Panel21: TPanel;
    Label9: TLabel;
    Panel22: TPanel;
    Label10: TLabel;
    Panel23: TPanel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBexcluirClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBsalvarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure Filtro;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaProdutos: TListaProdutos;

implementation

{$R *.dfm}

uses Cad_Produto, Data_Module, Relatorio_Produto;

procedure TListaProdutos.SBexcluirClick(Sender: TObject); // bot�o de excluir
begin
  if MessageDlg('Voc� tem certeza que deseja excluir este registro?',mtConfirmation,[mbyes,mbno],0)=mryes then
  dm.FDTabProduto.Delete;
end;

procedure TListaProdutos.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioProduto, RelatorioProduto);
  RelatorioProduto.ShowModal;
  RelatorioProduto.Free;
end;

procedure TListaProdutos.SBcancelarClick(Sender: TObject); // bot�o de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabProduto.Cancel;
    DBGrid1.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBexcluir.Enabled    := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TListaProdutos.SBeditarClick(Sender: TObject); // bot�o de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabProduto.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
    SBrelatorio.Enabled  := False;
    SBexcluir.Enabled    := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TListaProdutos.SBsairClick(Sender: TObject);
begin
  Close(); // bot�o de sair
end;

procedure TListaProdutos.SBsalvarClick(Sender: TObject); // bot�o de salvar
begin
    if DBEdit2.Text = '' then
      begin
        ShowMessage('O Campo "C�digo" deve ser preenchido!');
        DBEdit2.SetFocus;
      end
  else
    if DBEdit3.Text = '' then
      begin
        ShowMessage('O Campo "Descri��o" deve ser preenchido!');
        DBEdit3.SetFocus;
      end
  else
    if DBEdit4.Text = '' then
      begin
        ShowMessage('O Campo "Marca" deve ser preenchido!');
        DBEdit4.SetFocus;
      end
  else
    if DBEdit5.Text = '' then
      begin
        ShowMessage('O Campo "Modelo" deve ser preenchido!');
        DBEdit5.SetFocus;
      end
  else
    if DBLookupComboBox1.Text = '' then
      begin
        ShowMessage('O Campo "Grupo" deve ser preenchido!');
        DBLookupComboBox1.SetFocus;
      end
  else
    begin
      dm.FDTabProduto.Post;
      ShowMessage('Produto editado com sucesso!');
      DesabilitaCampos();
      HabilitaCamposPesquisa();
      DBGrid1.Enabled      := True;
      SBrelatorio.Enabled  := True;
      SBexcluir.Enabled    := True;
      SBsair.Enabled       := True;
      SBeditar.Enabled     := True;
      SBcancelar.Enabled   := False;
      SBsalvar.Enabled     := False;
    end;
end;

procedure TListaProdutos.HabilitaCampos; // habilitar campos
begin
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBLookupComboBox1.Enabled  := True;
end;

procedure TListaProdutos.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBLookupComboBox1.Enabled  := False;
end;

procedure TListaProdutos.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit3.Enabled            := False;
    Edit4.Enabled            := False;
    Edit5.Enabled            := False;
end;

procedure TListaProdutos.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit3.Enabled            := True;
    Edit4.Enabled            := True;
    Edit5.Enabled            := True;
end;

procedure TListaProdutos.Filtro; // pesquisa com sql query
begin
  FDQuery1.ParamByName('codigo').AsString := '%' + Edit1.Text + '%';
  FDQuery1.ParamByName('descricao').AsString := '%' + Edit2.Text + '%';
  FDQuery1.ParamByName('marca').AsString := '%' + Edit3.Text + '%';
  FDQuery1.ParamByName('modelo').AsString := '%' + Edit4.Text + '%';
  FDQuery1.ParamByName('grupo').AsString := '%' + Edit5.Text + '%';

  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TListaProdutos.FormShow(Sender: TObject);
begin
  dm.FDTabProduto.Open;
  dm.FDTabGrupo.Open;
  Filtro;
end;

procedure TListaProdutos.Edit1Change(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.Edit2Change(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.Edit3Change(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.Edit4Change(Sender: TObject);
begin
  Filtro;
end;

procedure TListaProdutos.Edit5Change(Sender: TObject);
begin
  Filtro;
end;

end.
