object FormAlteracaoProposta: TFormAlteracaoProposta
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o de Proposta (R$)'
  ClientHeight = 170
  ClientWidth = 325
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
    Top = 30
    Width = 57
    Height = 18
    Caption = 'Proposta'
  end
  object EditProposta: TEdit
    Left = 72
    Top = 62
    Width = 177
    Height = 27
    NumbersOnly = True
    TabOrder = 0
    TextHint = 'Digite o nome do cliente'
  end
  object btnAlterar: TBitBtn
    Left = 95
    Top = 111
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
    Left = 276
    Top = 16
  end
end
