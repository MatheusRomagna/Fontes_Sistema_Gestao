object FormDEV: TFormDEV
  Left = 0
  Top = 0
  Caption = 'Ferramenta de DEV'
  ClientHeight = 537
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAjustaVlrAvaliadoPagamentos: TButton
    Left = 8
    Top = 8
    Width = 217
    Height = 73
    Caption = 
      'Ajustar Valor Avaliador Pgtos diferente do Solicitado pgto do at' +
      'endimento'
    TabOrder = 0
    WordWrap = True
    OnClick = btnAjustaVlrAvaliadoPagamentosClick
  end
end
