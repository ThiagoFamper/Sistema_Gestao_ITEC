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
    Panel21: TPanel;
    pnpMovimentacao: TPanel;
    Panel29: TPanel;
    pnpConulta: TPanel;
    Panel36: TPanel;
    pnpPrincipal: TPanel;
    Panel3: TPanel;
    pnlConteudo: TPanel;
    fpPrincipal: TFlowPanel;
    pnpSair: TPanel;
    Image10: TImage;
    pnpCons: TPanel;
    Image8: TImage;
    pnpMov: TPanel;
    Image7: TImage;
    pnpCad: TPanel;
    Image6: TImage;
    fpMovimentacao: TFlowPanel;
    pnpMovVoltar: TPanel;
    Image21: TImage;
    pnpMovDev: TPanel;
    Image20: TImage;
    pnpMovEmp: TPanel;
    Image19: TImage;
    pnpMovSai: TPanel;
    Image18: TImage;
    pnpMovEnt: TPanel;
    Image17: TImage;
    fpConsulta: TFlowPanel;
    pnpConVoltar: TPanel;
    Image26: TImage;
    pnpConUser: TPanel;
    Image27: TImage;
    pnpConGru: TPanel;
    Image25: TImage;
    pnpConSede: TPanel;
    Image1: TImage;
    pnpConSet: TPanel;
    Image24: TImage;
    pnpConColab: TPanel;
    Image23: TImage;
    pnpConProd: TPanel;
    Image22: TImage;
    fpCadastro: TFlowPanel;
    pnpCadVoltar: TPanel;
    Image15: TImage;
    pnpCadUser: TPanel;
    Image16: TImage;
    pnpCadGru: TPanel;
    Image14: TImage;
    pnpCadSede: TPanel;
    Image2: TImage;
    pnpCadSet: TPanel;
    Image13: TImage;
    pnpCadColab: TPanel;
    Image12: TImage;
    pnpCadProd: TPanel;
    Image11: TImage;
    SBlogout: TSpeedButton;
    lUsuarioNome: TLabel;
    pnpConEstoque: TPanel;
    Image3: TImage;
    procedure pnpMouseEnter(Sender: TObject);
    procedure pnpMouseLeave(Sender: TObject);
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
    procedure pnpCadSedeClick(Sender: TObject);
    procedure pnpConSedeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SBlogoutClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure pnpConEstoqueClick(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Image21Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    usuarioLogado: string;
    isAdmin: Boolean;
    procedure AbrirFormulario(ClasseForm: TFormClass);
    procedure selecionaMenu(nMENU: integer);
    procedure desabilitaMenu;
    procedure habilitaMenu;

  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

uses Cad_Produto, Cad_Colaborador, Cad_Setor, Entrada_Prod, Saida_Prod,
  Cad_Emprestimo, Cad_Grupo, Lista_Colaborador, Lista_Emprestimo,
  Lista_Entrada, Lista_Grupos, Lista_Produtos, Lista_Saida, Lista_Setor,
  Tela_Devolucao, Cad_usuario, Lista_Usuario, Tela_Login, Lista_Sede, Cad_Sede,
  Data_Module, Tela_Entrada, Tela_Saida, Tela_Emprestimo, Lista_Estoque;

procedure TTelaPrincipal.desabilitaMenu;
begin
  fpPrincipal.Enabled       := False;
  fpMovimentacao.Enabled    := False;
  fpCadastro.Enabled        := False;
  fpConsulta.Enabled        := False;
end;

procedure TTelaPrincipal.habilitaMenu;
begin
  fpPrincipal.Enabled       := True;
  fpMovimentacao.Enabled    := True;
  fpCadastro.Enabled        := True;
  fpConsulta.Enabled        := True;
end;

procedure TTelaPrincipal.Image10Click(Sender: TObject);
begin
  Close();
end;

procedure TTelaPrincipal.Image11Click(Sender: TObject);
begin
  pnpCadProdClick(pnpCadProd);
end;

procedure TTelaPrincipal.Image12Click(Sender: TObject);
begin
  pnpCadColabClick(pnpCadColab);
end;

procedure TTelaPrincipal.Image13Click(Sender: TObject);
begin
  pnpCadSetClick(pnpCadSet);
end;

procedure TTelaPrincipal.Image14Click(Sender: TObject);
begin
  pnpCadGruClick(pnpCadGru);
end;

procedure TTelaPrincipal.Image15Click(Sender: TObject);
begin
  pnpCadVoltarClick(pnpCadVoltar);
end;

procedure TTelaPrincipal.Image16Click(Sender: TObject);
begin
  pnpCadUserClick(pnpCadUser);
end;

procedure TTelaPrincipal.Image17Click(Sender: TObject);
begin
  pnpMovEntClick(pnpMovEnt);
end;

procedure TTelaPrincipal.Image18Click(Sender: TObject);
begin
  pnpMovSaiClick(pnpMovSai);
end;

procedure TTelaPrincipal.Image19Click(Sender: TObject);
begin
  pnpMovEmpClick(pnpMovEmp);
end;

procedure TTelaPrincipal.Image1Click(Sender: TObject);
begin
  pnpConSedeClick(pnpConSede);
end;

procedure TTelaPrincipal.Image20Click(Sender: TObject);
begin
  pnpMovDevclick(pnpMovDev);
end;

procedure TTelaPrincipal.Image21Click(Sender: TObject);
begin
  pnpMovVoltarClick(pnpMovVoltar);
end;

procedure TTelaPrincipal.Image22Click(Sender: TObject);
begin
  pnpConProdClick(pnpConProd);
end;

procedure TTelaPrincipal.Image23Click(Sender: TObject);
begin
  pnpConColabClick(pnpConColab);
end;

procedure TTelaPrincipal.Image24Click(Sender: TObject);
begin
  pnpConSetClick(pnpConSet);
end;

procedure TTelaPrincipal.Image25Click(Sender: TObject);
begin
  pnpConGruClick(pnpConGru);
end;

procedure TTelaPrincipal.Image26Click(Sender: TObject);
begin
  pnpConVoltarClick(pnpConVoltar);
end;

procedure TTelaPrincipal.Image27Click(Sender: TObject);
begin
  pnpConUserClick(pnpConUser);
end;

procedure TTelaPrincipal.Image2Click(Sender: TObject);
begin
  pnpCadSedeClick(pnpCadSede);
end;

procedure TTelaPrincipal.Image3Click(Sender: TObject);
begin
  pnpConEstoqueClick(pnpConEstoque);
end;

procedure TTelaPrincipal.Image6Click(Sender: TObject);
begin
  pnpCadClick(pnpCad);
end;

procedure TTelaPrincipal.Image7Click(Sender: TObject);
begin
  pnpMovClick(pnpMov);
end;

procedure TTelaPrincipal.Image8Click(Sender: TObject);
begin
  pnpConsClick(pnpCons);
end;

procedure TTelaPrincipal.Panel2Resize(Sender: TObject);
begin
  // Coloca o botão na extrema direita do Panel
  SBlogout.Left := Panel2.Width - SBlogout.Width - 10; // 10 é uma margem opcional
  SBlogout.Top := (Panel2.Height - SBlogout.Height) div 2; // Centraliza verticalmente

  // Se quiser que a Label fique ao lado do botão, faça algo assim:
  lUsuarioNome.Left := SBlogout.Left - lUsuarioNome.Width - 5; // 5 é o espaço entre label e botão
  lUsuarioNome.Top := (Panel2.Height - lUsuarioNome.Height) div 2;
end;

procedure TTelaPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    selecionaMenu(2);
  end;

  if Key = VK_F2 then
  begin
    selecionaMenu(3);
  end;

  if Key = VK_F3 then
  begin
    selecionaMenu(1);
  end;

  if Key = VK_BACK then
  begin
    selecionaMenu(0);
  end;

  if Key = Ord('1') then
  begin
    AbrirFormulario(TTelaEmprestimo);
  end;

  if Key = Ord('2') then
  begin
    AbrirFormulario(TTelaDevolucao);
  end;
end;

procedure TTelaPrincipal.FormShow(Sender: TObject);
begin
  selecionaMenu(0);

  lUsuarioNome.Caption := usuarioLogado;

  if not isAdmin then
  begin
    pnpCad.Enabled    := False;
    pnpCad.Visible    := False;
    pnpMovEnt.Enabled := False;
    pnpMovEnt.Visible := False;
  end;

end;

procedure TTelaPrincipal.pnpCadSedeClick(Sender: TObject);
begin
  AbrirFormulario(TCadSede); // abre a tela de cadastro de sede
end;

procedure TTelaPrincipal.pnpConSedeClick(Sender: TObject);
begin
  AbrirFormulario(TListaSede);  // abre a tela de consulta de sede
end;

procedure TTelaPrincipal.pnpMouseEnter(Sender: TObject);
begin
    if not (sender is TPanel) then
        exit;
    (sender as TPanel).Color:=RGB(192,192,192);
end;

procedure TTelaPrincipal.pnpMouseLeave(Sender: TObject);
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
  AbrirFormulario(TTelaEntrada); // abre a tela de entrada de produto
end;

procedure TTelaPrincipal.pnpMovSaiClick(Sender: TObject);
begin
  AbrirFormulario(TTelaSaida); // abre a tela de saida de produto
end;

procedure TTelaPrincipal.pnpMovVoltarClick(Sender: TObject);
begin
  selecionaMenu(0);
end;

procedure TTelaPrincipal.pnpConColabClick(Sender: TObject);
begin
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

procedure TTelaPrincipal.pnpConEstoqueClick(Sender: TObject);
begin
  AbrirFormulario(TListaEstoque);  // abre a tela de consulta estoque
end;

procedure TTelaPrincipal.pnpConGruClick(Sender: TObject);
begin
  AbrirFormulario(TListaGrupos); // abre a tela de consulta grupo
end;

procedure TTelaPrincipal.pnpConProdClick(Sender: TObject);
begin
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
  AbrirFormulario(TListaSetor); // abre a tela de consulta setor
end;

procedure TTelaPrincipal.pnpConUserClick(Sender: TObject);
begin
  AbrirFormulario(TListaUsuario); // abre a tela de consulta usuario
end;

procedure TTelaPrincipal.pnpSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTelaPrincipal.SBlogoutClick(Sender: TObject);
begin
  Application.CreateForm(TTelaLogin, TelaLogin);

  Self.Hide;
  TelaLogin.Show;
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
