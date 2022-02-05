object FormPadroesPlanilhas: TFormPadroesPlanilhas
  Left = 0
  Top = 0
  ClientHeight = 502
  ClientWidth = 957
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    AlignWithMargins = True
    Left = 323
    Top = 3
    Width = 631
    Height = 426
    Align = alClient
    Center = True
    Proportional = True
    Transparent = True
    ExplicitLeft = 447
    ExplicitTop = 0
    ExplicitWidth = 507
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 957
    Height = 70
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 320
    Height = 432
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
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
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imagem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'data'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Visible = False
      end>
  end
  object IdFTP1: TIdFTP
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 528
    Top = 128
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 528
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = qBuscaFotos
    Left = 144
    Top = 296
  end
  object qBuscaFotos: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbPadroesImportacoes')
    Active = True
    Left = 240
    Top = 296
    object qBuscaFotosid: TIntegerField
      FieldName = 'id'
    end
    object qBuscaFotosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qBuscaFotosimagem: TBlobField
      FieldName = 'imagem'
    end
    object qBuscaFotosdata: TDateTimeField
      FieldName = 'data'
    end
    object qBuscaFotosusuario: TStringField
      FieldName = 'usuario'
      Size = 50
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 144
    Top = 448
  end
  object qInsereFoto: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    Left = 232
    Top = 360
  end
end
