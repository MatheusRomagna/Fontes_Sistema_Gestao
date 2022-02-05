object FormExcelCompras: TFormExcelCompras
  Left = 0
  Top = 0
  Caption = 'FormExcelCompras'
  ClientHeight = 449
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 799
    Height = 377
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 392
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object QPlan: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select'
      
        'p.licitacao, p.lote, p.placa, p.modelo, p.km, p.ano, p.ano_mod, ' +
        'p.cor,'
      
        'p.vlr_min as "MIN", cast((p.vlr_min / p.vlr_fipe) * 100 as numer' +
        'ic(15,2)) as "(MIN/FIPE)", p.vlr_min_dois as "MIN_2", p.compra_j' +
        'a as "JA",'
      
        'p.vlr_fipe as "FIPE", p.vlr_merc_um as  "MERC1", p.vlr_merc_dois' +
        ' as "MERC2", p.venda_trinta_dias as "VENDA 30 DIAS",'
      
        'p.estoque, p.vlr_ult_venda, p.atacado_varejo as "A/V", p.categor' +
        'ia, p.g_zero "G0",'
      
        'p.mg as "MG", p.avaria , p.resultado, p.min_resultado, p.lance, ' +
        'p.lance_fipe as "(LANC/FIPE)",'
      'p.compra, p.sn as "S/N", p.dt_pgto as "PGTO", p.qtd'
      'from tbprocplans p')
    Left = 408
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = QPlan
    Left = 336
    Top = 248
  end
end
