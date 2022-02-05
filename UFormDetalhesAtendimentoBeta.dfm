object FormDetalhesAtendimentoBeta: TFormDetalhesAtendimentoBeta
  Left = 0
  Top = 0
  Caption = 'Detalhes Atendimento'
  ClientHeight = 499
  ClientWidth = 702
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 696
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 40
      Height = 20
      Caption = 'Placa:'
    end
    object Label2: TLabel
      Left = 184
      Top = 24
      Width = 52
      Height = 20
      Caption = 'Modelo:'
    end
    object Label3: TLabel
      Left = 568
      Top = 24
      Width = 31
      Height = 20
      Caption = 'Ano:'
    end
    object Label4: TLabel
      Left = 20
      Top = 64
      Width = 52
      Height = 20
      Caption = 'Cliente:'
    end
    object Label5: TLabel
      Left = 208
      Top = 64
      Width = 62
      Height = 20
      Caption = 'Telefone:'
    end
    object Label11: TLabel
      Left = 487
      Top = 64
      Width = 34
      Height = 20
      Caption = 'Fipe:'
    end
    object EditPlaca: TEdit
      Left = 78
      Top = 21
      Width = 100
      Height = 28
      Enabled = False
      TabOrder = 0
    end
    object EditModelo: TEdit
      Left = 242
      Top = 21
      Width = 320
      Height = 28
      Enabled = False
      TabOrder = 1
    end
    object EditAno: TEdit
      Left = 605
      Top = 21
      Width = 76
      Height = 28
      Enabled = False
      TabOrder = 2
    end
    object EditCliente: TEdit
      Left = 78
      Top = 61
      Width = 124
      Height = 28
      Enabled = False
      TabOrder = 3
    end
    object EditTelefone: TEdit
      Left = 276
      Top = 61
      Width = 205
      Height = 28
      Enabled = False
      TabOrder = 4
    end
    object EditVlrFipe: TEdit
      Left = 527
      Top = 61
      Width = 154
      Height = 28
      Alignment = taCenter
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 106
    Width = 696
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 1
    object Label6: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 474
      Height = 66
      Margins.Left = 15
      Align = alClient
      Alignment = taCenter
      Caption = 'Aguardando Documentos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 314
      ExplicitHeight = 35
    end
    object PanelAgDocumento: TPanel
      AlignWithMargins = True
      Left = 495
      Top = 3
      Width = 198
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      Color = 9934847
      ParentBackground = False
      TabOrder = 0
      OnMouseEnter = PanelAgDocumentoMouseEnter
      OnMouseLeave = PanelAgDocumentoMouseLeave
      object imgAgDocumentos: TImage
        AlignWithMargins = True
        Left = 50
        Top = 3
        Width = 98
        Height = 60
        Margins.Left = 50
        Margins.Right = 50
        Align = alClient
        Center = True
        ExplicitLeft = 0
        ExplicitTop = 1
        ExplicitWidth = 197
        ExplicitHeight = 64
      end
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 184
    Width = 696
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 2
    object Label7: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 474
      Height = 66
      Margins.Left = 15
      Align = alClient
      Alignment = taCenter
      Caption = 'Aguardando Agendamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 333
      ExplicitHeight = 35
    end
    object PanelAgAgendamento: TPanel
      AlignWithMargins = True
      Left = 495
      Top = 3
      Width = 198
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      Color = 9934847
      ParentBackground = False
      TabOrder = 0
      object ImgAgAgendamento: TImage
        AlignWithMargins = True
        Left = 50
        Top = 3
        Width = 98
        Height = 60
        Margins.Left = 50
        Margins.Right = 50
        Align = alClient
        Center = True
        ExplicitLeft = 0
        ExplicitTop = 1
        ExplicitWidth = 197
        ExplicitHeight = 64
      end
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 262
    Width = 696
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 3
    object Label8: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 474
      Height = 66
      Margins.Left = 15
      Align = alClient
      Alignment = taCenter
      Caption = 'Aguardando Verifica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 300
      ExplicitHeight = 35
    end
    object PanelAgVerificacao: TPanel
      AlignWithMargins = True
      Left = 495
      Top = 3
      Width = 198
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      Color = 9934847
      ParentBackground = False
      TabOrder = 0
      object ImgAgVerificacao: TImage
        AlignWithMargins = True
        Left = 50
        Top = 3
        Width = 98
        Height = 60
        Margins.Left = 50
        Margins.Right = 50
        Align = alClient
        Center = True
        ExplicitLeft = 0
        ExplicitTop = 1
        ExplicitWidth = 197
        ExplicitHeight = 64
      end
    end
  end
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 340
    Width = 696
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 4
    object Label9: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 474
      Height = 66
      Margins.Left = 15
      Align = alClient
      Alignment = taCenter
      Caption = 'Aguardando Pagamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 297
      ExplicitHeight = 35
    end
    object PanelAgPagamento: TPanel
      AlignWithMargins = True
      Left = 495
      Top = 3
      Width = 198
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      Color = 9934847
      ParentBackground = False
      TabOrder = 0
      object ImgAgPagamento: TImage
        AlignWithMargins = True
        Left = 50
        Top = 3
        Width = 98
        Height = 60
        Margins.Left = 50
        Margins.Right = 50
        Align = alClient
        Center = True
        ExplicitLeft = 0
        ExplicitTop = 1
        ExplicitWidth = 197
        ExplicitHeight = 64
      end
    end
  end
  object Panel10: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 418
    Width = 696
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 5
    object Label10: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Width = 474
      Height = 66
      Margins.Left = 15
      Align = alClient
      Alignment = taCenter
      Caption = 'Atendimento Cancelado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 304
      ExplicitHeight = 35
    end
    object PanelCancelado: TPanel
      AlignWithMargins = True
      Left = 495
      Top = 3
      Width = 198
      Height = 66
      Align = alRight
      BevelOuter = bvNone
      Color = 9934847
      ParentBackground = False
      TabOrder = 0
      object ImgCancelado: TImage
        AlignWithMargins = True
        Left = 50
        Top = 3
        Width = 98
        Height = 60
        Margins.Left = 50
        Margins.Right = 50
        Align = alClient
        Center = True
        ExplicitLeft = 0
        ExplicitTop = 1
        ExplicitWidth = 197
        ExplicitHeight = 64
      end
    end
  end
end
