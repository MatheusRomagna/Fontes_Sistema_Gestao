object FormParametros: TFormParametros
  Left = 0
  Top = 0
  Caption = 'Par'#226'metros'
  ClientHeight = 635
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tabAvaliacoes: TPageControl
    Left = 0
    Top = 0
    Width = 716
    Height = 635
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Avaliações: TTabSheet
      Caption = 'Avalia'#231#245'es'
      ExplicitWidth = 558
      DesignSize = (
        708
        602)
      object Label2: TLabel
        Left = 24
        Top = 32
        Width = 180
        Height = 18
        Caption = 'Fipe tipo: Compra na porta:'
      end
      object Label3: TLabel
        Left = 20
        Top = 80
        Width = 184
        Height = 18
        Caption = 'Fipe tipo: Compra em troca:'
      end
      object EditFipeCompraPorta: TEdit
        Left = 210
        Top = 29
        Width = 121
        Height = 26
        TabOrder = 0
        TextHint = 'MM/AAAA'
      end
      object EditFipeComraTroca: TEdit
        Left = 210
        Top = 77
        Width = 121
        Height = 26
        TabOrder = 1
        TextHint = 'MM/AAAA'
      end
      object BitBtn2: TBitBtn
        Left = 592
        Top = 559
        Width = 113
        Height = 40
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 2
        OnClick = BitBtn2Click
        ExplicitLeft = 442
      end
    end
    object tabVistorias: TTabSheet
      Caption = 'Vistorias'
      ImageIndex = 1
      ExplicitWidth = 558
      DesignSize = (
        708
        602)
      object Label4: TLabel
        Left = 32
        Top = 40
        Width = 89
        Height = 18
        Caption = 'Fipe Vistorias:'
      end
      object EditFipeVistorias: TEdit
        Left = 127
        Top = 37
        Width = 121
        Height = 26
        TabOrder = 0
        TextHint = 'MM/AAAA'
      end
      object BitBtn1: TBitBtn
        Left = 592
        Top = 559
        Width = 113
        Height = 40
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BitBtn1Click
        ExplicitLeft = 442
      end
    end
    object tabCompras: TTabSheet
      Caption = 'Compras'
      ImageIndex = 2
      ExplicitWidth = 558
      DesignSize = (
        708
        602)
      object Label5: TLabel
        Left = 16
        Top = 32
        Width = 163
        Height = 18
        Caption = 'Margem analise compras'
      end
      object EditVlrMargemCompras: TEdit
        Left = 185
        Top = 29
        Width = 121
        Height = 26
        TabOrder = 0
        Text = '4500'
      end
      object BitBtn3: TBitBtn
        Left = 592
        Top = 559
        Width = 113
        Height = 40
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BitBtn3Click
        ExplicitLeft = 442
      end
    end
    object tabAtendimento: TTabSheet
      Caption = 'Atendimento'
      ImageIndex = 3
      ExplicitWidth = 558
      DesignSize = (
        708
        602)
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 205
        Height = 18
        Caption = 'Valor padr'#227'o para transfer'#234'ncia'
      end
      object Label6: TLabel
        Left = 101
        Top = 72
        Width = 120
        Height = 18
        Caption = 'Fipe Atendimentos'
      end
      object EdirVlrPadraoTransf: TEdit
        Left = 227
        Top = 29
        Width = 121
        Height = 26
        TabOrder = 0
        Text = '500,00'
      end
      object btnSalvar: TBitBtn
        Left = 592
        Top = 559
        Width = 113
        Height = 40
        Anchors = [akRight, akBottom]
        Caption = 'Salvar'
        Kind = bkYes
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnSalvarClick
        ExplicitLeft = 442
      end
      object EditFipeAtendimentos: TEdit
        Left = 227
        Top = 69
        Width = 121
        Height = 26
        TabOrder = 2
      end
    end
    object tabFinanceiro: TTabSheet
      Caption = 'Financeiro'
      ImageIndex = 4
      ExplicitWidth = 558
    end
    object TabRegrasCompras: TTabSheet
      Caption = 'Regras de Compra'
      ImageIndex = 5
      ExplicitWidth = 558
      ExplicitHeight = 585
      object Label7: TLabel
        Left = 24
        Top = 16
        Width = 160
        Height = 19
        Caption = 'Regra valor compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 24
        Top = 184
        Width = 123
        Height = 19
        Caption = 'Regra Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 24
        Top = 360
        Width = 79
        Height = 19
        Caption = 'Regra KM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DbGridValorCompra: TDBGrid
        Left = 16
        Top = 41
        Width = 497
        Height = 128
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_de'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_ate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'classe'
            Visible = True
          end>
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 209
        Width = 497
        Height = 145
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 393
        Width = 497
        Height = 144
        DataSource = DataSource3
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_de'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_ate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'classe'
            Visible = True
          end>
      end
      object btnAcessaTabelaCompra: TButton
        Left = 16
        Top = 552
        Width = 209
        Height = 33
        Caption = 'Acessar tabela de compras'
        TabOrder = 3
        OnClick = btnAcessaTabelaCompraClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Proje'#231#245'es DRE'
      ImageIndex = 6
      object Label10: TLabel
        Left = 24
        Top = 32
        Width = 180
        Height = 19
        Caption = 'Par'#226'metros Proje'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 57
        Width = 513
        Height = 168
        DataSource = DataSource4
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tipo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end>
      end
    end
  end
  object UniTableParametros: TUniTable
    TableName = 'tbparametros'
    Connection = DataModuleConexao.UniConnection1
    CachedUpdates = True
    Active = True
    Options.FullRefresh = True
    Options.PrepareUpdateSQL = True
    Options.AutoPrepare = True
    Options.UpdateAllFields = True
    Left = 324
    Top = 221
    object UniTableParametrosvlrTransf: TFloatField
      FieldName = 'vlrTransf'
      currency = True
    end
    object UniTableParametrosvlrMargemCompras: TFloatField
      FieldName = 'vlrMargemCompras'
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = UniTableParametros
    ScopeMappings = <>
    Left = 240
    Top = 136
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 348
    Top = 141
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'vlrTransf'
      Control = EdirVlrPadraoTransf
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'vlrMargemCompras'
      Control = EditVlrMargemCompras
      Track = True
    end
  end
  object QAlteraDados: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 180
    Top = 149
  end
  object QCarregaParametrosDiversos: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 388
    Top = 261
  end
  object DataSource1: TDataSource
    DataSet = TableParamCompra
    Left = 356
    Top = 77
  end
  object TableParamCompra: TUniTable
    TableName = 'tbparamvalorcompra'
    Connection = DataModuleConexao.UniConnection1
    Active = True
    Left = 428
    Top = 69
    object TableParamCompraid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object TableParamCompradescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object TableParamCompravalor_de: TFloatField
      FieldName = 'valor_de'
    end
    object TableParamCompravalor_ate: TFloatField
      FieldName = 'valor_ate'
    end
    object TableParamCompraclasse: TStringField
      FieldName = 'classe'
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = TableMercado
    Left = 164
    Top = 293
  end
  object TableMercado: TUniTable
    TableName = 'tbparammercadocompra'
    Connection = DataModuleConexao.UniConnection1
    Active = True
    Left = 260
    Top = 293
    object TableMercadoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object TableMercadoqtd_d_vendida: TIntegerField
      FieldName = 'qtd_d_vendida'
    end
    object TableMercadosinal: TStringField
      FieldName = 'sinal'
      Size = 5
    end
    object TableMercadovalor_de: TFloatField
      FieldName = 'valor_de'
    end
    object TableMercadovalor_ate: TFloatField
      FieldName = 'valor_ate'
    end
    object TableMercadoclasse: TStringField
      FieldName = 'classe'
      Size = 1
    end
  end
  object DataSource3: TDataSource
    DataSet = TableKM
    Left = 236
    Top = 469
  end
  object TableKM: TUniTable
    TableName = 'tbparamkmcompra'
    Connection = DataModuleConexao.UniConnection1
    Active = True
    Left = 340
    Top = 461
    object TableKMid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object TableKMdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object TableKMvalor_de: TFloatField
      FieldName = 'valor_de'
    end
    object TableKMvalor_ate: TFloatField
      FieldName = 'valor_ate'
    end
    object TableKMclasse: TStringField
      FieldName = 'classe'
      Size = 1
    end
  end
  object DataSource4: TDataSource
    DataSet = ParamProj
    Left = 68
    Top = 197
  end
  object ParamProj: TUniTable
    TableName = 'parametrosprojecoes'
    Connection = DataModuleConexao.UniConnection1
    Active = True
    Left = 148
    Top = 197
  end
end
