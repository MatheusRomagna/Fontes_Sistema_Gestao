object FormRefFipes: TFormRefFipes
  Left = 0
  Top = 0
  Caption = 'Referencia de Fipes'
  ClientHeight = 189
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 494
    Height = 82
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Alignment = taCenter
        Color = clBlue
        Expanded = False
        FieldName = 'ref1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'REF FIPE 1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Color = 16744576
        Expanded = False
        FieldName = 'ref2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'REF FIPE 2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Color = 4227072
        Expanded = False
        FieldName = 'ref3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'REF FIPE 3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clYellow
        Expanded = False
        FieldName = 'principal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'FIPE PRINCIPAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 126
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 88
    Width = 500
    Height = 101
    Align = alBottom
    Caption = 'Dados dos Valores'
    TabOrder = 1
    Visible = False
    ExplicitTop = 82
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 490
      Height = 75
      Align = alClient
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = False
        end
        item
          Color = clBlue
          Expanded = False
          FieldName = 'fipe1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 103
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'fipe2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 97
          Visible = True
        end
        item
          Color = clGreen
          Expanded = False
          FieldName = 'fipe3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 101
          Visible = True
        end
        item
          Color = clYellow
          Expanded = False
          FieldName = 'fipePrincipal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = qBuscaRef
    Left = 312
    Top = 16
  end
  object qBuscaRef: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbfiperef')
    Active = True
    Left = 432
    Top = 16
    object qBuscaRefid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qBuscaRefref1: TStringField
      FieldName = 'ref1'
      Size = 7
    end
    object qBuscaRefref2: TStringField
      FieldName = 'ref2'
      Size = 7
    end
    object qBuscaRefref3: TStringField
      FieldName = 'ref3'
      Size = 7
    end
    object qBuscaRefprincipal: TStringField
      FieldName = 'principal'
      Size = 7
    end
  end
  object DataSource2: TDataSource
    DataSet = QAtuVlr
    Left = 416
    Top = 83
  end
  object QAtuVlr: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbvlrfipesref')
    Active = True
    Left = 448
    Top = 123
    object QAtuVlrid: TIntegerField
      FieldName = 'id'
    end
    object QAtuVlrfipe1: TFloatField
      FieldName = 'fipe1'
      currency = True
    end
    object QAtuVlrfipe2: TFloatField
      FieldName = 'fipe2'
      currency = True
    end
    object QAtuVlrfipe3: TFloatField
      FieldName = 'fipe3'
      currency = True
    end
    object QAtuVlrfipePrincipal: TFloatField
      FieldName = 'fipePrincipal'
      currency = True
    end
  end
  object qBuscaVlrs: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 248
    Top = 106
  end
end
