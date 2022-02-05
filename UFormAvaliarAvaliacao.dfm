object FormAvaliarAvaliacao: TFormAvaliarAvaliacao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormAvaliarAvaliacao'
  ClientHeight = 260
  ClientWidth = 839
  Color = 5197823
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 833
    Height = 97
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Valor Avaliado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 616
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 229
    Width = 833
    Height = 28
    Align = alBottom
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tecle (enter) para confirmar ou (esc) para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitTop = 232
    ExplicitWidth = 616
  end
  object EditVlrAvaliado: TEdit
    AlignWithMargins = True
    Left = 208
    Top = 90
    Width = 433
    Height = 111
    Alignment = taCenter
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    TextHint = 'Digite o Valor'
    OnKeyDown = EditVlrAvaliadoKeyDown
    OnKeyPress = EditVlrAvaliadoKeyPress
  end
  object qAtuValorAvaliadoPlaca: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 560
    Top = 128
  end
end
