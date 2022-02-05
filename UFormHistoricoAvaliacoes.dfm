object FormHistoricoAvaliacoes: TFormHistoricoAvaliacoes
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico Avalia'#231#245'es'
  ClientHeight = 447
  ClientWidth = 390
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 390
    Height = 63
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 562
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 384
    Height = 378
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'placa'
        Title.Alignment = taCenter
        Title.Caption = 'PLACA'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_avaliacao'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = qBuscaHistoricoAval
    Left = 120
    Top = 240
  end
  object qBuscaHistoricoAval: TUniQuery
    Connection = DataModuleBancoVistoria.UniConnection1
    SQL.Strings = (
      'select placa, data_avaliacao from tbavaliacoes'
      'order by data_avaliacao desc')
    Active = True
    Left = 136
    Top = 168
  end
end
