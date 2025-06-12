object DM: TDM
  Height = 517
  Width = 795
  object FDEstoqueItec: TFDConnection
    Params.Strings = (
      'Database=estoqueitec'
      'User_Name=postgres'
      'Password=postgres'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = FDEstoqueItec
    Left = 136
    Top = 24
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 248
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 24
  end
  object FDTabProduto: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'produto'
    Left = 32
    Top = 112
    object FDTabProdutoid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabProdutocod_produto: TWideStringField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Size = 45
    end
    object FDTabProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 75
    end
    object FDTabProdutomarca: TWideStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 45
    end
    object FDTabProdutomodelo: TWideStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 45
    end
    object FDTabProdutogrupo_id: TLargeintField
      FieldName = 'grupo_id'
      Origin = 'grupo_id'
    end
    object FDTabProdutodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object dsFDTabProduto: TDataSource
    DataSet = FDTabProduto
    Left = 128
    Top = 112
  end
  object FDTabGrupo: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'grupo'
    Left = 32
    Top = 184
    object FDTabGrupoid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabGrupodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 45
    end
  end
  object dsFDTabGrupo: TDataSource
    DataSet = FDTabGrupo
    Left = 128
    Top = 184
  end
  object dsFDTabColaborador: TDataSource
    DataSet = FDTabColaborador
    Left = 166
    Top = 259
  end
  object FDTabColaborador: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'colaborador'
    Left = 45
    Top = 259
    object FDTabColaboradorid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabColaboradordescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 75
    end
    object FDTabColaboradorcargo: TWideStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Size = 45
    end
    object FDTabColaboradorsetor_id: TLargeintField
      FieldName = 'setor_id'
      Origin = 'setor_id'
    end
    object FDTabColaboradorsede_id: TLargeintField
      FieldName = 'sede_id'
      Origin = 'sede_id'
    end
  end
  object FDTabSetor: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'setor'
    Left = 32
    Top = 336
    object FDTabSetorid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabSetordescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 75
    end
  end
  object dsFDTabSetor: TDataSource
    DataSet = FDTabSetor
    Left = 115
    Top = 336
  end
  object FDTabUsuario: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'usuario'
    Left = 32
    Top = 406
    object FDTabUsuarioid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabUsuariologin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 45
    end
    object FDTabUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
    object FDTabUsuarioadmin: TBooleanField
      FieldName = 'admin'
      Origin = '"admin"'
    end
    object FDTabUsuarionome: TLargeintField
      FieldName = 'nome'
      Origin = 'nome'
    end
  end
  object dsFDTabUsuario: TDataSource
    DataSet = FDTabUsuario
    Left = 128
    Top = 406
  end
  object FDTabEntrada: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'entrada_produto'
    Left = 237
    Top = 112
    object FDTabEntradaid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabEntradaproduto_id: TLargeintField
      FieldName = 'produto_id'
      Origin = 'produto_id'
    end
    object FDTabEntradaquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDTabEntradadata_entrada: TDateField
      FieldName = 'data_entrada'
      Origin = 'data_entrada'
    end
    object FDTabEntradanota_fiscal: TWideStringField
      FieldName = 'nota_fiscal'
      Origin = 'nota_fiscal'
    end
    object FDTabEntradavalor_unitario: TFMTBCDField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Precision = 64
      Size = 64
    end
    object FDTabEntradaoperador: TLargeintField
      FieldName = 'operador'
      Origin = 'operador'
    end
  end
  object dsFDTabEntrada: TDataSource
    DataSet = FDTabEntrada
    Left = 333
    Top = 112
  end
  object FDTabEmprestimoProd: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'emprestimo_produto'
    Left = 262
    Top = 182
    object FDTabEmprestimoProdid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabEmprestimoProdproduto_id: TLargeintField
      FieldName = 'produto_id'
      Origin = 'produto_id'
    end
    object FDTabEmprestimoProdquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDTabEmprestimoProddata_emprestimo: TDateField
      FieldName = 'data_emprestimo'
      Origin = 'data_emprestimo'
    end
    object FDTabEmprestimoProdsaldo: TIntegerField
      FieldName = 'saldo'
      Origin = 'saldo'
    end
    object FDTabEmprestimoProdoperador: TLargeintField
      FieldName = 'operador'
      Origin = 'operador'
    end
    object FDTabEmprestimoProddevolvido: TBooleanField
      FieldName = 'devolvido'
      Origin = 'devolvido'
    end
    object FDTabEmprestimoProdcolaborador_id: TLargeintField
      FieldName = 'colaborador_id'
      Origin = 'colaborador_id'
    end
  end
  object dsFDTabEmprestimoProd: TDataSource
    DataSet = FDTabEmprestimoProd
    Left = 410
    Top = 182
  end
  object FDTabSaida: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'saida_produto'
    Left = 288
    Top = 259
    object FDTabSaidaid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
    end
    object FDTabSaidaquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDTabSaidadata_saida: TDateField
      FieldName = 'data_saida'
      Origin = 'data_saida'
    end
    object FDTabSaidaoperador: TLargeintField
      FieldName = 'operador'
      Origin = 'operador'
    end
    object FDTabSaidadescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 75
    end
    object FDTabSaidaproduto_id: TLargeintField
      FieldName = 'produto_id'
      Origin = 'produto_id'
    end
  end
  object dsFDTabSaida: TDataSource
    DataSet = FDTabSaida
    Left = 371
    Top = 259
  end
  object FDTabEstoque: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'estoque'
    Left = 230
    Top = 336
    object FDTabEstoqueid: TLargeintField
      FieldName = 'id'
    end
    object FDTabEstoquesaldo: TIntegerField
      FieldName = 'saldo'
    end
    object FDTabEstoqueproduto_id: TLargeintField
      FieldName = 'produto_id'
    end
  end
  object dsFDTabEstoque: TDataSource
    DataSet = FDTabEstoque
    Left = 326
    Top = 336
  end
  object FDTabEmprestimoItem: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'item_emprestimo'
    Left = 262
    Top = 406
    object FDTabEmprestimoItemid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabEmprestimoItemdata_devolucao: TDateField
      FieldName = 'data_devolucao'
      Origin = 'data_devolucao'
    end
    object FDTabEmprestimoItemqtd_devolvida: TIntegerField
      FieldName = 'qtd_devolvida'
      Origin = 'qtd_devolvida'
    end
    object FDTabEmprestimoItememprestimo_id: TLargeintField
      FieldName = 'emprestimo_id'
      Origin = 'emprestimo_id'
    end
  end
  object dsFDTabEmprestimoItem: TDataSource
    DataSet = FDTabEmprestimoItem
    Left = 410
    Top = 406
  end
  object dsFDTabSede: TDataSource
    DataSet = FDTabSede
    Left = 646
    Top = 400
  end
  object FDTabSede: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'sede'
    Left = 550
    Top = 400
    object FDTabSedeid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabSededescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 45
    end
  end
end
