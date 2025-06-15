unit Relatorio_Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frCoreClasses, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, Vcl.ExtCtrls, DateUtils,
  Vcl.DBCtrls;

type
  TRelatorioEstoque = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    frxDSRelatEstoque: TfrxDBDataset;
    FDQueryRelatEstoque: TFDQuery;
    frxRelatEstoque: TfrxReport;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    GridPanel1: TGridPanel;
    bRelat: TBitBtn;
    bCancelar: TBitBtn;
    Label3: TLabel;
    EditMarca: TEdit;
    EditModelo: TEdit;
    EditGrupo: TEdit;
    dsRelatEstoque: TDataSource;
    procedure bCancelarClick(Sender: TObject);
    procedure bRelatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EditMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EditModeloKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioEstoque: TRelatorioEstoque;

implementation

{$R *.dfm}

uses Data_Module, Cad_Produto, Cad_Grupo;

// botão de gerar relatório
procedure TRelatorioEstoque.bRelatClick(Sender: TObject);
  var
    Filtro: string;
    TemFiltro: Boolean;
  begin
    // Começa com a SQL base definida no design
    FDQueryRelatEstoque.Close;
    FDQueryRelatEstoque.SQL.Clear;
    FDQueryRelatEstoque.SQL.Add(
      'SELECT ' +
      '  p.cod_produto, ' +
      '  p.descricao, ' +
      '  g.descricao AS grupo_descricao, ' +
      '  p.marca, ' +
      '  p.modelo, ' +
      '  es.saldo ' +
      'FROM estoqueitec.produto p ' +
      'JOIN estoqueitec.grupo g ON g.id = p.grupo_id ' +
      'JOIN estoqueitec.estoque es ON es.produto_id = p.id'
    );

    // Monta os filtros
    Filtro := '';
    TemFiltro := False;

    if Trim(EditMarca.Text) <> '' then
    begin
      Filtro := Filtro + 'p.marca ILIKE :marca ';
      TemFiltro := True;
    end;

    if Trim(EditModelo.Text) <> '' then
    begin
      if TemFiltro then Filtro := Filtro + 'OR ';
      Filtro := Filtro + 'p.modelo ILIKE :modelo ';
      TemFiltro := True;
    end;

    if Trim(EditGrupo.Text) <> '' then
    begin
      if TemFiltro then Filtro := Filtro + 'OR ';
      Filtro := Filtro + 'g.descricao ILIKE :grupo ';
      TemFiltro := True;
    end;

      // Aplica o WHERE com os filtros agrupados + saldo
    if TemFiltro then
      FDQueryRelatEstoque.SQL.Add('WHERE (' + Filtro + ') AND es.saldo <> 0')
    else
      FDQueryRelatEstoque.SQL.Add('WHERE es.saldo <> 0');

    // Define os parâmetros
    if Trim(EditMarca.Text) <> '' then
      FDQueryRelatEstoque.ParamByName('marca').AsString := '%' + EditMarca.Text + '%';

    if Trim(EditModelo.Text) <> '' then
      FDQueryRelatEstoque.ParamByName('modelo').AsString := '%' + EditModelo.Text + '%';

    if Trim(EditGrupo.Text) <> '' then
      FDQueryRelatEstoque.ParamByName('grupo').AsString := '%' + EditGrupo.Text + '%';

    // Executa a query
    FDQueryRelatEstoque.Open;


    frxRelatEstoque.ShowReport;
  end;

procedure TRelatorioEstoque.EditMarcaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  EditModelo.SetFocus;
end;

procedure TRelatorioEstoque.EditModeloKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  EditGrupo.SetFocus;
end;

//lipa os campos após fechar a tela de filtro
procedure TRelatorioEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EditMarca.Clear;
  EditModelo.Clear;
  EditGrupo.Clear;
end;

//foca no campo de marca ao abrir a tela de filtro
procedure TRelatorioEstoque.FormShow(Sender: TObject);
begin
  EditMarca.SetFocus;
end;

// botão de cancelar
procedure TRelatorioEstoque.bCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
