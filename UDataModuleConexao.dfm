object DataModuleConexao: TDataModuleConexao
  OldCreateOrder = False
  Height = 615
  Width = 948
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'savautogestao'
    SpecificOptions.Strings = (
      'MySQL.ConnectionTimeout=60')
    Pooling = True
    Username = 'savauto'
    Server = '169.57.147.37'
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 16
    EncryptedPassword = '8CFF9EFF89FF9EFF8AFF8BFF90FF'
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 832
    Top = 136
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 72
    Top = 72
  end
  object QInsereExcelFIPE: TUniQuery
    Connection = UniConnection1
    Left = 64
    Top = 280
  end
  object QInsereAcelero: TUniQuery
    Connection = UniConnection1
    Left = 64
    Top = 336
  end
  object UniConnectionSavanna: TUniConnection
    ProviderName = 'SQL Server'
    Port = 1499
    Database = 'Savanna'
    Username = 'sa'
    Server = '169.57.147.37'
    Connected = True
    LoginPrompt = False
    Left = 816
    Top = 304
    EncryptedPassword = '9EFF91FFC7FFC7FFCAFFCBFFCFFFCFFFDEFF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 832
    Top = 80
  end
  object QueryBuscaCarSavanna: TUniQuery
    Connection = UniConnectionSavanna
    Left = 816
    Top = 360
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 832
    Top = 24
  end
  object qBuscaFipesRef: TUniQuery
    Connection = UniConnection1
    Left = 64
    Top = 448
  end
  object qBuscaRefFipe: TUniQuery
    Connection = UniConnection1
    Left = 64
    Top = 504
  end
  object qBuscaUsuarios: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tbusuarios')
    Left = 64
    Top = 392
    object qBuscaUsuariosID: TIntegerField
      FieldName = 'ID'
    end
    object qBuscaUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qBuscaUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object qBuscaUsuariosHOSTNAME: TStringField
      FieldName = 'HOSTNAME'
      Size = 50
    end
    object qBuscaUsuariosDT_LOGIN: TDateField
      FieldName = 'DT_LOGIN'
    end
    object qBuscaUsuariosID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
    end
    object qBuscaUsuariosNOME_PERFIL: TStringField
      FieldName = 'NOME_PERFIL'
      Size = 50
    end
    object qBuscaUsuariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object qBuscaUsuariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
    object qBuscaUsuariosNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
  end
  object qAtualizaChamado: TUniQuery
    Connection = UniConnection1
    Left = 272
    Top = 296
  end
end
