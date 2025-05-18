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
    AutoSize = True
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 57
    ExplicitWidth = 453
    object Label1: TLabel
      Left = 39
      Top = 56
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 39
      Top = 112
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object BitBtn1: TBitBtn
      Left = 182
      Top = 181
      Width = 107
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object DateTimeFinal: TDateTimePicker
      Left = 103
      Top = 112
      Width = 186
      Height = 23
      Date = 45792.000000000000000000
      Time = 0.960952118053683100
      TabOrder = 1
    end
    object DateTimeInicial: TDateTimePicker
      Left = 103
      Top = 56
      Width = 186
      Height = 23
      Date = 45792.000000000000000000
      Time = 0.960898009259835800
      TabOrder = 2
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
    ReportOptions.CreateDate = 45792.960686307870000000
    ReportOptions.LastChange = 45792.960686307870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 304
    Datasets = <
      item
        DataSet = frxDSRelatDev
        DataSetName = 'frxDSRelatDev'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 241.889920000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDSRelatDev
        DataSetName = 'frxDSRelatDev'
        RowCount = 0
        object MemofrxDSRelatDevcod_produto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."cod_produto"]')
        end
        object MemofrxDSRelatDevdescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."descricao"]')
        end
        object MemofrxDSRelatDevoperador: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 11.338590000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."operador"]')
        end
        object MemofrxDSRelatDevquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."quantidade"]')
        end
        object MemofrxDSRelatDevdata_emp: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_emp'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."data_emp"]')
        end
        object MemofrxDSRelatDevcolab: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'colab'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."colab"]')
        end
        object MemofrxDSRelatDevsetor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'setor'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."setor"]')
        end
        object MemofrxDSRelatDevdevolvido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 11.338590000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'devolvido'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."devolvido"]')
        end
        object MemofrxDSRelatDevdata_dev: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 11.338590000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_dev'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."data_dev"]')
        end
        object MemofrxDSRelatDevqtd_devolvida: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 631.181510000000000000
          Top = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'qtd_devolvida'
          DataSet = frxDSRelatDev
          DataSetName = 'frxDSRelatDev'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatDev."qtd_devolvida"]')
        end
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
    Left = 224
    Top = 304
  end
end
