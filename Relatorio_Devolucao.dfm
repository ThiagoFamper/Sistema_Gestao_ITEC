object RelatorioDevolucao: TRelatorioDevolucao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Devolu'#231#227'o'
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
    Caption = 'Relat'#243'rio Devolu'#231#227'o de Produto'
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
    AutoSize = True
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 71
    DesignSize = (
      340
      290)
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 132
      Width = 334
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 135
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
    object Panel4: TPanel
      Left = 0
      Top = 88
      Width = 340
      Height = 41
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 105
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
      TabOrder = 2
      ExplicitLeft = 24
      ExplicitTop = 167
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
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 340
      Height = 41
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 8
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
  object frxRelatDev: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45802.600467835650000000
    ReportOptions.LastChange = 45802.676784039350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 36
    Top = 304
    Datasets = <
      item
        DataSet = frxDSRelatDev
        DataSetName = 'frxDSRelatDev'
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
            'RELAT'#211'RIO DEVOLU'#199#195'O DE PRODUTO')
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
        Height = 253.228510000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        DataSet = frxDSRelatDev
        DataSetName = 'frxDSRelatDev'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 94.000000000000000000
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
          Left = 188.488250000000000000
          Width = 335.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."cod_produto"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 94.000000000000000000
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
          Left = 188.488250000000000000
          Top = 18.897650000000000000
          Width = 555.968503940000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."descricao"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 38.574830000000000000
          Width = 94.000000000000000000
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
          Left = 188.488250000000000000
          Top = 37.795300000000000000
          Width = 556.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."operador"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 57.472480000000000000
          Width = 94.000000000000000000
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
          Left = 188.488250000000000000
          Top = 56.692950000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."quantidade"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 95.267780000000000000
          Width = 120.456710000000000000
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
            'COLABORADOR')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 94.488250000000000000
          Width = 556.000000000000000000
          Height = 18.897637800000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'colab'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."colab"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 114.385900000000000000
          Width = 94.000000000000000000
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
            'SETOR')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 113.385900000000000000
          Width = 556.000000000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'setor'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."setor"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 133.063080000000000000
          Width = 94.000000000000000000
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
            'DEVOLVIDO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 132.283550000000000000
          Width = 569.338900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'devolvido'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."devolvido"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 76.370130000000000000
          Width = 139.354360000000000000
          Height = 18.897637800000000000
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
            'DATA EMPR'#201'STIMO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 75.590600000000000000
          Width = 558.000310000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_emp'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."data_emp"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 151.960730000000000000
          Width = 131.795300000000000000
          Height = 18.897637800000000000
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
            'DATA DEVOLU'#199#195'O')
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 151.181200000000000000
          Width = 569.338900000000000000
          Height = 18.897637800000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_dev'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."data_dev"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 171.637910000000000000
          Width = 177.149660000000000000
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
            'QUANTIDADE DEVOLVIDA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 188.488250000000000000
          Top = 171.078850000000000000
          Width = 569.338900000000000000
          Height = 18.897637800000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'qtd_devolvida'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."qtd_devolvida"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo25: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 215.433210000000000000
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
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        object Memo22: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo24: TfrxMemoView
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
  object FDQueryRelatDev: TFDQuery
    MasterSource = DM.dsFDTabEmprestimoProd
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'select'
      '  p.cod_produto,'
      '  p.descricao,'
      '  emp.operador,'
      '  emp.quantidade,'
      '  TO_CHAR(emp.data_emprestimo, '#39'DD/MM/YYYY'#39') as data_emp,'
      '  c.descricao as colab,'
      '  s.descricao as setor,'
      '  emp.devolvido,'
      '  TO_CHAR(ip.data_devolucao, '#39'DD/MM/YYYY'#39') as data_dev,'
      '  ip.qtd_devolvida'
      'from'
      '  estoqueitec.emprestimo_produto emp'
      'join'
      '  estoqueitec.produto p ON p.id = emp.produto_id'
      'join'
      '  estoqueitec.colaborador c ON c.id = emp.colaborador_id'
      'join'
      '  estoqueitec.setor s ON s.id = emp.setor_id'
      'join'
      '  estoqueitec.item_emprestimo ip ON ip.id = emp.id'
      'where'
      '  ip.data_devolucao between :data_inicial and :data_final'
      'order by'
      '  ip.data_devolucao')
    Left = 120
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
  object frxDSRelatDev: TfrxDBDataset
    UserName = 'frxDSRelatDev'
    CloseDataSource = False
    DataSet = FDQueryRelatDev
    BCDToCurrency = False
    DataSetOptions = []
    Left = 211
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
        FieldName = 'data_emp'
      end
      item
        FieldName = 'colab'
        FieldType = fftString
        Size = 75
      end
      item
        FieldName = 'setor'
        FieldType = fftString
        Size = 75
      end
      item
        FieldName = 'devolvido'
        FieldType = fftString
      end
      item
        FieldName = 'data_dev'
      end
      item
        FieldName = 'qtd_devolvida'
      end>
  end
end
