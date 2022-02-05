object FormAlteraDadosCliente: TFormAlteraDadosCliente
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o dos dados do cliente'
  ClientHeight = 165
  ClientWidth = 565
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
    Left = 32
    Top = 38
    Width = 39
    Height = 18
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 349
    Top = 38
    Width = 57
    Height = 18
    Caption = 'Telefone'
  end
  object EditNomeCliente: TEdit
    Left = 32
    Top = 62
    Width = 293
    Height = 27
    TabOrder = 0
    TextHint = 'Digite o nome do cliente'
  end
  object EditTelefone: TMaskEdit
    Left = 349
    Top = 62
    Width = 155
    Height = 27
    EditMask = '!\(99\) #0000-0000;1;_'
    MaxLength = 15
    TabOrder = 1
    Text = '(  )      -    '
  end
  object btnAlterar: TBitBtn
    Left = 224
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
    Left = 432
    Top = 96
  end
end
