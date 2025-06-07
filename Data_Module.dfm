object DM: TDM
  Height = 646
  Width = 994
  PixelsPerInch = 120
  object FDEstoqueItec: TFDConnection
    Params.Strings = (
      'Database=estoqueitec'
      'User_Name=postgres'
      'Password=postgres'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 50
    Top = 30
  end
  object FDTransaction1: TFDTransaction
    Connection = FDEstoqueItec
    Left = 170
    Top = 30
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 310
    Top = 30
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 460
    Top = 30
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
    Left = 40
    Top = 140
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
    Left = 160
    Top = 140
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
    Left = 40
    Top = 230
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
    Left = 160
    Top = 230
  end
  object dsFDTabColaborador: TDataSource
    DataSet = FDTabColaborador
    Left = 208
    Top = 324
  end
  object FDTabColaborador: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'colaborador'
    Left = 56
    Top = 324
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
    Active = True
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'setor'
    Left = 40
    Top = 420
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
    Left = 144
    Top = 420
  end
  object FDTabUsuario: TFDTable
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'usuario'
    Left = 40
    Top = 508
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
    Left = 160
    Top = 508
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
    Left = 296
    Top = 140
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
    Left = 416
    Top = 140
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
    Left = 328
    Top = 228
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
    Left = 513
    Top = 228
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
    Left = 360
    Top = 324
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
    Left = 464
    Top = 324
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
    Left = 288
    Top = 420
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
    Left = 408
    Top = 420
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
    Left = 328
    Top = 508
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
    Left = 513
    Top = 508
  end
  object dsFDTabSede: TDataSource
    DataSet = FDTabSede
    Left = 808
    Top = 500
  end
  object FDTabSede: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDEstoqueItec
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    SchemaName = 'estoqueitec'
    TableName = 'sede'
    Left = 688
    Top = 500
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
