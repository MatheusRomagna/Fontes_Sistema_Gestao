object FormAlteraPlaca: TFormAlteraPlaca
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o de Placa'
  ClientHeight = 157
  ClientWidth = 312
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
    Left = 136
    Top = 22
    Width = 33
    Height = 18
    Caption = 'Placa'
  end
  object EditPlacaCliente: TEdit
    Left = 64
    Top = 46
    Width = 177
    Height = 27
    TabOrder = 0
    TextHint = 'Digite o nome do cliente'
  end
  object btnAlterar: TBitBtn
    Left = 87
    Top = 95
    Width = 137
    Height = 39
    Caption = 'Alterar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object QAltera: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 252
    Top = 96
  end
end
