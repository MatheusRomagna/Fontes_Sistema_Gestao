object FormHistoricoObsAtn: TFormHistoricoObsAtn
  Left = 0
  Top = 0
  Caption = 'Historico de Obs'
  ClientHeight = 375
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 421
    Height = 55
    Align = alBottom
    TabOrder = 0
    object btnCriar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 109
      Height = 47
      Align = alLeft
      Caption = 'Criar'
      TabOrder = 0
      OnClick = btnCriarClick
    end
  end
  object MemoObs: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 415
    Height = 199
    Align = alClient
    Enabled = False
    Lines.Strings = (
      'TESTE')
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 208
    Width = 415
    Height = 109
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_atendimento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obs'
        Visible = False
      end>
  end
  object DataSource1: TDataSource
    DataSet = qBuscaAtendimento
    Left = 312
    Top = 248
  end
  object qBuscaAtendimento: TUniQuery
    Connection = DataModuleConexao.UniConnection1
    SQL.Strings = (
      'select * from tbatendimento_obs'
      'order by id desc')
    Active = True
    Left = 80
    Top = 88
    object qBuscaAtendimentoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qBuscaAtendimentoid_atendimento: TIntegerField
      FieldName = 'id_atendimento'
    end
    object qBuscaAtendimentousuario: TStringField
      FieldName = 'usuario'
      Size = 50
    end
    object qBuscaAtendimentodata: TDateTimeField
      FieldName = 'data'
    end
    object qBuscaAtendimentoobs: TStringField
      FieldName = 'obs'
      Size = 1000
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = qBuscaAtendimento
    ScopeMappings = <>
    Left = 104
    Top = 160
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 172
    Top = 101
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'obs'
      Control = MemoObs
      Track = False
    end
  end
end
