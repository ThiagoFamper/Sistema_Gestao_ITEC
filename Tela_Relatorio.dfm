object TelaRelatorio: TTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 466
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object frxRelatEnt: TfrxReport
    Version = '2025.2.1'
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
    Left = 21
    Top = 104
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
        Top = 80.000000000000000000
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
        Top = 16.000000000000000000
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
      object DateEdit1: TfrxDateEditControl
        Left = 96.000000000000000000
        Top = 92.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 45788.000000000000000000
        Time = 0.507441909721819700
        WeekNumbers = False
      end
      object DateEdit2: TfrxDateEditControl
        Left = 96.000000000000000000
        Top = 120.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 45788.000000000000000000
        Time = 0.507934837965876800
        WeekNumbers = False
      end
      object Button1: TfrxButtonControl
        Left = 96.000000000000000000
        Top = 172.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Cancel'
        ModalResult = 2
      end
      object Button2: TfrxButtonControl
        Left = 180.000000000000000000
        Top = 172.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'OK'
        ModalResult = 1
      end
      object Memo1: TfrxMemoControl
        Left = 48.000000000000000000
        Top = 92.000000000000000000
        Width = 41.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Lines.Strings = (
          'Memo'
          '1')
        MaxLength = 0
      end
      object Memo2: TfrxMemoControl
        Left = 48.000000000000000000
        Top = 120.000000000000000000
        Width = 41.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Lines.Strings = (
          'Memo'
          '1')
        MaxLength = 0
      end
    end
  end
  object frxDSEnt: TfrxDBDataset
    UserName = 'frxDSEnt'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 85
    Top = 104
  end
  object FDEstoqueItec: TFDConnection
    Params.Strings = (
      'Database=estoqueitec'
      'User_Name=postgres'
      'Password=postgres'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 170
    Top = 22
  end
  object FDTransaction1: TFDTransaction
    Connection = FDEstoqueItec
    Left = 282
    Top = 22
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 422
    Top = 22
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 572
    Top = 22
  end
end
