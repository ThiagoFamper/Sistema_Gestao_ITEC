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
  object frxDSProd: TfrxDBDataset
    UserName = 'frxDSProd'
    CloseDataSource = False
    DataSet = DM.FDTabProduto
    BCDToCurrency = False
    DataSetOptions = []
    Left = 88
    Top = 24
    FieldDefs = <
      item
        FieldName = 'id'
      end
      item
        FieldName = 'descricao'
        FieldType = fftString
        Size = 75
      end
      item
        FieldName = 'marca'
        FieldType = fftString
        Size = 45
      end
      item
        FieldName = 'modelo'
        FieldType = fftString
        Size = 45
      end
      item
        FieldName = 'grupo_id'
      end
      item
        FieldName = 'cod_produto'
        FieldType = fftString
        Size = 45
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
    ReportOptions.CreateDate = 45787.959273715300000000
    ReportOptions.LastChange = 45787.959273715300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 24
    Datasets = <
      item
        DataSet = frxDSProd
        DataSetName = 'frxDSProd'
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
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
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
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 33.604899387576600000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'id')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 33.604899387576600000
          Width = 205.135495159879000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'descricao')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 238.740394547456000000
          Width = 125.913397115683000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'marca')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 364.653791663139000000
          Width = 131.641797194706000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'modelo')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 496.295588857844000000
          Width = 65.827149832077400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'grupo_id')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 562.122738689922000000
          Width = 155.987497530551000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'cod_produto')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDSProd
        DataSetName = 'frxDSProd'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 33.604899387576600000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."id"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 33.604899387576600000
          Width = 205.135495159879000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."descricao"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 238.740394547456000000
          Width = 125.913397115683000000
          Height = 18.897650000000000000
          DataField = 'marca'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."marca"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 364.653791663139000000
          Width = 131.641797194706000000
          Height = 18.897650000000000000
          DataField = 'modelo'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."modelo"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 496.295588857844000000
          Width = 65.827149832077400000
          Height = 18.897650000000000000
          DataField = 'grupo_id'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."grupo_id"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 562.122738689922000000
          Width = 155.987497530551000000
          Height = 18.897650000000000000
          DataField = 'cod_produto'
          DataSet = frxDSProd
          DataSetName = 'frxDSProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDSProd."cod_produto"]')
          ParentFont = False
          Style = 'Data'
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
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
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
  object frxRelatEnt: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45787.985708078700000000
    ReportOptions.LastChange = 45787.985708078700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Button2OnClick(Sender: TfrxComponent);'
      'begin'
      '  try'
      '    FDQueryRelatorio.Close;'
      
        '    FDQueryRelatorio.ParamByName('#39'data_inicial'#39').AsDate := StrTo' +
        'Date(DateEditInicial.Text);'
      
        '    FDQueryRelatorio.ParamByName('#39'data_final'#39').AsDate := StrToDa' +
        'te(DateEditFinal.Text);'
      '    FDQueryRelatorio.Open;'
      '  except'
      '    on E: Exception do'
      '      ShowMessage('#39'Erro ao carregar relat'#243'rio: '#39' + E.Message);'
      'end;  '
      'end;'
      'Begin            '
      ''
      'end.')
    Left = 24
    Top = 96
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
        Left = 124.000000000000000000
        Top = 244.000000000000000000
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
        pLeft = 124
        pTop = 244
      end
      object FDQuery1: TfrxFDQuery
        UserName = 'FDQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 200.000000000000000000
        Top = 244.000000000000000000
        IgnoreDupParams = False
        Params = <
          item
            Name = 'data_inicial'
            DataType = ftDate
            Expression = 'DateEdit1'
          end
          item
            Name = 'data_final'
            DataType = ftDate
            Expression = 'DateEdit2'
          end>
        SQL.Strings = (
          'SELECT '
          '    ep.id,'
          '    ep.produto_id,'
          '    ep.operador,'
          '    ep.quantidade,'
          '    TO_CHAR(ep.data_entrada, '#39'DD/MM/YYYY'#39') AS data_entrada,'
          '    ep.nota_fiscal,'
          '    ep.valor_unitario,'
          '    ep.valor_total'
          'FROM '
          '    estoqueitec.entrada_produto ep'
          'WHERE '
          '    ep.data_entrada BETWEEN :data_inicial AND :data_final'
          'ORDER BY '
          '    ep.data_entrada;')
        MacroCreate = True
        MacroExpand = True
        ReadOnly = False
        Database = frxRelatEnt.FDDatabase1
        Macros = <>
        pLeft = 200
        pTop = 244
        FieldDefs = <
          item
            FieldName = 'id'
          end
          item
            FieldName = 'produto_id'
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
            Expression = 'DateEdit1'
          end
          item
            Name = 'data_final'
            DataType = ftDate
            Expression = 'DateEdit2'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 60.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxRelatEnt.FDQuery1
        DataSetName = 'FDQuery1'
        RowCount = 0
        object MemoFDQuery1id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."id"]')
        end
        object MemoFDQuery1produto_id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'produto_id'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."produto_id"]')
        end
        object MemoFDQuery1operador: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 3.779530000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'operador'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."operador"]')
        end
        object MemoFDQuery1quantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantidade'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."quantidade"]')
        end
        object MemoFDQuery1data_entrada: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data_entrada'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."data_entrada"]')
        end
        object MemoFDQuery1nota_fiscal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nota_fiscal'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."nota_fiscal"]')
        end
        object MemoFDQuery1valor_unitario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_unitario'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."valor_unitario"]')
        end
        object MemoFDQuery1valor_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 34.015770000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'valor_total'
          DataSet = frxRelatEnt.FDQuery1
          DataSetName = 'FDQuery1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDQuery1."valor_total"]')
        end
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
      Height = 316.000000000000000000
      ClientHeight = 277.000000000000000000
      Left = 265.000000000000000000
      Top = 150.000000000000000000
      Width = 468.000000000000000000
      Scaled = True
      ClientWidth = 452.000000000000000000
      object Label1: TfrxLabelControl
        Left = 20.000000000000000000
        Top = 68.000000000000000000
        Width = 53.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = 'Data Inicial'
        Color = 13421772
      end
      object DateEdit1: TfrxDateEditControl
        Left = 80.000000000000000000
        Top = 64.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 45788.000000000000000000
        Time = 0.017921597223903520
        WeekNumbers = False
      end
      object Label2: TfrxLabelControl
        Left = 20.000000000000000000
        Top = 104.000000000000000000
        Width = 48.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = 'Data Final'
        Color = 13421772
      end
      object DateEditFinal: TfrxDateEditControl
        Left = 80.000000000000000000
        Top = 104.000000000000000000
        Width = 145.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        Date = 45788.000000000000000000
        Time = 0.017921597223903520
        WeekNumbers = False
      end
      object Button1: TfrxButtonControl
        Left = 20.000000000000000000
        Top = 172.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Cancelar'
        ModalResult = 2
      end
      object Button2: TfrxButtonControl
        Left = 120.000000000000000000
        Top = 172.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Confirmar'
        ModalResult = 1
        OnClick = 'Button2OnClick'
      end
    end
  end
  object frxDSEnt: TfrxDBDataset
    UserName = 'frxDSEnt'
    CloseDataSource = False
    DataSet = DM.FDTabEntrada
    BCDToCurrency = False
    DataSetOptions = []
    Left = 80
    Top = 96
  end
end
