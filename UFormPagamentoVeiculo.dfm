object FormPagamentoVeiculo: TFormPagamentoVeiculo
  Left = 0
  Top = 0
  Caption = 'Pagamento'
  ClientHeight = 321
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Hist'#243'rico de Pagamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 819
    Height = 233
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_atendimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Title.Caption = 'Usuario'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'valor_pgto'
        Title.Caption = 'Pagamento'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_env'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_pgto'
        Title.Caption = 'Data_Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario_pgto'
        Title.Caption = 'Usuario_Pagamento'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs'
        Visible = False
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 825
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -8
    ExplicitTop = 217
    ExplicitWidth = 635
    object lblPagar: TLabel
      Left = 160
      Top = 7
      Width = 70
      Height = 23
      Caption = 'Pagar:'
    end
    object lblPago: TLabel
      Left = 368
      Top = 9
      Width = 61
      Height = 23
      Caption = 'Pago:'
    end
    object LblSaldo: TLabel
      Left = 596
      Top = 7
      Width = 68
      Height = 23
      Caption = 'Saldo:'
    end
    object BtnPagar: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 145
      Height = 35
      Align = alLeft
      Caption = 'Pagar (R$)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnPagarClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
  object DataSource1: TDataSource
    DataSet = qPgtos
    Left = 424
    Top = 160
  end
  object qPgtos: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbcompras_pagamento')
    Active = True
    Left = 520
    Top = 160
    object qPgtosid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qPgtosid_atendimento: TIntegerField
      FieldName = 'id_atendimento'
    end
    object qPgtosusuario: TStringField
      FieldName = 'usuario'
      Size = 50
    end
    object qPgtosvalor: TFloatField
      FieldName = 'valor'
    end
    object qPgtosvalor_pgto: TFloatField
      FieldName = 'valor_pgto'
      currency = True
    end
    object qPgtosdata_env: TDateTimeField
      FieldName = 'data_env'
    end
    object qPgtosdata_pgto: TDateTimeField
      FieldName = 'data_pgto'
    end
    object qPgtosusuario_pgto: TStringField
      FieldName = 'usuario_pgto'
      Size = 50
    end
    object qPgtosobs: TStringField
      FieldName = 'obs'
      Size = 1000
    end
  end
end
