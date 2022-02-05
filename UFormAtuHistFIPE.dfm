object FormAtualizaHistoricoFIPE: TFormAtualizaHistoricoFIPE
  Left = 0
  Top = 0
  Caption = 'Atualiza Historico FIPE'
  ClientHeight = 534
  ClientWidth = 822
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 137
    Align = alTop
    TabOrder = 0
    object LblModeloBanco: TLabel
      Left = 116
      Top = 16
      Width = 91
      Height = 16
      Caption = 'LblModeloBanco'
    end
    object LblModeloFIPE: TLabel
      Left = 97
      Top = 56
      Width = 82
      Height = 16
      Caption = 'LblModeloFIPE'
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 94
      Height = 16
      Caption = 'Modelo Planilha:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 75
      Height = 16
      Caption = 'Modelo FIPE:'
    end
    object Label3: TLabel
      Left = 1
      Top = 107
      Width = 820
      Height = 29
      Align = alBottom
      Alignment = taCenter
      Caption = 'TABELA FIPE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 156
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 424
    Width = 822
    Height = 110
    Align = alBottom
    TabOrder = 1
    object Label4: TLabel
      Left = 40
      Top = 6
      Width = 137
      Height = 16
      Caption = 'Pesquisa descri'#231#227'o FIPE'
    end
    object EditPesqDescFIPE: TEdit
      Left = 40
      Top = 24
      Width = 729
      Height = 24
      TabOrder = 0
      OnKeyPress = EditPesqDescFIPEKeyPress
    end
    object Button1: TButton
      Left = 248
      Top = 56
      Width = 353
      Height = 41
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 137
    Width = 822
    Height = 287
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = QBuscaAutoFIPE
    Left = 96
    Top = 264
  end
  object QBuscaAutoFIPE: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 328
    Top = 312
  end
  object QAtualizaFipe: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 640
    Top = 472
  end
end
