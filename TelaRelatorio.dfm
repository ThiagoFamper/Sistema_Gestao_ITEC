object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object frxReport1: TfrxReport
    Version = '2025.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45784.892783194400000000
    ReportOptions.LastChange = 45784.931585972220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 176
    Datasets = <
      item
        DataSet = frxReport1.FDTable1
        DataSetName = 'FDTable1'
      end
      item
        DataSet = frxReport1.FDQuery1
        DataSetName = 'FDQuery1'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object FDDatabase1: TfrxFDDatabase
        Left = 224.000000000000000000
        Top = 164.000000000000000000
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
        pLeft = 224
        pTop = 164
      end
      object FDTable1: TfrxFDTable
        UserName = 'FDTable1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 220.000000000000000000
        Top = 236.000000000000000000
        TableName = 'estoqueitec.produto'
        IndexFieldNames = 'id'
        Database = frxReport1.FDDatabase1
        pLeft = 220
        pTop = 236
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
      object FDQuery1: TfrxFDQuery
        UserName = 'FDQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        DataSetOptions = []
        Left = 216.000000000000000000
        Top = 324.000000000000000000
        IgnoreDupParams = False
        Params = <>
        SQL.Strings = (
          'select * from Produto')
        MacroCreate = True
        MacroExpand = True
        ReadOnly = False
        Database = frxReport1.FDDatabase1
        Macros = <>
        pLeft = 216
        pTop = 324
        Parameters = <>
        Macross = <>
      end
    end
    object Page1: TfrxReportPage
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
        DataSet = frxReport1.FDTable1
        DataSetName = 'FDTable1'
        RowCount = 0
        object MemoFDTable1marca: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 41.574830000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'marca'
          DataSet = frxReport1.FDTable1
          DataSetName = 'FDTable1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDTable1."marca"]')
        end
        object MemoFDTable1modelo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 86.929190000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'modelo'
          DataSet = frxReport1.FDTable1
          DataSetName = 'FDTable1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDTable1."modelo"]')
        end
        object MemoFDTable1grupo_id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'grupo_id'
          DataSet = frxReport1.FDTable1
          DataSetName = 'FDTable1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDTable1."grupo_id"]')
        end
        object MemoFDTable1cod_produto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 173.858380000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_produto'
          DataSet = frxReport1.FDTable1
          DataSetName = 'FDTable1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDTable1."cod_produto"]')
        end
        object MemoFDTable1id: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'id'
          DataSet = frxReport1.FDTable1
          DataSetName = 'FDTable1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[FDTable1."id"]')
        end
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
