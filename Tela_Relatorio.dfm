object TelaRelatorio: TTelaRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 367
  ClientWidth = 478
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
    ReportOptions.LastChange = 45785.052810578700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 104
    Top = 80
    Datasets = <
      item
        DataSet = RelatProduto.FDTabProduto
        DataSetName = 'FDTabProduto'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDDatabase: TfrxFDDatabase
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
      object FDTabProduto: TfrxFDTable
        UserName = 'FDTabProduto'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 192.000000000000000000
        Top = 208.000000000000000000
        TableName = 'estoqueitec.produto'
        IndexFieldNames = 'id'
        Database = RelatProduto.FDDatabase
        pLeft = 192
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
        Top = 16.000000000000000000
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
        Top = 60.000000000000000000
        Width = 740.409927000000000000
        DataSet = RelatProduto.FDTabProduto
        DataSetName = 'FDTabProduto'
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
        Top = 444.000000000000000000
        Width = 740.409927000000000000
      end
    end
  end
end
