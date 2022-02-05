object FormDataPagamento: TFormDataPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Data do Pagamento'
  ClientHeight = 289
  ClientWidth = 482
  Color = 16250871
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 116
    Height = 19
    Caption = 'Data pagamento'
  end
  object Label2: TLabel
    Left = 47
    Top = 93
    Width = 43
    Height = 19
    Caption = 'Valor:'
  end
  object DatePgto: TDateTimePicker
    Left = 154
    Top = 40
    Width = 143
    Height = 27
    Date = 44334.000000000000000000
    Time = 0.443334363422764000
    TabOrder = 0
  end
  object HoraPgto: TDateTimePicker
    Left = 303
    Top = 40
    Width = 114
    Height = 27
    Date = 44334.000000000000000000
    Time = 0.443334363422764000
    Kind = dtkTime
    TabOrder = 1
  end
  object btnConcluirPgto: TButton
    Left = 96
    Top = 160
    Width = 321
    Height = 49
    Caption = 'Concluir pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnConcluirPgtoClick
  end
  object btnCancelar: TButton
    Left = 96
    Top = 215
    Width = 321
    Height = 49
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object EditVlrPgto: TEdit
    Left = 96
    Top = 93
    Width = 321
    Height = 41
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 4
    Text = '0,00'
  end
  object qConcluiPgto: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 408
    Top = 152
  end
  object qValida: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 400
    Top = 224
  end
end
