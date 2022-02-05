object FormUltimasAtualizacoes: TFormUltimasAtualizacoes
  Left = 0
  Top = 0
  Caption = 'Ultimas Atualiza'#231#245'es'
  ClientHeight = 494
  ClientWidth = 868
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Lucida Console'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 868
    Height = 97
    Align = alTop
    Color = 3947775
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 32
      Width = 520
      Height = 32
      Caption = 'Notas de ajustes e vers'#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'Lucida Console'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 868
    Height = 78
    Align = alBottom
    Color = 3947775
    ParentBackground = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 310
    Height = 313
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Lucida Console'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 319
    Top = 100
    Width = 546
    Height = 313
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
    ExplicitLeft = 312
    ExplicitWidth = 553
  end
  object WindowsStore1: TWindowsStore
    Left = 464
    Top = 304
  end
  object XPManifest1: TXPManifest
    Left = 552
    Top = 256
  end
  object QBuscaVersao: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 432
    Top = 256
  end
  object QBuscaNotas: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 288
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = QBuscaVersao
    Left = 240
    Top = 168
  end
end
