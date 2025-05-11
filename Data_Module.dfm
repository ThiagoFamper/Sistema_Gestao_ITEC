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
    Left = 40
    Top = 420
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
    Left = 144
    Top = 420
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
    Left = 40
    Top = 508
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
    Left = 512
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
  end
  object dsFDTabEmprestimoItem: TDataSource
    DataSet = FDTabEmprestimoItem
    Left = 512
    Top = 508
  end
  object dsFDTabSede: TDataSource
    DataSet = FDTabSede
    Left = 808
    Top = 500
  end
  object FDTabSede: TFDTable
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
  object frxRelatEnt: TfrxReport
    Version = '2025.2.1'
    DataSet = frxDSEnt
    DataSetName = 'frxDSEnt'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45788.502721169000000000
    ReportOptions.LastChange = 45788.502721169000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure DateEdit3OnClick(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 733
    Top = 48
    Datasets = <
      item
        DataSet = frxRelatEnt.FDQuery1
        DataSetName = 'FDQuery1'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDDatabase1: TfrxFDDatabase
        Left = 144.000000000000000000
        Top = 176.000000000000000000
        DriverName = 'PG'
        DatabaseName = 'estoqueitec'
        Params.Strings = (
          'Database=estoqueitec'
          'User_Name=postgres'
          'Password=postgres'
          'Server=127.0.0.1'
          'DriverID=PG')
        LoginPrompt = False
        Connected = True
        pLeft = 144
        pTop = 176
      end
      object FDQuery1: TfrxFDQuery
        UserName = 'FDQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 208.000000000000000000
        Top = 176.000000000000000000
        IgnoreDupParams = False
        Params = <
          item
            Name = 'data_inicial'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'data_final'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
        SQL.Strings = (
          'SELECT '
          '    ep.id,'
          '    ep.produto_id,'
          '    p.cod_produto,'
          '    p.descricao,'
          '    ep.operador,'
          '    ep.quantidade,'
          '    TO_CHAR(ep.data_entrada, '#39'DD/MM/YYYY'#39') AS data_entrada,'
          '    ep.nota_fiscal,'
          '    ep.valor_unitario,'
          '    ep.valor_total'
          'FROM '
          '    estoqueitec.entrada_produto ep'
          'JOIN '
          '    estoqueitec.produto p ON p.id = ep.produto_id'
          'WHERE '
          '    ep.data_entrada BETWEEN :data_inicial AND :data_final'
          'ORDER BY '
          '    ep.data_entrada;')
        MacroCreate = True
        MacroExpand = True
        ReadOnly = False
        Database = frxRelatEnt.FDDatabase1
        Macros = <>
        pLeft = 208
        pTop = 176
        FieldDefs = <
          item
            FieldName = 'id'
          end
          item
            FieldName = 'produto_id'
          end
          item
            FieldName = 'cod_produto'
            FieldType = fftString
            Size = 45
          end
          item
            FieldName = 'descricao'
            FieldType = fftString
            Size = 75
          end
          item
            FieldName = 'operador'
            FieldType = fftString
            Size = 75
          end
          item
            FieldName = 'quantidade'
          end
          item
            FieldName = 'data_entrada'
          end
          item
            FieldName = 'nota_fiscal'
            FieldType = fftString
            Size = 20
          end
          item
            FieldName = 'valor_unitario'
            Size = 64
          end
          item
            FieldName = 'valor_total'
            Size = 64
          end>
        Parameters = <
          item
            Name = 'data_inicial'
            DataType = ftDate
            Expression = 'DateEdit1.Date'
          end
          item
            Name = 'data_final'
            DataType = ftDate
            Expression = 'DateEdit2.Date'
          end>
        Macross = <>
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360810000000000
        Top = 60.000000000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 124.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxRelatEnt.FDQuery1
        DataSetName = 'FDQuery1'
        RowCount = 0
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Color = 13421772
      DoubleBuffered = False
      Height = 500.000000000000000000
      ClientHeight = 462.400000000000000000
      Left = 265.000000000000000000
      Top = 150.000000000000000000
      Width = 684.000000000000000000
      Scaled = True
      ClientWidth = 669.600000000000000000
    end
  end
  object frxDSEnt: TfrxDBDataset
    UserName = 'frxDSEnt'
    CloseDataSource = False
    DataSet = FDTabEntrada
    BCDToCurrency = False
    DataSetOptions = []
    Left = 821
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '    ep.id,'
      '    ep.produto_id,'
      '    p.cod_produto,'
      '    p.descricao,'
      '    ep.operador,'
      '    ep.quantidade,'
      '    TO_CHAR(ep.data_entrada, '#39'DD/MM/YYYY'#39') AS data_entrada,'
      '    ep.nota_fiscal,'
      '    ep.valor_unitario,'
      '    ep.valor_total'
      'FROM '
      '    estoqueitec.entrada_produto ep'
      'JOIN '
      '    estoqueitec.produto p ON p.id = ep.produto_id'
      'WHERE '
      '    ep.data_entrada BETWEEN :data_inicial AND :data_final'
      'ORDER BY '
      '    ep.data_entrada;')
    Left = 824
    Top = 144
    ParamData = <
      item
        Name = 'DATA_INICIAL'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end>
  end
end
