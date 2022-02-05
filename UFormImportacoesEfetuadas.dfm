object FormImportacoesEfetuadas: TFormImportacoesEfetuadas
  Left = 0
  Top = 0
  Caption = 'Importa'#231#245'es Efetuadas'
  ClientHeight = 314
  ClientWidth = 1084
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1084
    Height = 314
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PLANILHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_VEICULOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 80
        Visible = True
      end>
  end
  object QBuscaImportacoes: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      
        'select PLANILHA, DATAIMPORT as DATA, QTD_VEICULOS, FORNECEDOR, S' +
        'TATUS from TBIMPORTACOES order by DATAIMPORT desc')
    Active = True
    Left = 328
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = QBuscaImportacoes
    Left = 328
    Top = 160
  end
end
