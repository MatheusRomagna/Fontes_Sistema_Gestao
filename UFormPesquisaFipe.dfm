object FormPesquisaFipe: TFormPesquisaFipe
  Left = 0
  Top = 0
  Caption = 'Pesquisa Fipe'
  ClientHeight = 507
  ClientWidth = 761
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 755
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 27
      Width = 77
      Height = 18
      Caption = 'Ano/Modelo'
    end
    object Label2: TLabel
      Left = 248
      Top = 27
      Width = 46
      Height = 18
      Caption = 'Modelo'
    end
    object EditAnoModelo: TEdit
      Left = 109
      Top = 24
      Width = 121
      Height = 26
      TabOrder = 0
    end
    object EditModelo: TEdit
      Left = 300
      Top = 24
      Width = 429
      Height = 26
      TabOrder = 1
      OnKeyDown = EditModeloKeyDown
      OnKeyPress = EditModeloKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 466
    Width = 761
    Height = 41
    Align = alBottom
    Caption = 'Duplo clique para selecionar ou ESC para abandonar a tela'
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 82
    Width = 755
    Height = 381
    Align = alClient
    DataSource = DataSourceFipe
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DataSourceFipe: TDataSource
    DataSet = qBuscaFipe
    Left = 368
    Top = 296
  end
  object qBuscaFipe: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from TBFIPE order by Marca, Modelo')
    Left = 472
    Top = 272
  end
end
