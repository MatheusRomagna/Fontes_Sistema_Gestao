object FormAlteraMidiaAnuncio: TFormAlteraMidiaAnuncio
  Left = 0
  Top = 0
  Caption = 'Altera'#231'a'#245' das M'#237'dias'
  ClientHeight = 172
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 40
    Top = 38
    Width = 71
    Height = 18
    Caption = 'Nova Midia'
  end
  object Label2: TLabel
    Left = 256
    Top = 38
    Width = 119
    Height = 18
    Caption = 'Novo Cod Anuncio'
  end
  object ComboBoxNovaMidia: TComboBox
    Left = 40
    Top = 62
    Width = 193
    Height = 26
    TabOrder = 0
    Items.Strings = (
      'OLX'
      'Porta SER'
      'Porta GRA'
      'Porta IPI'
      'Porta TER'
      'WebMotors')
  end
  object EditNovoCodAnuncio: TEdit
    Left = 256
    Top = 62
    Width = 193
    Height = 26
    TabOrder = 1
  end
  object btnAlterar: TBitBtn
    Left = 176
    Top = 112
    Width = 137
    Height = 39
    Caption = 'Alterar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object QAltera: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 376
    Top = 104
  end
end
