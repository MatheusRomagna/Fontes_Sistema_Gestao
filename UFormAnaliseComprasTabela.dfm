object FormAnaliseComprasTabela: TFormAnaliseComprasTabela
  Left = 0
  Top = 0
  Caption = 'Analise Compras'
  ClientHeight = 792
  ClientWidth = 1065
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
  object Panel1: TPanel
    Left = 0
    Top = 712
    Width = 1065
    Height = 80
    Align = alBottom
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 83
    Width = 1065
    Height = 629
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MODELO'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO_MOD'
        Title.Caption = 'ANO'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDA_TRINTA_DIAS'
        Title.Caption = '30D'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Title.Caption = 'EST'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ULT_VENDA'
        Title.Caption = 'VU_VND'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ULT_VENDA'
        Title.Caption = 'DT_VND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_FIPE'
        Title.Caption = 'FIPE'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MIN_FIPE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Title.Caption = 'CAT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVARIA'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G_ZERO'
        Title.Caption = 'G0'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO'
        Title.Caption = 'RESULT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MIN_RESULTADO'
        Title.Caption = 'MIN/RESULT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MIN_DOIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRA_JA'
        Title.Caption = 'JA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MERC_UM'
        Title.Caption = 'VL1'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MERC_DOIS'
        Title.Caption = 'VL2'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATACADO_VAREJO'
        Title.Caption = 'AT/VJ'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATAC_VAREJ'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LANCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LANCE_FIPE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PGTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICITACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FIPE'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1065
    Height = 83
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 37
      Width = 85
      Height = 13
      Caption = 'Modelo do ve'#237'culo'
    end
    object Label2: TLabel
      Left = 200
      Top = 37
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object EditModelo: TEdit
      Left = 16
      Top = 56
      Width = 161
      Height = 21
      TabOrder = 0
      TextHint = 'Parte do modelo...'
    end
    object EditFornecedor: TEdit
      Left = 192
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 1
      TextHint = 'Fornecedor...'
    end
    object Button3: TButton
      Left = 488
      Top = 52
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 920
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Atualiza Tela'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object TbPlanCompras: TUniTable
    TableName = 'TBPROCPLANS'
    Left = 360
    Top = 312
    object TbPlanComprasID: TIntegerField
      FieldName = 'ID'
    end
    object TbPlanComprasMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object TbPlanComprasKM: TFloatField
      FieldName = 'KM'
    end
    object TbPlanComprasANO: TStringField
      FieldName = 'ANO'
      Size = 4
    end
    object TbPlanComprasANO_MOD: TStringField
      FieldName = 'ANO_MOD'
      Size = 4
    end
    object TbPlanComprasPLACA: TStringField
      FieldName = 'PLACA'
      Size = 11
    end
    object TbPlanComprasCOR: TStringField
      FieldName = 'COR'
    end
    object TbPlanComprasVLR_MIN: TFloatField
      FieldName = 'VLR_MIN'
    end
    object TbPlanComprasVLR_MIN_FIPE: TFloatField
      FieldName = 'VLR_MIN_FIPE'
    end
    object TbPlanComprasVLR_MIN_DOIS: TFloatField
      FieldName = 'VLR_MIN_DOIS'
    end
    object TbPlanComprasCOMPRA_JA: TFloatField
      FieldName = 'COMPRA_JA'
    end
    object TbPlanComprasVLR_FIPE: TFloatField
      FieldName = 'VLR_FIPE'
      currency = True
    end
    object TbPlanComprasVLR_MERC_UM: TFloatField
      FieldName = 'VLR_MERC_UM'
    end
    object TbPlanComprasVLR_MERC_DOIS: TFloatField
      FieldName = 'VLR_MERC_DOIS'
    end
    object TbPlanComprasVENDA_TRINTA_DIAS: TFloatField
      FieldName = 'VENDA_TRINTA_DIAS'
    end
    object TbPlanComprasESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object TbPlanComprasVLR_ULT_VENDA: TFloatField
      FieldName = 'VLR_ULT_VENDA'
      currency = True
    end
    object TbPlanComprasDT_ULT_VENDA: TDateField
      FieldName = 'DT_ULT_VENDA'
    end
    object TbPlanComprasATACADO_VAREJO: TStringField
      FieldName = 'ATACADO_VAREJO'
      Size = 30
    end
    object TbPlanComprasATAC_VAREJ: TStringField
      FieldName = 'ATAC_VAREJ'
      Size = 30
    end
    object TbPlanComprasCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 1
    end
    object TbPlanComprasG_ZERO: TFloatField
      FieldName = 'G_ZERO'
      currency = True
    end
    object TbPlanComprasMG: TFloatField
      FieldName = 'MG'
      currency = True
    end
    object TbPlanComprasAVARIA: TFloatField
      FieldName = 'AVARIA'
      currency = True
    end
    object TbPlanComprasRESULTADO: TFloatField
      FieldName = 'RESULTADO'
      currency = True
    end
    object TbPlanComprasMIN_RESULTADO: TFloatField
      FieldName = 'MIN_RESULTADO'
      currency = True
    end
    object TbPlanComprasLANCE: TFloatField
      FieldName = 'LANCE'
      currency = True
    end
    object TbPlanComprasLANCE_FIPE: TFloatField
      FieldName = 'LANCE_FIPE'
    end
    object TbPlanComprasCOMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object TbPlanComprasSN: TStringField
      FieldName = 'SN'
      Size = 1
    end
    object TbPlanComprasDT_PGTO: TDateField
      FieldName = 'DT_PGTO'
    end
    object TbPlanComprasQTD: TIntegerField
      FieldName = 'QTD'
    end
    object TbPlanComprasFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 100
    end
    object TbPlanComprasID_PLAN_FOR: TIntegerField
      FieldName = 'ID_PLAN_FOR'
    end
    object TbPlanComprasLICITACAO: TStringField
      FieldName = 'LICITACAO'
      Size = 12
    end
    object TbPlanComprasLOTE: TStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 1
    end
    object TbPlanComprasCOD_FIPE: TStringField
      FieldName = 'COD_FIPE'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = TbPlanCompras
    Left = 488
    Top = 312
  end
end
