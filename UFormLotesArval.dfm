object FormLotesArval: TFormLotesArval
  Left = 0
  Top = 0
  Caption = 'Lote'
  ClientHeight = 205
  ClientWidth = 573
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 80
    Top = 24
    Width = 52
    Height = 23
    Caption = 'Lote A'
  end
  object Label2: TLabel
    Left = 264
    Top = 24
    Width = 52
    Height = 23
    Caption = 'Lote B'
  end
  object Label3: TLabel
    Left = 448
    Top = 24
    Width = 52
    Height = 23
    Caption = 'Lote C'
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 179
    Width = 567
    Height = 23
    Align = alBottom
    Alignment = taCenter
    Caption = 'Selecione o Lote para processamento'
    ExplicitWidth = 312
  end
  object Button1: TButton
    Left = 41
    Top = 53
    Width = 136
    Height = 92
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 225
    Top = 53
    Width = 136
    Height = 92
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 409
    Top = 53
    Width = 136
    Height = 92
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
end
