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
    Edit6: TEdit;
    Button2: TButton;
    Panel2: TPanel;
    SBsair: TSpeedButton;
    SBrelatorio: TSpeedButton;
    SBsalvar: TSpeedButton;
    SBcancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBeditar: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Panel14: TPanel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Panel16: TPanel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Panel17: TPanel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Panel18: TPanel;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Panel19: TPanel;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    Panel22: TPanel;
    DBGrid1: TDBGrid;
    Panel23: TPanel;
    Label19: TLabel;
    Edit1: TEdit;
    Panel24: TPanel;
    Label4: TLabel;
    Edit2: TEdit;
    Panel25: TPanel;
    Label3: TLabel;
    Edit5: TEdit;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    RadioGroup1: TRadioGroup;
    FDQuery4: TFDQuery;
    procedure HabilitaCampos;
    procedure HabilitaCamposPesquisa;
    procedure DesabilitaCampos;
    procedure DesabilitaCamposPesquisa;
    procedure SBsairClick(Sender: TObject);
    procedure SBeditarClick(Sender: TObject);
    procedure SBcancelarClick(Sender: TObject);
    procedure SBrelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDevolucao: TTelaDevolucao;

implementation

{$R *.dfm}

uses Data_Module, Relatorio_Devolucao;

procedure TTelaDevolucao.SBrelatorioClick(Sender: TObject);
begin
  Application.CreateForm(TRelatorioDevolucao, RelatorioDevolucao);
  RelatorioDevolucao.ShowModal;
  RelatorioDevolucao.Free;
end;

procedure TTelaDevolucao.SBcancelarClick(Sender: TObject); // botão de cancelar
begin
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    dm.FDTabEmprestimoProd.Cancel;
    DBGrid1.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
end;

procedure TTelaDevolucao.SBeditarClick(Sender: TObject); // botão de editar
begin
    HabilitaCampos();
    DesabilitaCamposPesquisa();
    dm.FDTabEmprestimoProd.Edit;
    DBGrid1.Enabled      := False;
    SBcancelar.Enabled   := True;
    SBsalvar.Enabled     := True;
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
    DBEdit2.Enabled            := True;
    DBEdit3.Enabled            := True;
    DBEdit4.Enabled            := True;
    DBEdit5.Enabled            := True;
    DBEdit6.Enabled            := True;
    RadioGroup1.Enabled        := True;
    Edit6.Enabled              := True;
    Button2.Enabled            := True;
end;

procedure TTelaDevolucao.Button2Click(Sender: TObject);
var
  produtoID, emprestimoID, quantidadeSaldo, quantidadeDevolvida: Integer;
begin
    produtoID := StrToInt(DBEdit2.Text);
    emprestimoID := StrToInt(DBEdit1.Text);

    if RadioGroup1.ItemIndex = 0 then
    begin
      quantidadeSaldo := StrToInt(DBEdit6.Text);
      quantidadeDevolvida := quantidadeSaldo;
      if quantidadeDevolvida = 0 then
      begin
        showMessage('Não há produtos para devolver!');
        Exit;
      end;
    end
    else
    begin
      quantidadeDevolvida := StrToInt(Edit6.Text);
      quantidadeSaldo := StrToInt(DBEdit6.Text);
      if quantidadeDevolvida > quantidadeSaldo then
      begin
        ShowMessage('Quantidade devolvida não deve ser maior que o saldo do empréstimo!');
        Exit;
      end;
    end;

    FDQuery3.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    FDQuery3.Params.ParamByName('produtoID').AsInteger := produtoID;
    FDQuery3.ExecSQL;

    FDQuery2.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    FDQuery2.Params.ParamByName('emprestimoID').AsInteger := emprestimoID;
    FDQuery2.ExecSQL;

    FDQuery4.Params.ParamByName('quantidade').AsInteger := quantidadeDevolvida;
    FDQuery4.Params.ParamByName('emprestimoID').AsInteger := emprestimoID;
    FDQuery4.ExecSQL;

    showMessage('Devolução realizada com sucesso!');
    DesabilitaCampos();
    HabilitaCamposPesquisa();
    DBGrid1.Enabled      := True;
    SBrelatorio.Enabled  := True;
    SBsair.Enabled       := True;
    SBeditar.Enabled     := True;
    SBcancelar.Enabled   := False;
    SBsalvar.Enabled     := False;
    
end;

procedure TTelaDevolucao.DesabilitaCampos; // desabilitar campos
begin
    DBEdit2.Enabled            := False;
    DBEdit3.Enabled            := False;
    DBEdit4.Enabled            := False;
    DBEdit5.Enabled            := False;
    DBEdit6.Enabled            := False;
    RadioGroup1.Enabled        := False;
    Edit6.Enabled              := False;
    Button2.Enabled            := False;
end;

procedure TTelaDevolucao.DesabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := False;
    Edit2.Enabled            := False;
    Edit5.Enabled            := False;
end;

procedure TTelaDevolucao.FormShow(Sender: TObject);
begin
    dm.FDTabEmprestimoProd.Open;
    dm.FDTabEmprestimoItem.Open;
end;

procedure TTelaDevolucao.HabilitaCamposPesquisa; // desabilitar campos de pesquisa
begin
    Edit1.Enabled            := True;
    Edit2.Enabled            := True;
    Edit5.Enabled            := True;
end;

procedure TTelaDevolucao.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      Edit6.Enabled := False;
    end
    else
    begin
      Edit6.Enabled := True;
    end;
end;

end.
