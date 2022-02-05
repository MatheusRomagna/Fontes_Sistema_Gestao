object ClasseVeiculoAvaliacao: TClasseVeiculoAvaliacao
  Left = 0
  Top = 0
  Caption = 'DataSource1'
  ClientHeight = 249
  ClientWidth = 952
  Color = clBtnFace
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
    Left = 35
    Top = 120
    Width = 26
    Height = 18
    Caption = 'Fipe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 21
    Top = 152
    Width = 40
    Height = 18
    Caption = 'Avaria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 224
    Top = 184
    Width = 56
    Height = 18
    Caption = 'Mercado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 187
    Width = 21
    Height = 18
    Caption = 'KM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblStatusDias: TLabel
    Left = 209
    Top = 213
    Width = 223
    Height = 18
    Caption = 'Ve'#237'culo calculado sobre a base de '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 209
    Top = 120
    Width = 78
    Height = 18
    Caption = 'Em Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 222
    Top = 152
    Width = 58
    Height = 18
    Caption = 'Vendidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 946
    Height = 70
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_veiculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 138
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'classe_valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'classe_avaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'classe_mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'classe_KM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor_margem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 127
        Visible = True
      end>
  end
  object EditFipe: TEdit
    Left = 67
    Top = 120
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditAvaria: TEdit
    Left = 67
    Top = 152
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditMercado: TEdit
    Left = 293
    Top = 181
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object EditKM: TEdit
    Left = 67
    Top = 184
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object EditEmEstoque: TEdit
    Left = 293
    Top = 117
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object EditVendidos: TEdit
    Left = 293
    Top = 149
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object btnVerEmEstoque: TButton
    Left = 419
    Top = 117
    Width = 75
    Height = 25
    Caption = 'Ver'
    TabOrder = 7
    OnClick = btnVerEmEstoqueClick
  end
  object panelStatusCompra: TPanel
    Left = 759
    Top = 200
    Width = 185
    Height = 41
    Caption = 'Pendente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 8
  end
  object editNomeModelo: TEdit
    Left = 500
    Top = 115
    Width = 285
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object btnConsultaModelo: TButton
    Left = 787
    Top = 117
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 10
    OnClick = btnConsultaModeloClick
  end
  object Button1: TButton
    Left = 869
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Ver'
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 419
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Ver'
    TabOrder = 12
    OnClick = Button2Click
  end
  object EditModeloVendidos: TEdit
    Left = 500
    Top = 148
    Width = 285
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object Button3: TButton
    Left = 787
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 14
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 868
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Ver'
    TabOrder = 15
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = QBuscaClasse
    Left = 440
    Top = 184
  end
  object QBuscaClasse: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbClasseVeiculos')
    Active = True
    Left = 512
    Top = 184
    object QBuscaClasseid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QBuscaClasseid_veiculo: TIntegerField
      FieldName = 'id_veiculo'
    end
    object QBuscaClasseplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object QBuscaClassedata: TDateTimeField
      FieldName = 'data'
    end
    object QBuscaClasseclasse_valor: TStringField
      FieldName = 'classe_valor'
      Size = 5
    end
    object QBuscaClasseclasse_avaria: TStringField
      FieldName = 'classe_avaria'
      Size = 5
    end
    object QBuscaClasseclasse_mercado: TStringField
      FieldName = 'classe_mercado'
      Size = 5
    end
    object QBuscaClasseclasse_KM: TStringField
      FieldName = 'classe_KM'
      Size = 5
    end
    object QBuscaClassevalor_margem: TFloatField
      FieldName = 'valor_margem'
      currency = True
    end
  end
end
