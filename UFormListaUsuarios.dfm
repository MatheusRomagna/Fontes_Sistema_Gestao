object FormListaUsuarios: TFormListaUsuarios
  Left = 0
  Top = 0
  Caption = 'Lista de Usu'#225'rios'
  ClientHeight = 172
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 200
    Height = 25
    Caption = 'Selecione um usu'#225'rio'
  end
  object ComboBoxUsuarios: TComboBox
    Left = 24
    Top = 64
    Width = 257
    Height = 33
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 120
    Width = 201
    Height = 44
    Caption = 'Trocar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object qBuscaUsuarios: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 232
    Top = 72
  end
  object qTrocaUsuarios: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 48
    Top = 64
  end
end
