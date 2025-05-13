object RelatorioEmprestimo: TRelatorioEmprestimo
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Empr'#233'stimo'
  ClientHeight = 470
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DateTimeInicial: TDateTimePicker
    Left = 208
    Top = 168
    Width = 186
    Height = 23
    Date = 45789.000000000000000000
    Time = 0.970958333331509500
    TabOrder = 0
  end
  object DateTimeFinal: TDateTimePicker
    Left = 208
    Top = 208
    Width = 186
    Height = 23
    Date = 45789.000000000000000000
    Time = 0.970958333331509500
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 272
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 2
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
    Left = 144
    Top = 344
    Datasets = <>
    Variables = <>
    Style = <>
    Watermarks = <>
  end
  object FDQueryRelatEmp: TFDQuery
    Left = 248
    Top = 344
  end
  object frxDSRelatEmp: TfrxDBDataset
    UserName = 'frxDSRelatEmp'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 368
    Top = 352
  end
end
