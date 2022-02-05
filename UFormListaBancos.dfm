object FormListaBancos: TFormListaBancos
  Left = 0
  Top = 0
  Caption = 'Lista de Bancos Dispon'#237'veis'
  ClientHeight = 584
  ClientWidth = 523
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 523
    Height = 480
    Align = alClient
    DataSource = DSbancos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'banco'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 523
    Height = 104
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 152
      Top = 24
      Width = 34
      Height = 16
      Caption = 'Banco'
    end
    object EditCodBanco: TEdit
      Left = 77
      Top = 24
      Width = 69
      Height = 24
      TabOrder = 0
    end
    object EditBanco: TEdit
      Left = 192
      Top = 24
      Width = 297
      Height = 24
      TabOrder = 1
    end
    object btnSalvar: TButton
      Left = 440
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
  end
  object DSbancos: TDataSource
    DataSet = qBuscaBancos
    Left = 352
    Top = 304
  end
  object qBuscaBancos: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbbancos order by banco')
    Active = True
    Left = 432
    Top = 304
  end
end
