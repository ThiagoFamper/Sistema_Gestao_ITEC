unit Tela_Saida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaSaida = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryVerifica: TFDQuery;
    qryUpdateEstoque: TFDQuery;
    Panel17: TPanel;
    Panel18: TPanel;
    Label8: TLabel;
    epProdCod: TEdit;
    Panel20: TPanel;
    Label9: TLabel;
    epProdDescricao: TEdit;
    Panel22: TPanel;
    Label10: TLabel;
    epProdMarca: TEdit;
    Panel27: TPanel;
    Label13: TLabel;
    epProdModelo: TEdit;
    Panel28: TPanel;
    Label14: TLabel;
    epProdGrupo: TEdit;
    Panel4: TPanel;
    dbNavSaida: TDBNavigator;
    gSaida: TDBGrid;
    SBcancelar: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBestoque: TSpeedButton;
    SBsair: TSpeedButton;
    gpSaida: TGridPanel;
    Panel3: TPanel;
    Panel13: TPanel;
    Label11: TLabel;
    dbSaidaID: TDBEdit;
    Panel14: TPanel;
    Label12: TLabel;
    dbSaidaCod: TDBEdit;
    Panel29: TPanel;
    Label15: TLabel;
    dbSaidaDescricaoProd: TDBEdit;
    Panel9: TPanel;
    bSaida: TButton;
    Panel10: TPanel;
    Label4: TLabel;
    dbSaidaQtd: TEdit;
    Panel19: TPanel;
    Label16: TLabel;
    dbSaidaDescricao: TEdit;
    procedure SBcancelarClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure SBsairClick(Sender: TObject);
    procedure Filtro;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCamposPesquisa;
    procedure FormShow(Sender: TObject);
    procedure epProdCodChange(Sender: TObject);
    procedure epProdDescricaoChange(Sender: TObject);
    procedure epProdModeloChange(Sender: TObject);
    procedure epProdMarcaChange(Sender: TObject);
    procedure epProdGrupoChange(Sender: TObject);
    procedure bSaidaClick(Sender: TObject);
    procedure SBestoqueClick(Sender: TObject);
    procedure LimpaCampos;
    procedure dbSaidaQtdKeyPress(Sender: TObject; var Key: Char);
    procedure Panel9Resize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaSaida: TTelaSaida;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Saida, Tela_Principal, Lista_Estoque;

procedure TTelaSaida.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos;
    LimpaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    gSaida.Enabled       := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBestoque.Enabled    := True;
    SBcancelar.Enabled   := False;
    bSaida.Enabled       := False;
    dm.FDTabSaida.Cancel;
end;

procedure TTelaSaida.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos;
    LimpaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    gSaida.Enabled       := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    SBestoque.Enabled    := False;
    bSaida.Enabled       := True;
    dm.FDTabSaida.Open;
    dm.FDTabSaida.Append;
    dbSaidaQtd.SetFocus;
end;

procedure TTelaSaida.SBestoqueClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEstoque); // botão de pesquisar
end;

procedure TTelaSaida.SBrelatorioClick(Sender: TObject);
begin
  if not Assigned(RelatorioSaida) then
    Application.CreateForm(TRelatorioSaida, RelatorioSaida);

  RelatorioSaida.ShowModal;
end;

procedure TTelaSaida.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaSaida.HabilitaCampos; // habilitar campos
begin
    dbSaidaQtd.Enabled           := True;
    dbSaidaDescricao.Enabled     := True;
end;

procedure TTelaSaida.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    epProdCod.Enabled            := True;
    epProdDescricao.Enabled      := True;
    epProdModelo.Enabled         := True;
    epProdMarca.Enabled          := True;
    epProdGrupo.Enabled          := True;
    gSaida.Enabled               := True;
    dbNavSaida.Enabled           := True;
end;

procedure TTelaSaida.bSaidaClick(Sender: TObject);
var
  produtoID, quantidade, saldoAtual: Integer;
begin
    if Trim(dbSaidaQtd.Text) = '' then
      begin
        MessageBox(0, 'O campo "Quantidade" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbSaidaQtd.SetFocus;
      end
  else
    if StrToInt(dbSaidaQtd.Text) <= 0 then
      begin
        MessageBox(0, 'O campo "Quantidade" não pode ser menor ou igual a 0!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbSaidaQtd.SetFocus;
      end
  else
    if Trim(dbSaidaDescricao.Text) = '' then
      begin
        MessageBox(0, 'O campo "Descrição" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        dbSaidaQtd.SetFocus;
      end
  else
    begin
      produtoID  := StrToInt(dbSaidaID.Text);
      quantidade := StrToInt(dbSaidaQtd.Text);

      qryVerifica.Close;
      qryVerifica.ParamByName('produto_id').AsInteger := produtoID;
      qryVerifica.Open;

    if qryVerifica.IsEmpty then
    begin
      MessageBox(0, 'Produto não encontrado no estoque!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      Exit;
    end;

      saldoAtual := qryVerifica.FieldByName('saldo').AsInteger;

    if saldoAtual < quantidade then
    begin
      MessageBox(0, 'Estoque insuficiente para esta saída!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
      Exit;
    end;

      dm.FDTabSaida.FieldByName('produto_id').AsInteger := produtoID;
      dm.FDTabSaida.FieldByName('quantidade').AsInteger := quantidade;
      dm.FDTabSaida.FieldByName('descricao').AsString   := dbSaidaDescricao.Text;
      dm.FDTabSaida.FieldByName('operador').AsInteger   := TelaPrincipal.usuarioID;
      dm.FDTabSaida.Post;

      qryUpdateEstoque.ParamByName('produto_id').AsInteger := produtoID;
      qryUpdateEstoque.ParamByName('quantidade').AsInteger := quantidade;
      qryUpdateEstoque.ExecSQL;

      dm.FDTabSaida.Close;
      MessageBox(0, 'Saída realizada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
      DesabilitaCampos;
      HabilitaCamposPesquisa;
      LimpaCampos;
      TelaPrincipal.habilitaMenu;
      SBsair.Enabled       := True;
      SBcancelar.Enabled   := False;
      SBeditar.Enabled     := True;
      SBestoque.Enabled    := True;
      SBrelatorio.Enabled  := True;
      bSaida.Enabled       := False;
      dm.FDTabSaida.Open;
      dm.FDTabSaida.Refresh;
      dm.FDTabSaida.Last;
      Filtro;
    end;
end;

procedure TTelaSaida.dbSaidaQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-' then
  begin
    Key := #0;
  end;
end;

procedure TTelaSaida.DesabilitaCampos; // desabilitar campos
begin
    dbSaidaQtd.Enabled           := False;
    dbSaidaDescricao.Enabled     := False;
end;

procedure TTelaSaida.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    epProdCod.Enabled            := False;
    epProdDescricao.Enabled      := False;
    epProdModelo.Enabled         := False;
    epProdMarca.Enabled          := False;
    epProdGrupo.Enabled          := False;
    gSaida.Enabled               := False;
    dbNavSaida.Enabled           := False;
end;

procedure TTelaSaida.LimpaCampos;
begin
  dbSaidaQtd.Clear;
  dbSaidaDescricao.Clear;
end;

procedure TTelaSaida.Panel9Resize(Sender: TObject);
begin
  // Centraliza horizontalmente o botão dentro do painel
  bSaida.Left := (Panel9.Width - bSaida.Width) div 2;
  // Centraliza verticalmente o botão dentro do painel
  bSaida.Top := (Panel9.Height - bSaida.Height * 2) div 1;
end;

procedure TTelaSaida.epProdCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdGrupoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdMarcaChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.epProdModeloChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaSaida.Filtro; // pesquisa com sql query
begin
  qryProduto.ParamByName('codigo').AsString := '%' + Trim(epProdCod.Text) + '%';
  qryProduto.ParamByName('descricao').AsString := '%' + Trim(epProdDescricao.Text) + '%';
  qryProduto.ParamByName('marca').AsString := '%' + Trim(epProdModelo.Text) + '%';
  qryProduto.ParamByName('modelo').AsString := '%' + Trim(epProdMarca.Text) + '%';
  qryProduto.ParamByName('grupo').AsString := '%' + Trim(epProdGrupo.Text) + '%';

  qryProduto.Close;
  qryProduto.Open;
end;

procedure TTelaSaida.FormShow(Sender: TObject);
begin
  Filtro;
  // Centraliza horizontalmente o botão dentro do painel
  bSaida.Left := (Panel9.Width - bSaida.Width) div 2;
  // Centraliza verticalmente o botão dentro do painel
  bSaida.Top := (Panel9.Height - bSaida.Height * 2) div 1
end;

end.
