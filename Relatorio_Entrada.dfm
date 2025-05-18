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
    ExplicitLeft = 16
    ExplicitTop = 24
    ExplicitWidth = 241
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
    ExplicitLeft = -8
    ExplicitTop = 71
    object Label1: TLabel
      Left = 56
      Top = 51
      Width = 58
      Height = 14
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 56
      Top = 104
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object DateTimeInicial: TDateTimePicker
      Left = 120
      Top = 51
      Width = 186
      Height = 23
      Date = 45788.000000000000000000
      Time = 0.960387824074132400
      TabOrder = 0
    end
    object DateTimeFinal: TDateTimePicker
      Left = 120
      Top = 104
      Width = 186
      Height = 23
      Date = 45788.000000000000000000
      Time = 0.960387824074132400
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 209
      Top = 174
      Width = 97
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object frxDSEnt: TfrxDBDataset
    UserName = 'frxDSEnt'
    CloseDataSource = False
    DataSet = FDQueryRelatEnt
    BCDToCurrency = False
    DataSetOptions = []
    Left = 184
    Top = 304
  end
  object FDQueryRelatEnt: TFDQuery
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '  ep.id,'
      '  ep.produto_id,'
      '  p.cod_produto,'
      '  p.descricao,'
      '  ep.operador,'
      '  ep.quantidade,'
      '  TO_CHAR(ep.data_entrada, '#39'DD/MM/YYYY'#39') AS data_entrada,'
      '  ep.nota_fiscal,'
      '  ep.valor_unitario,'
      '  ep.valor_total'
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
    ReportOptions.CreateDate = 45788.966953738430000000
    ReportOptions.LastChange = 45788.966953738430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
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
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
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
        Width = 786.142240000000000000
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
        Width = 786.142240000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 147.401670000000000000
        Width = 786.142240000000000000
        DataSet = frxDSEnt
        DataSetName = 'frxDSEnt'
        RowCount = 0
        object MemofrxDSEntcod_produto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."cod_produto"]')
        end
        object MemofrxDSEntdescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."descricao"]')
        end
        object MemofrxDSEntoperador: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."operador"]')
        end
        object MemofrxDSEntquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."quantidade"]')
        end
        object MemofrxDSEntdata_entrada: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_entrada'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."data_entrada"]')
        end
        object MemofrxDSEntnota_fiscal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nota_fiscal'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."nota_fiscal"]')
        end
        object MemofrxDSEntvalor_unitario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_unitario'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."valor_unitario"]')
        end
        object MemofrxDSEntvalor_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_total'
          DataSet = frxDSEnt
          DataSetName = 'frxDSEnt'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSEnt."valor_total"]')
        end
      end
    end
  end
end
