object FormDetalhesResumoCompra: TFormDetalhesResumoCompra
  Left = 0
  Top = 0
  Caption = 'Resumo Compra'
  ClientHeight = 284
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 931
    Height = 284
    Align = alClient
    Caption = 'Detalhes dos Valores'
    TabOrder = 0
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 263
      Top = 23
      Width = 405
      Height = 256
      Align = alClient
      Caption = 'Descontos'
      TabOrder = 0
      object Label31: TLabel
        Left = 61
        Top = 32
        Width = 42
        Height = 18
        Caption = 'Multas'
      end
      object Label32: TLabel
        Left = 16
        Top = 64
        Width = 87
        Height = 18
        Caption = 'IPVA,Seg, Lic'
      end
      object Label33: TLabel
        Left = 48
        Top = 97
        Width = 57
        Height = 18
        Caption = 'Quita'#231#227'o'
      end
      object Label37: TLabel
        Left = 16
        Top = 128
        Width = 89
        Height = 18
        Caption = 'Transfer'#234'ncia'
      end
      object Label38: TLabel
        Left = 32
        Top = 160
        Width = 73
        Height = 18
        Caption = '2'#170' via DUT'
      end
      object Label41: TLabel
        Left = 3
        Top = 192
        Width = 119
        Height = 18
        Caption = 'Total Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditVlrMultasPgto: TEdit
        Left = 109
        Top = 32
        Width = 156
        Height = 26
        Enabled = False
        TabOrder = 0
        Text = '0,00'
      end
      object EditVlrDocsPgto: TEdit
        Left = 109
        Top = 64
        Width = 156
        Height = 26
        Enabled = False
        TabOrder = 1
        Text = '0,00'
      end
      object EditVlrQuitacaoPgto: TEdit
        Left = 111
        Top = 96
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 2
        Text = '0,00'
      end
      object EditVlrTransPgto: TEdit
        Left = 111
        Top = 128
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 3
        Text = '0,00'
      end
      object EditVlrDutPgto: TEdit
        Left = 111
        Top = 160
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 4
        Text = '0,00'
      end
      object EditTotalDescontos: TEdit
        Left = 128
        Top = 192
        Width = 137
        Height = 26
        Enabled = False
        TabOrder = 5
        Text = '0,00'
      end
      object Button2: TButton
        Left = 271
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Visualizar'
        TabOrder = 6
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 271
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Visualizar'
        TabOrder = 7
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 271
        Top = 95
        Width = 75
        Height = 25
        Caption = 'Visualizar'
        TabOrder = 8
        OnClick = Button4Click
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 23
      Width = 252
      Height = 256
      Align = alLeft
      Caption = 'Ve'#237'culo'
      TabOrder = 1
      object Label34: TLabel
        Left = 47
        Top = 32
        Width = 26
        Height = 18
        Caption = 'Fipe'
      end
      object Label35: TLabel
        Left = 16
        Top = 64
        Width = 57
        Height = 18
        Caption = 'Proposta'
      end
      object Label36: TLabel
        Left = 13
        Top = 97
        Width = 60
        Height = 18
        Caption = 'Avalia'#231#227'o'
      end
      object EditVlrFipePgto: TEdit
        Left = 79
        Top = 32
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 0
        Text = '0,00'
      end
      object EditVlrPropostaPgto: TEdit
        Left = 79
        Top = 64
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 1
        Text = '0,00'
      end
      object EditVlrAvaliacaoPgto: TEdit
        Left = 79
        Top = 96
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 2
        Text = '0,00'
      end
    end
    object GroupBox4: TGroupBox
      AlignWithMargins = True
      Left = 674
      Top = 23
      Width = 252
      Height = 256
      Align = alRight
      Caption = 'L'#237'quido'
      TabOrder = 2
      object Label39: TLabel
        Left = 31
        Top = 40
        Width = 179
        Height = 19
        Caption = 'Avalia'#231#227'o - Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 39
        Top = 80
        Width = 167
        Height = 18
        Caption = 'L'#237'quido a pagar no ve'#237'culo'
      end
      object EditLiqPgto: TEdit
        Left = 47
        Top = 104
        Width = 154
        Height = 26
        Enabled = False
        TabOrder = 0
        Text = '0,00'
      end
    end
  end
end
