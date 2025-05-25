object RelatorioEntrada: TRelatorioEntrada
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Entrada'
  ClientHeight = 355
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Relat'#243'rio Entrada de Produto'
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
    ExplicitLeft = -1
    DesignSize = (
      340
      290)
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 340
      Height = 41
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 8
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
      ExplicitLeft = 0
      ExplicitTop = 47
      ExplicitWidth = 340
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 334
        Height = 15
        Align = alTop
        Caption = 'Data Inicial'
        ExplicitWidth = 58
      end
      object DateTimeInicial: TDateTimePicker
        Left = 83
        Top = 0
        Width = 241
        Height = 23
        Date = 45789.000000000000000000
        Time = 0.944744328706292400
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
      ExplicitTop = 105
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
      ExplicitLeft = 0
      ExplicitTop = 124
      ExplicitWidth = 340
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 334
        Height = 15
        Align = alTop
        Caption = 'Data Final'
        ExplicitWidth = 52
      end
      object DateTimeFinal: TDateTimePicker
        Left = 83
        Top = 0
        Width = 241
        Height = 23
        Date = 45789.000000000000000000
        Time = 0.944744328706292400
        TabOrder = 0
      end
    end
    object BitBtn1: TBitBtn
      Left = 110
      Top = 200
      Width = 89
      Height = 25
      Anchors = []
      Caption = 'Gerar Relat'#243'rio'
      Layout = blGlyphTop
      TabOrder = 4
      OnClick = BitBtn1Click
    end
  end
  object frxDSEnt: TfrxDBDataset
    UserName = 'frxDSEnt'
    CloseDataSource = False
    DataSet = FDQueryRelatEnt
    BCDToCurrency = False
    DataSetOptions = []
    Left = 188
    Top = 304
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
      end>
  end
  object FDQueryRelatEnt: TFDQuery
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '  p.cod_produto,'
      '  p.descricao,'
      '  ep.operador,'
      '  ep.quantidade,'
      '  TO_CHAR(ep.data_entrada, '#39'DD/MM/YYYY'#39') AS data_entrada,'
      '  ep.nota_fiscal,'
      '  ep.valor_unitario'
      'FROM '
      '  estoqueitec.entrada_produto ep'
      'JOIN '
      '  estoqueitec.produto p ON p.id = ep.produto_id'
      'WHERE '
      '  ep.data_entrada BETWEEN :data_inicial AND :data_final'
      'ORDER BY '
      '  ep.data_entrada;'
      '')
    Left = 113
    Top = 304
    ParamData = <
      item
        Name = 'DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxRelatEnt: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45802.618062812500000000
    ReportOptions.LastChange = 45802.671225138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 304
    Datasets = <
      item
        DataSet = frxDSEnt
        DataSetName = 'frxDSEnt'
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
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
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
        Frame.Typ = [ftBottom]
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
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO ENTRADA DE PRODUTO')
          ParentFont = False
          Style = 'Title'
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
        Height = 196.535560000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        DataSet = frxDSEnt
        DataSetName = 'frxDSEnt'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Width = 335.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."cod_produto"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Top = 18.897650000000000000
          Width = 556.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."descricao"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'OPERADOR')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Top = 37.795300000000000000
          Width = 556.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."operador"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Top = 56.692950000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."quantidade"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 107.118120000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'DATA ENTRADA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Top = 75.590600000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_entrada'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."data_entrada"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'NOTA FISCAL')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 152.472480000000000000
          Top = 94.488250000000000000
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nota_fiscal'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."nota_fiscal"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 118.456710000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = ANSI_CHARSET
          Highlight.Font.Color = clMaroon
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Segoe UI'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            'VALOR UNIT'#193'RIO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 152.015770000000000000
          Top = 113.385900000000000000
          Width = 475.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_unitario'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."valor_unitario"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 158.740260000000000000
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
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
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo18: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
