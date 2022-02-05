object FormHistFIPE: TFormHistFIPE
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de FIPE'
  ClientHeight = 510
  ClientWidth = 849
  Color = clBtnFace
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
    Left = 0
    Top = 349
    Width = 849
    Height = 161
    Align = alBottom
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 6
      Width = 62
      Height = 18
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 32
      Top = 62
      Width = 148
      Height = 18
      Caption = 'Descri'#231#227'o Modelo FIPE'
    end
    object Label3: TLabel
      Left = 639
      Top = 62
      Width = 67
      Height = 18
      Caption = 'Valor FIPE'
    end
    object EditDescBanco: TEdit
      Left = 32
      Top = 30
      Width = 601
      Height = 26
      TabOrder = 0
    end
    object EditDescModeloFIPE: TEdit
      Left = 32
      Top = 86
      Width = 601
      Height = 26
      TabOrder = 1
    end
    object EditVLRfipe: TEdit
      Left = 639
      Top = 86
      Width = 121
      Height = 26
      TabOrder = 2
    end
    object BtnAtualizar: TButton
      Left = 639
      Top = 118
      Width = 202
      Height = 35
      Caption = 'Atualizar'
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 849
    Height = 268
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 81
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 40
      Top = 16
      Width = 126
      Height = 18
      Caption = 'Pesquisar descri'#231#227'o'
    end
    object EditPesqDesc: TEdit
      Left = 40
      Top = 40
      Width = 593
      Height = 26
      TabOrder = 0
      OnKeyPress = EditPesqDescKeyPress
    end
  end
  object DataSource1: TDataSource
    DataSet = QBuscaFIPES
    Left = 272
    Top = 216
  end
  object QBuscaFIPES: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 368
    Top = 216
  end
end
