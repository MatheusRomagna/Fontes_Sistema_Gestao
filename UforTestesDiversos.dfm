object FormTestesDiversos: TFormTestesDiversos
  Left = 0
  Top = 0
  Caption = 'FormTestesDiversos'
  ClientHeight = 576
  ClientWidth = 1020
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1014
    Height = 490
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = -96
    ExplicitWidth = 1020
    ExplicitHeight = 576
    ControlData = {
      4C000000CD680000A53200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 496
    Width = 1020
    Height = 80
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -3
    ExplicitTop = 499
    object Label1: TLabel
      Left = 848
      Top = 24
      Width = 6
      Height = 13
      Caption = '1'
      Visible = False
    end
    object Button1: TButton
      Left = 280
      Top = 24
      Width = 75
      Height = 25
      Caption = '+'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 56
      Top = 24
      Width = 75
      Height = 25
      Caption = '-'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 137
      Top = 24
      Width = 137
      Height = 25
      Caption = 'Tamanho Normal'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
