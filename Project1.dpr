program Project1;

uses
  Vcl.Forms,
  Tela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Cad_Produto in 'Cad_Produto.pas' {CadProduto},
  Cad_Colaborador in 'Cad_Colaborador.pas' {CadColaborador},
  Cad_Setor in 'Cad_Setor.pas' {CadSetor},
  Entrada_Prod in 'Entrada_Prod.pas' {EntradaProd},
  Saida_Prod in 'Saida_Prod.pas' {SaidaProd},
  Tela_Emprestimo in 'Tela_Emprestimo.pas' {TelaEmprestimo},
  Tela_Devolucao in 'Tela_Devolucao.pas' {TelaDevolucao},
  Cad_Grupo in 'Cad_Grupo.pas' {CadGrupo},
  Lista_Grupos in 'Lista_Grupos.pas' {ListaGrupos},
  Lista_Produtos in 'Lista_Produtos.pas' {ListaProdutos},
  Lista_Setor in 'Lista_Setor.pas' {ListaSetor},
  Lista_Colaborador in 'Lista_Colaborador.pas' {ListaColaborador},
  Lista_Entrada in 'Lista_Entrada.pas' {ListaEntrada},
  Lista_Saida in 'Lista_Saida.pas' {ListaSaida},
  Lista_Emprestimo in 'Lista_Emprestimo.pas' {ListaEmprestimo},
  Cad_usuario in 'Cad_usuario.pas' {CadUsuario},
  Lista_Usuario in 'Lista_Usuario.pas' {ListaUsuario},
  Tela_Login in 'Tela_Login.pas' {TelaLogin},
  Data_Module in 'Data_Module.pas' {DM: TDataModule},
  Cad_Sede in 'Cad_Sede.pas' {CadSede},
  Lista_Sede in 'Lista_Sede.pas' {ListaSede},
  Relatorio_Entrada in 'Relatorio_Entrada.pas' {RelatorioEntrada};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TCadProduto, CadProduto);
  Application.CreateForm(TCadColaborador, CadColaborador);
  Application.CreateForm(TCadSetor, CadSetor);
  Application.CreateForm(TEntradaProd, EntradaProd);
  Application.CreateForm(TSaidaProd, SaidaProd);
  Application.CreateForm(TTelaEmprestimo, TelaEmprestimo);
  Application.CreateForm(TTelaDevolucao, TelaDevolucao);
  Application.CreateForm(TCadGrupo, CadGrupo);
  Application.CreateForm(TListaGrupos, ListaGrupos);
  Application.CreateForm(TListaProdutos, ListaProdutos);
  Application.CreateForm(TListaSetor, ListaSetor);
  Application.CreateForm(TListaColaborador, ListaColaborador);
  Application.CreateForm(TListaEntrada, ListaEntrada);
  Application.CreateForm(TListaSaida, ListaSaida);
  Application.CreateForm(TListaEmprestimo, ListaEmprestimo);
  Application.CreateForm(TCadUsuario, CadUsuario);
  Application.CreateForm(TListaUsuario, ListaUsuario);
  Application.CreateForm(TTelaLogin, TelaLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TCadSede, CadSede);
  Application.CreateForm(TCadSede, CadSede);
  Application.CreateForm(TListaSede, ListaSede);
  Application.CreateForm(TRelatorioEntrada, RelatorioEntrada);
  Application.Run;
end.
