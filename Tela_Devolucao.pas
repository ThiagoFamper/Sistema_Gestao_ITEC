unit Tela_Devolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTelaDevolucao = class(TForm)
    Panel5: TPanel;
    Panel1: TPanel;
    Panel8: TPanel;
    bDevolver: TButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    dbDevProdID: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    dbProdCod: TDBEdit;
    Panel18: TPanel;
    Label16: TLabel;
    dbDevDescricao: TDBEdit;
    Panel23: TPanel;
    Label19: TLabel;
    eDevCod: TEdit;
    Panel24: TPanel;
    Label4: TLabel;
    eDevDescricao: TEdit;
    Panel25: TPanel;
    Label3: TLabel;
    eDevOperador: TEdit;
    qryUpdateEstoque: TFDQuery;
    qryUpdateEmp: TFDQuery;
    rgDev: TRadioGroup;
    qryUpdateItem: TFDQuery;
    Panel10: TPanel;
    Label1: TLabel;
    qryEmprestimo: TFDQuery;
    dsEmprestimo: TDataSource;
    Panel4: TPanel;
    Label2: TLabel;
    eDevColaborador: TEdit;
    Panel9: TPanel;
    Label5: TLabel;
    dbDevSaldo: TDBEdit;
    eDevQtd: TEdit;
    dbDevID: TDBEdit;
    qryUpdateStatus: TFDQuery;
    Panel15: TPanel;
    dbNavDevolucao: TDBNavigator;
    gDev: TDBGrid;
    SBcancelar: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBestoque: TSpeedButton;
    SBsair: TSpeedButton;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bDevolverClick(Sender: TObject);
    procedure rgDevClick(Sender: TObject);
    procedure Filtro;
    procedure eDevCodChange(Sender: TObject);
    procedure eDevDescricaoChange(Sender: TObject);
    procedure eDevOperadorChange(Sender: TObject);
    procedure eDevColaboradorChange(Sender: TObject);
    procedure SBestoqueClick(Sender: TObject);
    procedure LimpaCampos;
    procedure eDevQtdKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDevolucao: TTelaDevolucao;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Devolucao, Tela_Principal, Lista_Estoque;

procedure TTelaDevolucao.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioDevolucao, RelatorioDevolucao);
  RelatorioDevolucao.ShowModal;
  RelatorioDevolucao.Free;
end;

procedure TTelaDevolucao.SBcancelarClick(Sender: TObject); // bot�o de cancelar
begin
    DesabilitaCampos;
    LimpaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    dm.FDTabEmprestimoProd.Cancel;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBestoque.Enabled    := True;
    SBcancelar.Enabled   := False;
end;

procedure TTelaDevolucao.SBeditarClick(Sender: TObject); // bot�o de editar
begin
    HabilitaCampos;
    LimpaCampos;
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa;
    dm.FDTabEmprestimoProd.Edit;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
    SBestoque.Enabled    := False;
end;

procedure TTelaDevolucao.SBestoqueClick(Sender: TObject);
begin
  TelaPrincipal.AbrirFormulario(TListaEstoque); // bot�o de pesquisar
end;

procedure TTelaDevolucao.SBsairClick(Sender: TObject);
begin
  Close(); // bot�o de sair
end;

procedure TTelaDevolucao.HabilitaCampos; // habilitar campos
begin
    rgDev.Enabled              := True;
    eDevQtd.Enabled            := True;
    bDevolver.Enabled          := True;
end;

procedure TTelaDevolucao.bDevolverClick(Sender: TObject);
var
  produtoID, emprestimoID, quantidadeSaldo, quantidadeDevolvida: Integer;
begin
    produtoID := StrToInt(dbDevProdID.Text);
    emprestimoID := StrToInt(dbDevID.Text);

    if rgDev.ItemIndex = 0 then
    begin
      quantidadeSaldo := StrToInt(dbDevSaldo.Text);
      quantidadeDevolvida := quantidadeSaldo;
      if quantidadeDevolvida = 0 then
      begin
        MessageBox(0, 'N�o h� produtos para devolver!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        Exit;
      end;
    end
    else
    begin
      quantidadeDevolvida := StrToInt(eDevQtd.Text);
      quantidadeSaldo := StrToInt(dbDevSaldo.Text);
      if quantidadeDevolvida > quantidadeSaldo then
      begin
        MessageBox(0, 'Quantidade devolvida n�o pode ser maior que a quantidade sendo utilizada!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        eDevQtd.SetFocus;
        Exit;
      end
    else
      if Trim(eDevQtd.Text) = '' then
      begin
        MessageBox(0, 'O campo "Quantidade" deve ser preenchido!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        eDevQtd.SetFocus;
      end
    else
      if StrToInt(eDevQtd.Text) <= 0 then
      begin
        MessageBox(0, 'O campo "Quantidade" n�o pode ser menor ou igual a 0!', 'Controle de Estoque ITEC', MB_OK or MB_ICONERROR);
        eDevQtd.SetFocus;
        Exit;
      end
    end;

    qryUpdateEmp.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    qryUpdateEmp.Params.ParamByName('produtoID').AsInteger := produtoID;
    qryUpdateEmp.ExecSQL;

    qryUpdateEstoque.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    qryUpdateEstoque.Params.ParamByName('emprestimoID').AsInteger := emprestimoID;
    qryUpdateEstoque.ExecSQL;

    qryUpdateItem.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    qryUpdateItem.Params.ParamByName('emprestimoID').AsInteger := emprestimoID;
    qryUpdateItem.ExecSQL;

    if (quantidadeSaldo - quantidadeDevolvida = 0) then
    begin
      qryUpdateStatus.Params.ParamByName('emprestimoID').AsInteger := emprestimoID;
      qryUpdateStatus.ExecSQL;
    end;

    MessageBox(0, 'Devolu��o realizada com sucesso!', 'Controle de Estoque ITEC', MB_OK or MB_ICONINFORMATION);
    DesabilitaCampos;
    LimpaCampos;
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBestoque.Enabled    := True;
    SBcancelar.Enabled   := False;
    Filtro;
end;

procedure TTelaDevolucao.DesabilitaCampos; // desabilitar campos
begin
    rgDev.Enabled              := False;
    eDevQtd.Enabled            := False;
    bDevolver.Enabled          := False;
end;

procedure TTelaDevolucao.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    eDevCod.Enabled            := False;
    eDevDescricao.Enabled      := False;
    eDevOperador.Enabled       := False;
    gDev.Enabled               := False;
    dbNavDevolucao.Enabled     := False;
end;

procedure TTelaDevolucao.LimpaCampos;
begin
  rgDev.ItemIndex := 1;
  eDevQtd.Clear;
end;

procedure TTelaDevolucao.eDevCodChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaDevolucao.eDevColaboradorChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaDevolucao.eDevDescricaoChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaDevolucao.eDevOperadorChange(Sender: TObject);
begin
  Filtro;
end;

procedure TTelaDevolucao.eDevQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-' then
  begin
    Key := #0;
  end;
end;

procedure TTelaDevolucao.FormShow(Sender: TObject);
begin
    dm.FDTabEmprestimoProd.Open;
    Filtro;
end;

procedure TTelaDevolucao.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    eDevCod.Enabled            := True;
    eDevDescricao.Enabled      := True;
    eDevOperador.Enabled       := True;
    gDev.Enabled               := True;
    dbNavDevolucao.Enabled     := True;
end;

procedure TTelaDevolucao.rgDevClick(Sender: TObject);
begin
    if rgDev.ItemIndex = 0 then
    begin
      eDevQtd.Enabled := False;
    end
    else
    begin
      eDevQtd.Enabled := True;
    end;
end;

procedure TTelaDevolucao.Filtro; // pesquisa com sql query
begin
  qryEmprestimo.ParamByName('codigo').AsString := '%' + Trim(eDevCod.Text) + '%';
  qryEmprestimo.ParamByName('descricao').AsString := '%' + Trim(eDevDescricao.Text) + '%';
  qryEmprestimo.ParamByName('operador').AsString := '%' + Trim(eDevOperador.Text) + '%';
  qryEmprestimo.ParamByName('colaborador').AsString := '%' + Trim(eDevColaborador.Text) + '%';

  qryEmprestimo.Close;
  qryEmprestimo.Open;
end;

end.
