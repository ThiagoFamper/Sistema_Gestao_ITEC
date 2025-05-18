object RelatorioProduto: TRelatorioProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produto'
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
    Caption = 'Relat'#243'rio Produto'
    Color = clCadetblue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
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
    ExplicitTop = 57
    object Label2: TLabel
      Left = 39
      Top = 104
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object Label1: TLabel
      Left = 39
      Top = 56
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object BitBtn1: TBitBtn
      Left = 224
      Top = 149
      Width = 90
      Height = 28
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object DateTimeFinal: TDateTimePicker
      Left = 128
      Top = 104
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.863774629629915600
      TabOrder = 1
    end
    object DateTimeInicial: TDateTimePicker
      Left = 128
      Top = 56
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.863774629629915600
      TabOrder = 2
    end
  end
  object frxDSRelatProd: TfrxDBDataset
    UserName = 'frxDSRelatProd'
    CloseDataSource = False
    DataSet = FDQueryRelatProd
    BCDToCurrency = False
    DataSetOptions = []
    Left = 216
    Top = 264
  end
  object FDQueryRelatProd: TFDQuery
    Active = True
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '  p.id,'
      '  p.cod_produto,'
      '  p.descricao,'
      '  g.descricao AS grupo_descricao,'
      '  p.marca,'
      '  p.modelo,'
      '  p.grupo_id,'
      '  TO_CHAR(p.data, '#39'DD/MM/YYYY'#39') AS data'
      'FROM '
      '  estoqueitec.produto p'
      'JOIN '
      '  estoqueitec.grupo g ON g.id = p.grupo_id'
      'WHERE '
      '  p.data BETWEEN :data_inicial AND :data_final'
      'ORDER BY '
      '  p.data;')
    Left = 144
    Top = 264
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
  object frxRelatProd: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45789.932531435190000000
    ReportOptions.LastChange = 45789.932531435190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 64
    Top = 256
    Datasets = <
      item
        DataSet = frxDSRelatProd
        DataSetName = 'frxDSRelatProd'
      end>
    Variables = <>
    Style = <>
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
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 136.063080000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDSRelatProd
        DataSetName = 'frxDSRelatProd'
        RowCount = 0
        object MemofrxDSRelatProdcod_produto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSRelatProd
          DataSetName = 'frxDSRelatProd'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatProd."cod_produto"]')
        end
        object MemofrxDSRelatProddescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatProd
          DataSetName = 'frxDSRelatProd'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatProd."descricao"]')
        end
        object MemofrxDSRelatProdmarca: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'marca'
          DataSet = frxDSRelatProd
          DataSetName = 'frxDSRelatProd'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatProd."marca"]')
        end
        object MemofrxDSRelatProdmodelo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 362.834880000000000000
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'modelo'
          DataSet = frxDSRelatProd
          DataSetName = 'frxDSRelatProd'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatProd."modelo"]')
        end
        object MemofrxDSRelatProdgrupo_descricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 525.354670000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'grupo_descricao'
          DataSet = frxDSRelatProd
          DataSetName = 'frxDSRelatProd'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatProd."grupo_descricao"]')
        end
      end
    end
  end
end
