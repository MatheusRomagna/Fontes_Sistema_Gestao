object FormVerCarrosClasse: TFormVerCarrosClasse
  Left = 0
  Top = 0
  ClientHeight = 250
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 994
    Height = 250
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = qBuscaVeicSavanna
    Left = 200
    Top = 104
  end
  object qBuscaVeicSavanna: TUniQuery
    Connection = DataModuleConexao.UniConnectionSavanna
    Left = 312
    Top = 104
  end
end
