object FormAvarias: TFormAvarias
  Left = 0
  Top = 0
  Caption = 'Avarias'
  ClientHeight = 473
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 74
    Width = 769
    Height = 325
    Align = alClient
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
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'placa'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_reparo'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_reparo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_reparo'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 405
    Width = 769
    Height = 65
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 124
      Height = 18
      Caption = 'Categortia Avaliada'
    end
    object Label2: TLabel
      Left = 248
      Top = 24
      Width = 78
      Height = 18
      Caption = 'Total Avaria'
    end
    object EditCategoria: TEdit
      Left = 154
      Top = 24
      Width = 79
      Height = 26
      TabOrder = 0
    end
    object EditTotalAvaria: TEdit
      Left = 332
      Top = 24
      Width = 121
      Height = 26
      TabOrder = 1
      Text = '0,00'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 769
    Height = 65
    Align = alTop
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = qBuscaAvarias
    Left = 384
    Top = 272
  end
  object qBuscaAvarias: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    Left = 416
    Top = 176
  end
end
