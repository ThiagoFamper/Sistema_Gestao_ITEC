object RelatorioEmprestimo: TRelatorioEmprestimo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Empr'#233'stimo'
  ClientHeight = 394
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
    Caption = 'Relat'#243'rio Empr'#233'stimo de Produto'
    Color = clCadetblue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 6
    ExplicitWidth = 921
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 340
    Height = 329
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhitesmoke
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 395
    ExplicitTop = 87
    ExplicitWidth = 457
    ExplicitHeight = 454
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 32
      Top = 104
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object DateTimeInicial: TDateTimePicker
      Left = 96
      Top = 40
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.970958333331509500
      TabOrder = 0
    end
    object DateTimeFinal: TDateTimePicker
      Left = 96
      Top = 104
      Width = 186
      Height = 23
      Date = 45789.000000000000000000
      Time = 0.970958333331509500
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 200
      Top = 153
      Width = 82
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object frxRelatEmp: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45789.971399988430000000
    ReportOptions.LastChange = 45789.971399988430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 256
    Datasets = <
      item
        DataSet = frxDSRelatEmp
        DataSetName = 'frxDSRelatEmp'
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
        Height = 154.960730000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDSRelatEmp
        DataSetName = 'frxDSRelatEmp'
        RowCount = 0
        object MemofrxDSRelatEmpcod: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."cod"]')
        end
        object MemofrxDSRelatEmpdescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 15.118120000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'descricao'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."descricao"]')
        end
        object MemofrxDSRelatEmpoperador: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 15.118120000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."operador"]')
        end
        object MemofrxDSRelatEmpquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 287.244280000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."quantidade"]')
        end
        object MemofrxDSRelatEmpdata: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."data"]')
        end
        object MemofrxDSRelatEmpcolab: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 15.118120000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'colab'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."colab"]')
        end
        object MemofrxDSRelatEmpsetor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 15.118120000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'setor'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."setor"]')
        end
        object MemofrxDSRelatEmpdevolvido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 646.299630000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'devolvido'
          DataSet = frxDSRelatEmp
          DataSetName = 'frxDSRelatEmp'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSRelatEmp."devolvido"]')
        end
      end
    end
  end
  object FDQueryRelatEmp: TFDQuery
    MasterSource = DM.dsFDTabEmprestimoProd
    Connection = DM.FDEstoqueItec
    SQL.Strings = (
      'select'
      '   p.cod_produto AS cod,'
      '   p.descricao,'
      '   emp.operador,'
      '   emp.quantidade,'
      '   emp.data_emprestimo AS data,'
      '   c.descricao AS colab,'
      '   s.descricao AS setor,'
      '   emp.devolvido'
      'FROM '
      '  estoqueitec.emprestimo_produto emp'
      'JOIN'
      '  estoqueitec.produto p ON p.id = emp.produto_id'
      'JOIN'
      '  estoqueitec.colaborador c ON c.id = emp.colaborador_id'
      'JOIN'
      '  estoqueitec.setor s ON s.id = emp.setor_id'
      'WHERE '
      '  emp.data_emprestimo BETWEEN :data_inicial AND :data_final'
      'ORDER BY'
      '  emp.data_emprestimo;'
      '   ')
    Left = 120
    Top = 256
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
  object frxDSRelatEmp: TfrxDBDataset
    UserName = 'frxDSRelatEmp'
    CloseDataSource = False
    DataSet = FDQueryRelatEmp
    BCDToCurrency = False
    DataSetOptions = []
    Left = 240
    Top = 256
  end
end
