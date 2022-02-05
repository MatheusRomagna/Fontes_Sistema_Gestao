object FormNovaAvaliacao: TFormNovaAvaliacao
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Nova Avalia'#231#227'o'
  ClientHeight = 142
  ClientWidth = 464
  Color = 187
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 458
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Digite a nova avalia'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 215
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 123
    Width = 458
    Height = 16
    Align = alBottom
    Alignment = taCenter
    Caption = 'Ender para confirmar ou ESC para cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 249
  end
  object EditNovaAvaliacao: TEdit
    AlignWithMargins = True
    Left = 64
    Top = 56
    Width = 337
    Height = 50
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    Text = '0,00'
    OnEnter = EditNovaAvaliacaoEnter
    OnKeyPress = EditNovaAvaliacaoKeyPress
  end
  object qAlteraAvaliacaoGestao: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 408
    Top = 32
  end
  object qAlteraAvaliacaoMobile: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 408
    Top = 80
  end
end
