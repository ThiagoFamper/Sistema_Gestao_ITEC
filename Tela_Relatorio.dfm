object TelaRelatorio: TTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 687
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RelatProduto: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45784.892783194400000000
    ReportOptions.LastChange = 45784.961690196760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 96
    Top = 80
    Datasets = <
      item
        DataSet = RelatProduto.FDTable1
        DataSetName = 'FDTable1'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDDatabase1: TfrxFDDatabase
        Left = 112.000000000000000000
        Top = 208.000000000000000000
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
        pLeft = 112
        pTop = 208
      end
      object FDTable1: TfrxFDTable
        UserName = 'FDTable1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 176.000000000000000000
        Top = 208.000000000000000000
        TableName = 'estoqueitec.produto'
        IndexFieldNames = 'id'
        Database = RelatProduto.FDDatabase1
        pLeft = 176
        pTop = 208
        FieldDefs = <
          item
            FieldName = 'id'
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
          end>
      end
    end
    object Page1: TfrxReportPage
      HGuides.Strings = (
        '50,83')
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 362.834880000000000000
        Top = 102.047310000000000000
        Width = 740.409927000000000000
        DataSet = RelatProduto.FDTable1
        DataSetName = 'FDTable1'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 525.354670000000000000
        Width = 740.409927000000000000
      end
    end
  end
end
