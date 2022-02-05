object FormAjusteDadosFipeAvaliacao: TFormAjusteDadosFipeAvaliacao
  Left = 0
  Top = 0
  Caption = 'Ajuste de Dados Fipe'
  ClientHeight = 499
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 925
    Height = 121
    Align = alTop
    Caption = 'Dados do Ve'#237'culo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 69
      Top = 43
      Width = 29
      Height = 19
      Caption = 'Ano'
    end
    object Label2: TLabel
      Left = 271
      Top = 43
      Width = 51
      Height = 19
      Caption = 'Modelo'
    end
    object Label3: TLabel
      Left = 36
      Top = 76
      Width = 62
      Height = 19
      Caption = 'Cod.Fipe'
    end
    object Label4: TLabel
      Left = 263
      Top = 76
      Width = 59
      Height = 19
      Caption = 'Vlr Fipe.'
    end
    object EditAno: TEdit
      Left = 104
      Top = 40
      Width = 121
      Height = 27
      TabOrder = 0
      Text = 'EditAno'
    end
    object EditModelo: TEdit
      Left = 336
      Top = 40
      Width = 537
      Height = 27
      TabOrder = 1
      Text = 'EditAno'
    end
    object EditCodFipe: TEdit
      Left = 104
      Top = 73
      Width = 121
      Height = 27
      TabOrder = 2
      Text = 'EditAno'
    end
    object EditVlrFipe: TEdit
      Left = 336
      Top = 73
      Width = 121
      Height = 27
      TabOrder = 3
      Text = 'EditAno'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 121
    Width = 925
    Height = 41
    Align = alTop
    Caption = 'Selecione os novos dados da Fipe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 376
    ExplicitTop = 248
    ExplicitWidth = 185
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 162
    Width = 925
    Height = 270
    Align = alClient
    Caption = 'Pesquisa de nova Fipe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 296
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 105
    object Panel3: TPanel
      Left = 2
      Top = 21
      Width = 921
      Height = 44
      Align = alTop
      TabOrder = 0
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 107
        Height = 19
        Caption = 'Referencia Fipe'
      end
      object Label6: TLabel
        Left = 295
        Top = 8
        Width = 29
        Height = 19
        Caption = 'Ano'
      end
      object Label7: TLabel
        Left = 457
        Top = 8
        Width = 51
        Height = 19
        Caption = 'Modelo'
      end
      object ComboBoxRefFipe: TComboBox
        Left = 129
        Top = 8
        Width = 160
        Height = 27
        TabOrder = 0
        Text = 'ComboBoxRefFipe'
      end
      object EditNovoAno: TEdit
        Left = 330
        Top = 8
        Width = 121
        Height = 27
        TabOrder = 1
        Text = 'EditNovoAno'
      end
      object EditNovoModelo: TEdit
        Left = 514
        Top = 8
        Width = 367
        Height = 27
        TabOrder = 2
        Text = 'EditNovoAno'
        OnKeyPress = EditNovoModeloKeyPress
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 65
      Width = 921
      Height = 203
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 925
    Height = 67
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = qBuscaFipe
    Left = 296
    Top = 306
  end
  object qBuscaFipe: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 416
    Top = 314
  end
  object qBuscaRefFipe: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 144
    Top = 314
  end
  object qAtualiza: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 552
    Top = 314
  end
end
