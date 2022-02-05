object FormPermissoesCarga: TFormPermissoesCarga
  Left = 0
  Top = 0
  Caption = 'Permissoes Carga'
  ClientHeight = 582
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 797
    Height = 41
    Align = alTop
    Caption = 'Aplicar Carga'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 797
    Height = 541
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = qBuscaTelas
    Left = 360
    Top = 280
  end
  object qCriaPermissoesTelas: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 232
    Top = 336
  end
  object qBuscaTelas: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 464
    Top = 312
  end
end
