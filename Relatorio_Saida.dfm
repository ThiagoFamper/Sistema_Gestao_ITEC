object RelatorioSaida: TRelatorioSaida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Sa'#237'da'
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
    Caption = 'Relat'#243'rio Sa'#237'da de Produto'
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
    ExplicitTop = 81
    ExplicitWidth = 902
    ExplicitHeight = 492
    object Label1: TLabel
      Left = 23
      Top = 43
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 23
      Top = 104
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object DateTimeInicial: TDateTimePicker
      Left = 104
      Top = 43
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.944744328706292400
      TabOrder = 0
    end
    object DateTimeFinal: TDateTimePicker
      Left = 104
      Top = 104
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.944744328706292400
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 201
      Top = 152
      Width = 89
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object frxRelatSai: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45789.945092233790000000
    ReportOptions.LastChange = 45789.945092233790000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 280
    Datasets = <
      item
        DataSet = frxDSRelatSai
        DataSetName = 'frxDSRelatSai'
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
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 139.842610000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDSRelatSai
        DataSetName = 'frxDSRelatSai'
        RowCount = 0
        object MemofrxDSRelatSaiproduto_id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'produto_id'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."produto_id"]')
        end
        object MemofrxDSRelatSaidescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."descricao"]')
        end
        object MemofrxDSRelatSaioperador: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."operador"]')
        end
        object MemofrxDSRelatSaiquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 287.244280000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."quantidade"]')
        end
        object MemofrxDSRelatSaidata_saida: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_saida'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."data_saida"]')
        end
        object MemofrxDSRelatSaicolab_descricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'colab_descricao'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."colab_descricao"]')
        end
        object MemofrxDSRelatSaisetor_descricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'setor_descricao'
          DataSet = frxDSRelatSai
          DataSetName = 'frxDSRelatSai'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatSai."setor_descricao"]')
        end
      end
    end
  end
  object FDQueryRelatSai: TFDQuery
    Active = True
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'SELECT '
      '  sp.id,'
      '  sp.produto_id,'
      '  p.descricao,'
      '  sp.operador,'
      '  sp.quantidade,'
      '  TO_CHAR(sp.data_saida, '#39'DD/MM/YYYY'#39') AS data_saida,'
      '  c.descricao AS colab_descricao,'
      '  s.descricao AS setor_descricao'
      'FROM '
      '  estoqueitec.saida_produto sp'
      'JOIN '
      '  estoqueitec.produto p ON p.id = sp.produto_id'
      'JOIN '
      '  estoqueitec.colaborador c ON c.id = sp.colaborador_id'
      'JOIN '
      '  estoqueitec.setor s ON s.id = sp.setor_id'
      'WHERE '
      '  sp.data_saida BETWEEN :data_inicial AND :data_final'
      'ORDER BY '
      '  sp.data_saida;')
    Left = 104
    Top = 280
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
  object frxDSRelatSai: TfrxDBDataset
    UserName = 'frxDSRelatSai'
    CloseDataSource = False
    DataSet = FDQueryRelatSai
    BCDToCurrency = False
    DataSetOptions = []
    Left = 192
    Top = 280
  end
end
