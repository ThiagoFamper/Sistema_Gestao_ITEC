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
    Active = True
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
    object FDTabProdutocod_produto: TWideStringField
      FieldName = 'cod_produto'
      Size = 45
    end
  end
  object dsFDTabProduto: TDataSource
    DataSet = FDTabProduto
    Left = 128
    Top = 112
  end
  object FDTabGrupo: TFDTable
    Active = True
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
    end
    object FDTabColaboradorcod_colaborador: TWideStringField
      FieldName = 'cod_colaborador'
      Size = 45
    end
    object FDTabColaboradordescricao: TWideStringField
      FieldName = 'descricao'
      Size = 75
    end
    object FDTabColaboradorcargo: TWideStringField
      FieldName = 'cargo'
      Size = 45
    end
    object FDTabColaboradorsetor_id: TLargeintField
      FieldName = 'setor_id'
    end
    object FDTabColaboradorsede_id: TLargeintField
      FieldName = 'sede_id'
    end
  end
  object FDTabSetor: TFDTable
    Active = True
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
    object FDTabSetorcod_setor: TWideStringField
      FieldName = 'cod_setor'
      Origin = 'cod_setor'
      Size = 45
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
    Active = True
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'usuario'
    Left = 32
    Top = 406
    object FDTabUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 80
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
  end
  object dsFDTabUsuario: TDataSource
    DataSet = FDTabUsuario
    Left = 128
    Top = 406
  end
  object FDTabEntrada: TFDTable
    Active = True
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
    end
    object FDTabEntradaproduto_id: TLargeintField
      FieldName = 'produto_id'
    end
    object FDTabEntradaoperador: TWideStringField
      FieldName = 'operador'
      Size = 75
    end
    object FDTabEntradaquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object FDTabEntradadata_entrada: TDateField
      FieldName = 'data_entrada'
    end
    object FDTabEntradanota_fiscal: TWideStringField
      FieldName = 'nota_fiscal'
    end
    object FDTabEntradavalor_total: TFMTBCDField
      FieldName = 'valor_total'
      Precision = 64
      Size = 64
    end
    object FDTabEntradavalor_unitario: TFMTBCDField
      FieldName = 'valor_unitario'
      Precision = 64
      Size = 64
    end
  end
  object dsFDTabEntrada: TDataSource
    DataSet = FDTabEntrada
    Left = 333
    Top = 112
  end
  object FDTabEmprestimoProd: TFDTable
    Active = True
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
    end
    object FDTabEmprestimoProdproduto_id: TLargeintField
      FieldName = 'produto_id'
    end
    object FDTabEmprestimoProddescricao: TWideStringField
      FieldName = 'descricao'
      Size = 75
    end
    object FDTabEmprestimoProdoperador: TWideStringField
      FieldName = 'operador'
      Size = 75
    end
    object FDTabEmprestimoProdquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object FDTabEmprestimoProddata_emprestimo: TDateField
      FieldName = 'data_emprestimo'
    end
    object FDTabEmprestimoProdcolaborador_id: TLargeintField
      FieldName = 'colaborador_id'
    end
    object FDTabEmprestimoProdsetor: TWideStringField
      FieldName = 'setor'
      Size = 45
    end
    object FDTabEmprestimoProdsaldo: TFMTBCDField
      FieldName = 'saldo'
      Precision = 64
      Size = 64
    end
    object FDTabEmprestimoProddevolvido: TWideStringField
      FieldName = 'devolvido'
      Size = 3
    end
  end
  object dsFDTabEmprestimoProd: TDataSource
    DataSet = FDTabEmprestimoProd
    Left = 410
    Top = 182
  end
  object FDTabSaida: TFDTable
    Active = True
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabSaidaproduto_id: TLargeintField
      FieldName = 'produto_id'
      Origin = 'produto_id'
    end
    object FDTabSaidaoperador: TWideStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 75
    end
    object FDTabSaidaquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object FDTabSaidadata_saida: TDateField
      FieldName = 'data_saida'
      Origin = 'data_saida'
    end
    object FDTabSaidacolaborador_id: TLargeintField
      FieldName = 'colaborador_id'
      Origin = 'colaborador_id'
    end
    object FDTabSaidasetor: TWideStringField
      FieldName = 'setor'
      Origin = 'setor'
      Size = 45
    end
  end
  object dsFDTabSaida: TDataSource
    DataSet = FDTabSaida
    Left = 371
    Top = 259
  end
  object FDTabEstoque: TFDTable
    Active = True
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
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTabEstoqueproduto_id: TLargeintField
      FieldName = 'produto_id'
      Origin = 'produto_id'
    end
    object FDTabEstoquesaldo: TIntegerField
      FieldName = 'saldo'
      Origin = 'saldo'
    end
  end
  object dsFDTabEstoque: TDataSource
    DataSet = FDTabEstoque
    Left = 326
    Top = 336
  end
  object FDTabEmprestimoItem: TFDTable
    Active = True
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
