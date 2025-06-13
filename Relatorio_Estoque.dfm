object RelatorioEstoque: TRelatorioEstoque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Estoque'
  ClientHeight = 355
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Relat'#243'rio de Estoque'
    Color = clCadetblue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 340
    Height = 290
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 340
      Height = 41
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 44
      Width = 334
      Height = 41
      Align = alTop
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 38
        Top = 3
        Width = 39
        Height = 15
        AutoSize = False
        Caption = 'Marca:'
      end
      object DBLookupComboMarca: TDBLookupComboBox
        Left = 88
        Top = 3
        Width = 241
        Height = 23
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 88
      Width = 340
      Height = 41
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        Left = 41
        Top = 3
        Width = 44
        Height = 15
        Caption = 'Modelo:'
      end
      object DBLookupComboModelo: TDBLookupComboBox
        Left = 91
        Top = 3
        Width = 241
        Height = 23
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 132
      Width = 334
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label2: TLabel
        Left = 38
        Top = 3
        Width = 41
        Height = 15
        AutoSize = False
        Caption = 'Grupo:'
      end
      object DBLookupComboGrupo: TDBLookupComboBox
        Left = 88
        Top = 3
        Width = 241
        Height = 23
        TabOrder = 0
      end
    end
    object GridPanel1: TGridPanel
      AlignWithMargins = True
      Left = 3
      Top = 179
      Width = 334
      Height = 108
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 1
          Control = bRelat
          Row = 0
        end
        item
          Column = 2
          Control = bCancelar
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 4
      DesignSize = (
        334
        108)
      object bRelat: TBitBtn
        Left = 85
        Top = 41
        Width = 80
        Height = 25
        Cursor = crHandPoint
        Anchors = []
        Caption = '&Relat'#243'rio'
        Layout = blGlyphTop
        TabOrder = 0
      end
      object bCancelar: TBitBtn
        Left = 169
        Top = 41
        Width = 80
        Height = 25
        Anchors = []
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = bCancelarClick
      end
    end
  end
  object frxDSRelatEstoque: TfrxDBDataset
    UserName = 'frxDSRelatEstoque'
    CloseDataSource = False
    DataSet = FDQueryRelatEstoque
    BCDToCurrency = False
    DataSetOptions = []
    Left = 72
    Top = 65528
    FieldDefs = <
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
        FieldName = 'grupo_descricao'
        FieldType = fftString
        Size = 45
      end
      item
        FieldName = 'marca'
        FieldType = fftString
        Size = 45
      end
      item
        FieldName = 'modelo'
        FieldType = fftString
        Size = 75
      end
      item
        FieldName = 'saldo'
      end
      item
        FieldName = 'data'
      end>
  end
  object FDQueryRelatEstoque: TFDQuery
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '  p.cod_produto,'
      '  p.descricao,'
      '  g.descricao AS grupo_descricao,'
      '  p.marca,'
      '  p.modelo,'
      '  es.saldo,'
      '  ep.data_entrada AS data'
      'FROM '
      '  estoqueitec.produto p'
      'JOIN '
      '  estoqueitec.grupo g ON g.id = p.grupo_id'
      'JOIN '
      '  estoqueitec.estoque es ON es.produto_id = p.id'
      'JOIN '
      '  estoqueitec.entrada_produto ep ON ep.produto_id = p.id'
      'WHERE '
      '  ep.data_entrada BETWEEN :data_inicial AND :data_final'
      'ORDER BY '
      '  ep.data_entrada DESC')
    Left = 160
    Top = 8
    ParamData = <
      item
        Name = 'DATA_INICIAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxRelatEstoque: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45820.586085312500000000
    ReportOptions.LastChange = 45820.586085312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 7
    Datasets = <
      item
        DataSet = frxDSRelatEstoque
        DataSetName = 'frxDSRelatEstoque'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clBlack
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clBlack
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 52479
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 3.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 771.024120000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 771.024108886718800000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Estoque de Produto')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 68.031540000000000000
        Width = 771.024120000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = -56.692950000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 107.235217940000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'COD. PRODUTO'
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 107.235217940000000000
          Width = 290.091379970000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'DESCRI'#199#195'O PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 397.326597910000000000
          Width = 52.973728560000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'GRUPO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 450.300326470000000000
          Width = 53.882850800000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'MARCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 504.183177270000000000
          Width = 147.374844060000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'MODELO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 651.558021330000000000
          Width = 69.679770810000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 721.237792140000000000
          Width = 49.785864080000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'SALDO')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692913390000000000
        Top = 151.181200000000000000
        Width = 771.024120000000000000
        DataSet = frxDSRelatEstoque
        DataSetName = 'frxDSRelatEstoque'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Width = 107.235217940000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."cod_produto"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 107.235217940000000000
          Width = 290.091379970000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 397.326597910000000000
          Width = 52.973728560000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'grupo_descricao'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."grupo_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 450.300326470000000000
          Width = 53.882850800000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'marca'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."marca"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 504.183177270000000000
          Width = 147.374844060000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'modelo'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."modelo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 651.558021330000000000
          Width = 69.679770810000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."data"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 721.237792140000000000
          Width = 49.785864080000000000
          Height = 56.692950000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'saldo'
          DataSet = frxDSRelatEstoque
          DataSetName = 'frxDSRelatEstoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDSRelatEstoque."saldo"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 771.024120000000000000
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 771.024108886718800000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo19: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 695.433508886718800000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#]')
        end
      end
    end
  end
  object FDQueryGrupo: TFDQuery
    Left = 147
    Top = 309
  end
  object FDQueryModelo: TFDQuery
    Left = 288
    Top = 289
  end
  object FDQueryMarca: TFDQuery
    Left = 32
    Top = 289
  end
end
