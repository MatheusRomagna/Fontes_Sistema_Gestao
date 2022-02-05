object FormAlteraPermissaoAppTransp: TFormAlteraPermissaoAppTransp
  Left = 0
  Top = 0
  Caption = 'Altera Permissao App'
  ClientHeight = 191
  ClientWidth = 512
  Color = 2033625
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 120
    Top = 40
    Width = 90
    Height = 19
    Caption = 'VISUALIZA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 320
    Top = 40
    Width = 66
    Height = 19
    Caption = 'ALTERA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBoxVisualiza: TComboBox
    Left = 96
    Top = 65
    Width = 145
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      'SIM'
      'NAO')
  end
  object ComboBoxAltera: TComboBox
    Left = 280
    Top = 65
    Width = 145
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      'SIM'
      'NAO')
  end
  object btnAlterar: TButton
    Left = 168
    Top = 118
    Width = 177
    Height = 49
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object qAlteraPermissao: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 408
    Top = 120
  end
end
