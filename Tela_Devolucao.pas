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
    Label2: TLabel;
    eDevQtd: TEdit;
    bDevolver: TButton;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel3: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    dbDevID: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    dbDevCod: TDBEdit;
    Panel16: TPanel;
    Label12: TLabel;
    dbDevData: TDBEdit;
    Panel17: TPanel;
    Label14: TLabel;
    dbDevQtd: TDBEdit;
    Panel18: TPanel;
    Label16: TLabel;
    dbDevOperador: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    dbDevSaldo: TDBEdit;
    Panel22: TPanel;
    gDev: TDBGrid;
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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDevolucao: TTelaDevolucao;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Devolucao, Tela_Principal;

procedure TTelaDevolucao.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioDevolucao, RelatorioDevolucao);
  RelatorioDevolucao.ShowModal;
  RelatorioDevolucao.Free;
end;

procedure TTelaDevolucao.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    dm.FDTabEmprestimoProd.Cancel;
    gDev.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
end;

procedure TTelaDevolucao.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    TelaPrincipal.desabilitaMenu;
    DesabilitaCamposPesquisa();
    dm.FDTabEmprestimoProd.Edit;
    gDev.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBrelatorio.Enabled  := False;
    SBsair.Enabled       := False;
    SBeditar.Enabled     := False;
end;

procedure TTelaDevolucao.SBsairClick(Sender: TObject);
begin
  Close(); // botão de sair
end;

procedure TTelaDevolucao.HabilitaCampos; // habilitar campos
begin
    dbDevCod.Enabled           := True;
    dbDevOperador.Enabled      := True;
    dbDevData.Enabled          := True;
    dbDevQtd.Enabled           := True;
    dbDevSaldo.Enabled         := True;
    rgDev.Enabled              := True;
    eDevQtd.Enabled            := True;
    bDevolver.Enabled          := True;
end;

procedure TTelaDevolucao.bDevolverClick(Sender: TObject);
var
  produtoID, emprestimoID, quantidadeSaldo, quantidadeDevolvida: Integer;
begin
    produtoID := StrToInt(dbDevCod.Text);
    emprestimoID := StrToInt(dbDevID.Text);

    if rgDev.ItemIndex = 0 then
    begin
      quantidadeSaldo := StrToInt(dbDevSaldo.Text);
      quantidadeDevolvida := quantidadeSaldo;
      if quantidadeDevolvida = 0 then
      begin
        showMessage('Não há produtos para devolver!');
        Exit;
      end;
    end
    else
    begin
      quantidadeDevolvida := StrToInt(eDevQtd.Text);
      quantidadeSaldo := StrToInt(dbDevSaldo.Text);
      if quantidadeDevolvida > quantidadeSaldo then
      begin
        ShowMessage('Quantidade devolvida não deve ser maior que o saldo do empréstimo!');
        Exit;
      end;
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

    showMessage('Devolução realizada com sucesso!');
    DesabilitaCampos();
    TelaPrincipal.habilitaMenu;
    HabilitaCamposPesquisa();
    gDev.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;

end;

procedure TTelaDevolucao.DesabilitaCampos; // desabilitar campos
begin
    dbDevCod.Enabled           := False;
    dbDevOperador.Enabled      := False;
    dbDevData.Enabled          := False;
    dbDevQtd.Enabled           := False;
    dbDevSaldo.Enabled         := False;
    rgDev.Enabled              := False;
    eDevQtd.Enabled            := False;
    bDevolver.Enabled          := False;
end;

procedure TTelaDevolucao.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    eDevCod.Enabled            := False;
    eDevDescricao.Enabled      := False;
    eDevOperador.Enabled       := False;
end;

procedure TTelaDevolucao.FormShow(Sender: TObject);
begin
    dm.FDTabEmprestimoProd.Open;
    dm.FDTabEmprestimoItem.Open;
end;

procedure TTelaDevolucao.HabilitaCamposPesquisa; // habilitar campos de pesquisa
begin
    eDevCod.Enabled            := True;
    eDevDescricao.Enabled      := True;
    eDevOperador.Enabled       := True;
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

end.
