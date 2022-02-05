object FormNovaObs: TFormNovaObs
  Left = 0
  Top = 0
  Caption = 'Nova Obs'
  ClientHeight = 260
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object MemoObs: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 621
    Height = 199
    Align = alClient
    Lines.Strings = (
      'MemoObs')
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 96
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object Panel1: TPanel
    Left = 0
    Top = 205
    Width = 627
    Height = 55
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -68
    ExplicitWidth = 695
    object btnSalvar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 109
      Height = 47
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object qInsereObs: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 424
    Top = 205
  end
end
