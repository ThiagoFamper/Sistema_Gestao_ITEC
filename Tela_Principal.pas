unit Tela_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Imaging.pngimage, frxSmartMemo, frCoreClasses, frxClass,
  frxDBSet, frxFDQueryBuilder, frxFDComponents;

type
  TTelaPrincipal = class(TForm)
    Panel2: TPanel;
    pnpCadastro: TPanel;
    pnpCadProd: TPanel;
    Image11: TImage;
    pnpCadColab: TPanel;
    Image12: TImage;
    pnpCadSet: TPanel;
    Image13: TImage;
    pnpCadGru: TPanel;
    Image14: TImage;
    pnpCadVoltar: TPanel;
    Image15: TImage;
    Panel21: TPanel;
    pnpCadUser: TPanel;
    Image16: TImage;
    pnpMovimentacao: TPanel;
    pnpMovEnt: TPanel;
    Image17: TImage;
    pnpMovSai: TPanel;
    Image18: TImage;
    pnpMovEmp: TPanel;
    Image19: TImage;
    pnpMovDev: TPanel;
    Image20: TImage;
    pnpMovVoltar: TPanel;
    Image21: TImage;
    Panel29: TPanel;
    pnpConulta: TPanel;
    pnpConProd: TPanel;
    Image22: TImage;
    pnpConColab: TPanel;
    Image23: TImage;
    pnpConSet: TPanel;
    Image24: TImage;
    pnpConGru: TPanel;
    Image25: TImage;
    pnpConVoltar: TPanel;
    Image26: TImage;
    Panel36: TPanel;
    pnpConUser: TPanel;
    Image27: TImage;
    pnpConEnt: TPanel;
    Image28: TImage;
    pnpConSai: TPanel;
    Image29: TImage;
    pnpConEmp: TPanel;
    Image30: TImage;
    pnpPrincipal: TPanel;
    pnpCad: TPanel;
    Image6: TImage;
    pnpMov: TPanel;
    Image7: TImage;
    pnpCons: TPanel;
    Image8: TImage;
    pnpSair: TPanel;
    Image10: TImage;
    Panel3: TPanel;
    pnlConteudo: TPanel;
    pnpCadSede: TPanel;
    pnpConSede: TPanel;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Colaborador1Click(Sender: TObject);
    procedure Setor1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Emprstimo1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure ListaSetor1Click(Sender: TObject);
    procedure ListaCoalborador1Click(Sender: TObject);
    procedure ListaProdutos1Click(Sender: TObject);
    procedure ListaGrupos1Click(Sender: TObject);
    procedure Entrada2Click(Sender: TObject);
    procedure Entrada3Click(Sender: TObject);
    procedure Emprstimo2Click(Sender: TObject);
    procedure Devoluo1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure ListaUsurios1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure pnpConSedeMouseEnter(Sender: TObject);
    procedure pnpConSedeMouseLeave(Sender: TObject);
    procedure pnpCadClick(Sender: TObject);
    procedure pnpMovClick(Sender: TObject);
    procedure pnpConsClick(Sender: TObject);
    procedure pnpSairClick(Sender: TObject);
    procedure pnpCadVoltarClick(Sender: TObject);
    procedure pnpMovVoltarClick(Sender: TObject);
    procedure pnpConVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnpCadProdClick(Sender: TObject);
    procedure pnpMovEntClick(Sender: TObject);
    procedure pnpCadColabClick(Sender: TObject);
    procedure pnpCadSetClick(Sender: TObject);
    procedure pnpCadGruClick(Sender: TObject);
    procedure pnpCadUserClick(Sender: TObject);
    procedure pnpMovSaiClick(Sender: TObject);
    procedure pnpMovEmpClick(Sender: TObject);
    procedure pnpMovDevClick(Sender: TObject);
    procedure pnpConSetClick(Sender: TObject);
    procedure pnpConColabClick(Sender: TObject);
    procedure pnpConProdClick(Sender: TObject);
    procedure pnpConGruClick(Sender: TObject);
    procedure pnpConUserClick(Sender: TObject);
    procedure pnpConEntClick(Sender: TObject);
    procedure pnpConSaiClick(Sender: TObject);
    procedure pnpConEmpClick(Sender: TObject);

    procedure AbrirFormulario(ClasseForm: TFormClass);
    procedure pnpCadSedeClick(Sender: TObject);
    procedure pnpConSedeClick(Sender: TObject);

  private
     procedure selecionaMenu(nMENU: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

uses Cad_Produto, Cad_Colaborador, Cad_Setor, Entrada_Prod, Saida_Prod,
  Tela_Emprestimo, Cad_Grupo, Lista_Colaborador, Lista_Emprestimo,
  Lista_Entrada, Lista_Grupos, Lista_Produtos, Lista_Saida, Lista_Setor,
  Tela_Devolucao, Cad_usuario, Lista_Usuario, Tela_Login, Lista_Sede, Cad_Sede,
  Data_Module;

procedure TTelaPrincipal.Button1Click(Sender: TObject);
begin
    CadProduto.Show;
end;

procedure TTelaPrincipal.Button2Click(Sender: TObject);
begin
   CadColaborador.Show;
end;

procedure TTelaPrincipal.Button3Click(Sender: TObject);
begin
    CadSetor.Show;
end;

procedure TTelaPrincipal.Button4Click(Sender: TObject);
begin
    EntradaProd.Show;
end;

procedure TTelaPrincipal.Button5Click(Sender: TObject);
begin
    SaidaProd.ShowModal;
end;

procedure TTelaPrincipal.Button6Click(Sender: TObject);
begin
    TelaEmprestimo.Show;
end;

procedure TTelaPrincipal.Colaborador1Click(Sender: TObject);
begin
    CadColaborador.Show;
end;

procedure TTelaPrincipal.Devoluo1Click(Sender: TObject);
begin
    teladevolucao.Show;
end;

procedure TTelaPrincipal.Emprstimo1Click(Sender: TObject);
begin
    TelaEmprestimo.Show;
end;

procedure TTelaPrincipal.Emprstimo2Click(Sender: TObject);
begin
    ListaEmprestimo.Show;
end;

procedure TTelaPrincipal.Entrada1Click(Sender: TObject);
begin
    EntradaProd.Show;
end;

procedure TTelaPrincipal.Entrada2Click(Sender: TObject);
begin
    ListaEntrada.Show;
end;

procedure TTelaPrincipal.Entrada3Click(Sender: TObject);
begin
    ListaSaida.Show;
end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
begin
  selecionaMenu(0);
end;

procedure TTelaPrincipal.Grupo1Click(Sender: TObject);
begin
    CadGrupo.Show;
end;

procedure TTelaPrincipal.ListaCoalborador1Click(Sender: TObject);
begin
    ListaColaborador.Show;
end;

procedure TTelaPrincipal.ListaGrupos1Click(Sender: TObject);
begin
    ListaGrupos.Show;
end;

procedure TTelaPrincipal.ListaProdutos1Click(Sender: TObject);
begin
    ListaProdutos.Show;
end;

procedure TTelaPrincipal.ListaSetor1Click(Sender: TObject);
begin
    ListaSetor.Show;
end;

procedure TTelaPrincipal.ListaUsurios1Click(Sender: TObject);
begin
    ListaUsuario.Show;
end;

procedure TTelaPrincipal.Login1Click(Sender: TObject);
begin
    TelaLogin.Show;
end;

procedure TTelaPrincipal.pnpCadSedeClick(Sender: TObject);
begin
  AbrirFormulario(TCadSede); // abre a tela de cadastro de sede
end;

procedure TTelaPrincipal.pnpConSedeClick(Sender: TObject);
begin
  dm.FDTabSede.Open;
  AbrirFormulario(TListaSede);  // abre a tela de consulta de sede
end;

procedure TTelaPrincipal.pnpConSedeMouseEnter(Sender: TObject);
begin
    if not (sender is TPanel) then
        exit;
    (sender as TPanel).Color:=RGB(192,192,192);
end;

procedure TTelaPrincipal.pnpConSedeMouseLeave(Sender: TObject);
begin
    if not (sender is TPanel) then
        exit;
    (sender as TPanel).Color:=RGB(255,255,255);
end;

procedure TTelaPrincipal.pnpCadClick(Sender: TObject);
begin
  selecionaMenu(1);
end;

procedure TTelaPrincipal.pnpCadColabClick(Sender: TObject);
begin
  AbrirFormulario(TCadColaborador); // abre a tela de cadastro de colaborador
end;

procedure TTelaPrincipal.pnpCadGruClick(Sender: TObject);
begin
  AbrirFormulario(TCadGrupo); // abre a tela de cadastro de grupo
end;

procedure TTelaPrincipal.pnpCadProdClick(Sender: TObject);
begin
  AbrirFormulario(TCadProduto); // abre a tela de cadastro de produto
end;

procedure TTelaPrincipal.pnpCadSetClick(Sender: TObject);
begin
  AbrirFormulario(TCadSetor); // abre a tela de cadastro de setor
end;

procedure TTelaPrincipal.pnpCadUserClick(Sender: TObject);
begin
  AbrirFormulario(TCadUsuario); // abre a tela de cadastro de Sede
end;

procedure TTelaPrincipal.pnpCadVoltarClick(Sender: TObject);
begin
  selecionaMenu(0);
end;

procedure TTelaPrincipal.pnpConVoltarClick(Sender: TObject);
begin
  selecionaMenu(0);
end;

procedure TTelaPrincipal.pnpMovClick(Sender: TObject);
begin
  selecionaMenu(2);
end;

procedure TTelaPrincipal.pnpMovDevClick(Sender: TObject);
begin
  AbrirFormulario(TTelaDevolucao); // abre a tela de devolução
end;

procedure TTelaPrincipal.pnpMovEmpClick(Sender: TObject);
begin
  AbrirFormulario(TTelaEmprestimo); // abre a tela de emprestimo
end;

procedure TTelaPrincipal.pnpMovEntClick(Sender: TObject);
begin
  AbrirFormulario(TEntradaProd); // abre a tela de entrada de produto
end;

procedure TTelaPrincipal.pnpMovSaiClick(Sender: TObject);
begin
  AbrirFormulario(TSaidaProd); // abre a tela de saida de produto
end;

procedure TTelaPrincipal.pnpMovVoltarClick(Sender: TObject);
begin
  selecionaMenu(0);
end;

procedure TTelaPrincipal.pnpConColabClick(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  dm.FDTabSede.Open;
  dm.FDTabColaborador.Open;
  AbrirFormulario(TListaColaborador); // abre a tela de consulta colaborador
end;

procedure TTelaPrincipal.pnpConEmpClick(Sender: TObject);
begin
  AbrirFormulario(TListaEmprestimo); // abre a tela de consulta emprestimo
end;

procedure TTelaPrincipal.pnpConEntClick(Sender: TObject);
begin
  AbrirFormulario(TListaEntrada); // abre a tela de consulta entrada de produto
end;

procedure TTelaPrincipal.pnpConGruClick(Sender: TObject);
begin
  dm.FDTabGrupo.Open;
  AbrirFormulario(TListaGrupos); // abre a tela de consulta grupo
end;

procedure TTelaPrincipal.pnpConProdClick(Sender: TObject);
begin
  dm.FDTabGrupo.Open;
  dm.FDTabProduto.Open;
  AbrirFormulario(TListaProdutos);  // abre a tela de consulta produto
end;

procedure TTelaPrincipal.pnpConSaiClick(Sender: TObject);
begin
  AbrirFormulario(TListaSaida); // abre a tela de consulta saida de produto
end;

procedure TTelaPrincipal.pnpConsClick(Sender: TObject);
begin
  selecionaMenu(3);
end;

procedure TTelaPrincipal.pnpConSetClick(Sender: TObject);
begin
  dm.FDTabSetor.Open;
  AbrirFormulario(TListaSetor); // abre a tela de consulta setor
end;

procedure TTelaPrincipal.pnpConUserClick(Sender: TObject);
begin
  dm.FDTabUsuario.Open;
  AbrirFormulario(TListaUsuario); // abre a tela de consulta usuario
end;

procedure TTelaPrincipal.pnpSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTelaPrincipal.Produto1Click(Sender: TObject);
begin
    CadProduto.Show;
end;

procedure TTelaPrincipal.Sada1Click(Sender: TObject);
begin
    SaidaProd.Show;
end;

procedure TTelaPrincipal.Setor1Click(Sender: TObject);
begin
    CadSetor.Show;
end;

procedure TTelaPrincipal.Usuario1Click(Sender: TObject);
begin
  CadUsuario.Show;
end;

procedure TTelaPrincipal.selecionaMenu(nMENU: Integer);
begin
  if nMENU = 0 then // mostra menu principal
    begin
      pnpPrincipal.Visible := True;
      pnpCadastro.Visible := False;
      pnpMovimentacao.Visible := False;
      pnpConulta.Visible := False;
    end
  else if nMENU = 1 then // mostra menu cadastro
    begin
      pnpPrincipal.Visible := False;
      pnpCadastro.Visible := True;
      pnpMovimentacao.Visible := False;
      pnpConulta.Visible := False;
    end
  else if nMENU = 2 then // mostra menu movimentação
    begin
      pnpPrincipal.Visible := False;
      pnpCadastro.Visible := False;
      pnpMovimentacao.Visible := True;
      pnpConulta.Visible := False;
    end
  else if nMENU = 3 then // mostra menu consulta
    begin
      pnpPrincipal.Visible := False;
      pnpCadastro.Visible := False;
      pnpMovimentacao.Visible := False;
      pnpConulta.Visible := True;
    end
  else
    begin
      pnpPrincipal.Visible := True;
      pnpCadastro.Visible := False;
      pnpMovimentacao.Visible := False;
      pnpConulta.Visible := False;
    end;

end;

procedure TTelaPrincipal.AbrirFormulario(ClasseForm: TFormClass); // abre o form centralizado no espaço vazio da tela principal
var
  i: Integer;
begin
  // Remove formulários anteriores
  for i := pnlConteudo.ControlCount - 1 downto 0 do
    pnlConteudo.Controls[i].Free;

  // Cria e posiciona o novo formulário
  with ClasseForm.Create(Self) do
  begin
    BorderStyle := bsNone;
    Align := alClient;
    Parent := pnlConteudo;
    Visible := True;
  end;
end;


end.
