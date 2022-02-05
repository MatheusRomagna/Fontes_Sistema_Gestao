object FormFiltrosGestao: TFormFiltrosGestao
  Left = 0
  Top = 0
  Caption = 'Filtros Gestao'
  ClientHeight = 454
  ClientWidth = 903
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object PanelV: TPanel
    AlignWithMargins = True
    Left = 15
    Top = 10
    Width = 554
    Height = 167
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    BevelOuter = bvNone
    Color = 16250871
    ParentBackground = False
    TabOrder = 0
    object CheckVendidosPrincipal: TCheckBox
      Left = 16
      Top = 0
      Width = 114
      Height = 33
      Caption = 'Vendidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CheckVendidosPrincipalClick
    end
    object CheckProprioVendidos: TCheckBox
      Left = 136
      Top = 9
      Width = 74
      Height = 17
      Caption = 'Pr'#243'prio'
      TabOrder = 1
      OnClick = CheckProprioVendidosClick
    end
    object CheckPrazoVendidos: TCheckBox
      Left = 216
      Top = 9
      Width = 81
      Height = 17
      Caption = 'Prazo'
      TabOrder = 2
      OnClick = CheckPrazoVendidosClick
    end
    object DtIniVendidos: TDateTimePicker
      Left = 16
      Top = 54
      Width = 121
      Height = 26
      Date = 44527.000000000000000000
      Time = 0.671526238424121400
      TabOrder = 3
    end
    object DtFimVendidos: TDateTimePicker
      Left = 159
      Top = 54
      Width = 121
      Height = 26
      Date = 44527.000000000000000000
      Time = 0.671526238424121400
      TabOrder = 4
    end
    object PanelVendidos: TPanel
      Left = 0
      Top = 86
      Width = 280
      Height = 79
      BevelOuter = bvNone
      TabOrder = 5
      object CheckArras: TCheckBox
        Left = 16
        Top = 15
        Width = 81
        Height = 17
        Caption = 'Arras'
        TabOrder = 0
      end
      object CheckFechamento: TCheckBox
        Left = 159
        Top = 15
        Width = 114
        Height = 17
        Caption = 'Fechamento'
        TabOrder = 1
      end
      object CheckFinalizado: TCheckBox
        Left = 159
        Top = 47
        Width = 81
        Height = 17
        Caption = 'Finalizado'
        TabOrder = 2
      end
      object CheckVendido: TCheckBox
        Left = 16
        Top = 46
        Width = 81
        Height = 17
        Caption = 'Vendido'
        TabOrder = 3
      end
    end
    object GroupBox1: TGroupBox
      Left = 286
      Top = 0
      Width = 259
      Height = 161
      Caption = 'Lojas'
      TabOrder = 6
      object chkUsoVendidos: TCheckBox
        Left = 17
        Top = 31
        Width = 114
        Height = 17
        Caption = '0-USO'
        TabOrder = 0
      end
      object chkSerVendidos: TCheckBox
        Left = 17
        Top = 54
        Width = 114
        Height = 17
        Caption = '1-SER'
        TabOrder = 1
      end
      object chkSelVendidos: TCheckBox
        Left = 17
        Top = 77
        Width = 114
        Height = 17
        Caption = '2-SL'
        TabOrder = 2
      end
      object chkGraVendidos: TCheckBox
        Left = 17
        Top = 100
        Width = 114
        Height = 17
        Caption = '3-GRA'
        TabOrder = 3
      end
      object chkIpiVendidos: TCheckBox
        Left = 17
        Top = 123
        Width = 114
        Height = 17
        Caption = '4-IPI'
        TabOrder = 4
      end
      object chkNhVendidos: TCheckBox
        Left = 137
        Top = 31
        Width = 114
        Height = 17
        Caption = '5-NH'
        TabOrder = 5
      end
      object chkTerVendidos: TCheckBox
        Left = 137
        Top = 54
        Width = 114
        Height = 17
        Caption = '6-TER'
        TabOrder = 6
      end
      object chkPreVendidos: TCheckBox
        Left = 137
        Top = 77
        Width = 114
        Height = 17
        Caption = '7-PRE'
        TabOrder = 7
      end
      object chkRepVendidos: TCheckBox
        Left = 137
        Top = 100
        Width = 114
        Height = 17
        Caption = '8-REP'
        TabOrder = 8
      end
    end
    object Button1: TButton
      Left = 462
      Top = 129
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 7
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 15
    Top = 197
    Width = 554
    Height = 169
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    BevelOuter = bvNone
    Color = 16250871
    ParentBackground = False
    TabOrder = 1
    object CheckEstoquePrincipal: TCheckBox
      Left = 16
      Top = 8
      Width = 114
      Height = 25
      Caption = 'Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CheckEstoquePrincipalClick
    end
    object CheckProprioEstoque: TCheckBox
      Left = 136
      Top = 14
      Width = 74
      Height = 17
      Caption = 'Pr'#243'prio'
      TabOrder = 1
      OnClick = CheckProprioEstoqueClick
    end
    object CheckPrazoEstoque: TCheckBox
      Left = 216
      Top = 14
      Width = 81
      Height = 17
      Caption = 'Prazo'
      TabOrder = 2
      OnClick = CheckPrazoEstoqueClick
    end
    object CheckAgTransporte: TCheckBox
      Left = 16
      Top = 61
      Width = 121
      Height = 25
      Caption = 'Ag Transporte'
      TabOrder = 3
    end
    object CheckPreparando: TCheckBox
      Left = 16
      Top = 92
      Width = 114
      Height = 17
      Caption = 'Preparando'
      TabOrder = 4
    end
    object CheckEmVenda: TCheckBox
      Left = 16
      Top = 123
      Width = 114
      Height = 17
      Caption = 'Em Venda'
      TabOrder = 5
    end
    object CheckEstoque: TCheckBox
      Left = 159
      Top = 65
      Width = 81
      Height = 16
      Caption = 'Estoque'
      TabOrder = 6
    end
    object CheckAutoAvaliar: TCheckBox
      Left = 159
      Top = 93
      Width = 98
      Height = 16
      Caption = 'Auto Avaliar'
      TabOrder = 7
    end
    object GroupBox3: TGroupBox
      Left = 286
      Top = 1
      Width = 259
      Height = 161
      Caption = 'Lojas'
      TabOrder = 8
      object chkUsoEstoque: TCheckBox
        Left = 17
        Top = 31
        Width = 114
        Height = 17
        Caption = '0-USO'
        TabOrder = 0
      end
      object chkSerEstoque: TCheckBox
        Left = 17
        Top = 54
        Width = 114
        Height = 17
        Caption = '1-SER'
        TabOrder = 1
      end
      object chkSelEstoque: TCheckBox
        Left = 17
        Top = 77
        Width = 114
        Height = 17
        Caption = '2-SL'
        TabOrder = 2
      end
      object chkGraEstoque: TCheckBox
        Left = 17
        Top = 100
        Width = 114
        Height = 17
        Caption = '3-GRA'
        TabOrder = 3
      end
      object chkIpiEstoque: TCheckBox
        Left = 17
        Top = 123
        Width = 114
        Height = 17
        Caption = '4-IPI'
        TabOrder = 4
      end
      object chkNhEstoque: TCheckBox
        Left = 137
        Top = 31
        Width = 114
        Height = 17
        Caption = '5-NH'
        TabOrder = 5
      end
      object chkTerEstoque: TCheckBox
        Left = 137
        Top = 54
        Width = 114
        Height = 17
        Caption = '6-TER'
        TabOrder = 6
      end
      object chkPreEstoque: TCheckBox
        Left = 137
        Top = 77
        Width = 114
        Height = 17
        Caption = '7-PRE'
        TabOrder = 7
      end
      object chkRepEstoque: TCheckBox
        Left = 137
        Top = 100
        Width = 114
        Height = 17
        Caption = '8-REP'
        TabOrder = 8
      end
    end
  end
  object btnAplicaFiltros: TButton
    AlignWithMargins = True
    Left = 3
    Top = 376
    Width = 897
    Height = 75
    Align = alBottom
    Caption = 'Aplicar Filtros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAplicaFiltrosClick
  end
  object GroupBox2: TGroupBox
    Left = 582
    Top = 8
    Width = 307
    Height = 365
    Caption = 'Origem'
    TabOrder = 3
    object DbgridVendidosOrigem: TDBGrid
      Left = 2
      Top = 20
      Width = 303
      Height = 343
      Align = alClient
      DataSource = DataSourceOrigem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'inv_nome'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
  end
  object DataSourceOrigem: TDataSource
    DataSet = qBuscaOrigem
    Left = 785
    Top = 154
  end
  object qBuscaOrigem: TUniQuery
    Connection = DataModuleConexao.UniConnectionSavanna
    SQL.Strings = (
      'select inv_nome, inv_fone from inv'
      'where inv_fone is not null'
      'order by inv_nome')
    Active = True
    Left = 785
    Top = 210
    object qBuscaOrigeminv_nome: TStringField
      FieldName = 'inv_nome'
      Size = 50
    end
  end
end
