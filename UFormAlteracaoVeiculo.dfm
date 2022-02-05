object FormAlteracaoVeiculo: TFormAlteracaoVeiculo
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o de ve'#237'culo'
  ClientHeight = 375
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 82
    Width = 640
    Height = 235
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 640
    Height = 73
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -2
    ExplicitWidth = 837
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
      Width = 277
      Height = 26
      TabOrder = 1
      OnKeyPress = EditModeloKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 646
    Height = 55
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 408
    ExplicitWidth = 843
    object Button1: TButton
      AlignWithMargins = True
      Left = 472
      Top = 4
      Width = 170
      Height = 47
      Align = alRight
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 303
      ExplicitTop = 3
      ExplicitHeight = 46
    end
  end
  object qBuscaFipe: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from TBFIPE order by Marca, Modelo')
    Left = 171
    Top = 112
  end
  object QAltera: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 252
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = qBuscaFipe
    Left = 376
    Top = 224
  end
end
