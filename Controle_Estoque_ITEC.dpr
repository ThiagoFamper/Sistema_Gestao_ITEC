program Controle_Estoque_ITEC;

uses
  Vcl.Forms,
  Tela_Login in 'Tela_Login.pas' {TelaLogin},
  Tela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Cad_Produto in 'Cad_Produto.pas' {CadProduto},
  Cad_Colaborador in 'Cad_Colaborador.pas' {CadColaborador},
  Cad_Setor in 'Cad_Setor.pas' {CadSetor},
  Tela_Devolucao in 'Tela_Devolucao.pas' {TelaDevolucao},
  Cad_Grupo in 'Cad_Grupo.pas' {CadGrupo},
  Lista_Grupos in 'Lista_Grupos.pas' {ListaGrupos},
  Lista_Produtos in 'Lista_Produtos.pas' {ListaProdutos},
  Lista_Setor in 'Lista_Setor.pas' {ListaSetor},
  Lista_Colaborador in 'Lista_Colaborador.pas' {ListaColaborador},
  Cad_Usuario in 'Cad_Usuario.pas' {CadUsuario},
  Lista_Usuario in 'Lista_Usuario.pas' {ListaUsuario},
  Data_Module in 'Data_Module.pas' {DM: TDataModule},
  Cad_Sede in 'Cad_Sede.pas' {CadSede},
  Lista_Sede in 'Lista_Sede.pas' {ListaSede},
  Relatorio_Entrada in 'Relatorio_Entrada.pas' {RelatorioEntrada},
  Relatorio_Saida in 'Relatorio_Saida.pas' {RelatorioSaida},
  Relatorio_Emprestimo in 'Relatorio_Emprestimo.pas' {RelatorioEmprestimo},
  Relatorio_Devolucao in 'Relatorio_Devolucao.pas' {RelatorioDevolucao},
  Relatorio_Estoque in 'Relatorio_Estoque.pas' {RelatorioEstoque},
  Tela_Entrada in 'Tela_Entrada.pas' {TelaEntrada},
  Tela_Saida in 'Tela_Saida.pas' {TelaSaida},
  Tela_Emprestimo in 'Tela_Emprestimo.pas' {TelaEmprestimo},
  Lista_Estoque in 'Lista_Estoque.pas' {ListaEstoque},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaLogin, TelaLogin);
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TCadProduto, CadProduto);
  Application.CreateForm(TCadColaborador, CadColaborador);
  Application.CreateForm(TCadSetor, CadSetor);
  Application.CreateForm(TTelaDevolucao, TelaDevolucao);
  Application.CreateForm(TCadGrupo, CadGrupo);
  Application.CreateForm(TListaGrupos, ListaGrupos);
  Application.CreateForm(TListaProdutos, ListaProdutos);
  Application.CreateForm(TListaSetor, ListaSetor);
  Application.CreateForm(TListaColaborador, ListaColaborador);
  Application.CreateForm(TCadUsuario, CadUsuario);
  Application.CreateForm(TListaUsuario, ListaUsuario);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TCadSede, CadSede);
  Application.CreateForm(TCadSede, CadSede);
  Application.CreateForm(TListaSede, ListaSede);
  Application.CreateForm(TRelatorioEntrada, RelatorioEntrada);
  Application.CreateForm(TRelatorioSaida, RelatorioSaida);
  Application.CreateForm(TRelatorioEmprestimo, RelatorioEmprestimo);
  Application.CreateForm(TRelatorioDevolucao, RelatorioDevolucao);
  Application.CreateForm(TRelatorioEstoque, RelatorioEstoque);
  Application.CreateForm(TTelaEntrada, TelaEntrada);
  Application.CreateForm(TTelaSaida, TelaSaida);
  Application.CreateForm(TTelaEmprestimo, TelaEmprestimo);
  Application.CreateForm(TListaEstoque, ListaEstoque);
  Application.Run;
end.
