object DataModuleBancoVistoria: TDataModuleBancoVistoria
  OldCreateOrder = False
  Height = 489
  Width = 765
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'dbsavautomobile'
    Username = 'savauto'
    Server = '169.57.147.37'
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 88
    EncryptedPassword = '8CFF9EFF89FF9EFF8AFF8BFF90FF'
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 96
    Top = 168
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 88
    Top = 264
  end
  object qConsultaPlaca: TUniQuery
    Connection = UniConnection1
    Left = 656
    Top = 192
  end
  object qConsultaFotos: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tbfotosvistoria where placa = '#39'CFZ4254'#39)
    Left = 656
    Top = 256
    object qConsultaFotosid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qConsultaFotosplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qConsultaFotosFoto: TBlobField
      FieldName = 'Foto'
    end
    object qConsultaFotosid_vistoria: TIntegerField
      FieldName = 'id_vistoria'
    end
  end
  object qBuscaAvaliacoes: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'Select id, data_avaliacao, placa, ano, modelo, nome_cliente,'
      'telefone, tipo, portas, km, cor, opcionais, total_avarias,'
      
        'avaliacao, vlr_fipe, cod_fipe, usuario, obs, categoria, ipva  Fr' +
        'om tbavaliacoes'
      'order by data_avaliacao  desc')
    Active = True
    Left = 658
    Top = 62
    object qBuscaAvaliacoesdata_avaliacao: TDateTimeField
      FieldName = 'data_avaliacao'
    end
    object qBuscaAvaliacoesplaca: TStringField
      FieldName = 'placa'
    end
    object qBuscaAvaliacoesano: TStringField
      FieldName = 'ano'
      Size = 4
    end
    object qBuscaAvaliacoesmodelo: TStringField
      FieldName = 'modelo'
      Size = 200
    end
    object qBuscaAvaliacoesnome_cliente: TStringField
      FieldName = 'nome_cliente'
      Size = 200
    end
    object qBuscaAvaliacoestelefone: TStringField
      FieldName = 'telefone'
    end
    object qBuscaAvaliacoestipo: TStringField
      FieldName = 'tipo'
    end
    object qBuscaAvaliacoesportas: TStringField
      FieldName = 'portas'
      Size = 1
    end
    object qBuscaAvaliacoeskm: TFloatField
      FieldName = 'km'
    end
    object qBuscaAvaliacoescor: TStringField
      FieldName = 'cor'
    end
    object qBuscaAvaliacoesopcionais: TStringField
      FieldName = 'opcionais'
    end
    object qBuscaAvaliacoestotal_avarias: TFloatField
      FieldName = 'total_avarias'
      currency = True
    end
    object qBuscaAvaliacoesavaliacao: TFloatField
      FieldName = 'avaliacao'
      currency = True
    end
    object qBuscaAvaliacoesvlr_fipe: TFloatField
      FieldName = 'vlr_fipe'
      currency = True
    end
    object qBuscaAvaliacoescod_fipe: TStringField
      FieldName = 'cod_fipe'
    end
    object qBuscaAvaliacoesusuario: TStringField
      FieldName = 'usuario'
    end
    object qBuscaAvaliacoesobs: TStringField
      FieldName = 'obs'
      Size = 1000
    end
    object qBuscaAvaliacoesid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qBuscaAvaliacoescategoria: TStringField
      FieldName = 'categoria'
      Size = 1
    end
    object qBuscaAvaliacoesipva: TStringField
      FieldName = 'ipva'
      Size = 3
    end
  end
  object QEnviaVistoria: TUniQuery
    Connection = UniConnection1
    Left = 656
    Top = 128
  end
  object QBuscaVistoriadores: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select nome from tbusuarios order by nome')
    Left = 656
    Top = 312
  end
  object qBuscaUsuarios: TUniQuery
    UpdatingTable = 'tbusuarios'
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tbusuarios')
    Options.UpdateAllFields = True
    Active = True
    Left = 432
    Top = 248
    object qBuscaUsuariosid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qBuscaUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qBuscaUsuariossenha: TStringField
      FieldName = 'senha'
      Size = 30
    end
    object qBuscaUsuariosnivel: TStringField
      FieldName = 'nivel'
      Size = 10
    end
    object qBuscaUsuariostroca: TIntegerField
      FieldName = 'troca'
    end
    object qBuscaUsuariosperfil: TIntegerField
      FieldName = 'perfil'
    end
    object qBuscaUsuariosemail: TStringField
      FieldName = 'email'
      Size = 80
    end
    object qBuscaUsuarioslogado: TIntegerField
      FieldName = 'logado'
    end
    object qBuscaUsuariosMEI: TStringField
      FieldName = 'MEI'
      Size = 50
    end
    object qBuscaUsuariosfoto: TBlobField
      FieldName = 'foto'
    end
    object qBuscaUsuariosversao_app: TStringField
      FieldName = 'versao_app'
      Size = 250
    end
    object qBuscaUsuarioscheck_versao: TStringField
      FieldName = 'check_versao'
      Size = 1
    end
  end
  object qCadaNovoUsuario: TUniQuery
    Connection = UniConnection1
    Left = 432
    Top = 312
  end
  object qAjustaUsuarios: TUniQuery
    Connection = UniConnection1
    Left = 440
    Top = 376
  end
  object qValidaUsuario: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tbusuarios')
    Active = True
    Left = 432
    Top = 184
    object qValidaUsuarioid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qValidaUsuarionome: TStringField
      FieldName = 'nome'
      Size = 30
    end
    object qValidaUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 30
    end
    object qValidaUsuarionivel: TStringField
      FieldName = 'nivel'
      Size = 10
    end
    object qValidaUsuariotroca: TIntegerField
      FieldName = 'troca'
    end
    object qValidaUsuarioperfil: TIntegerField
      FieldName = 'perfil'
    end
    object qValidaUsuarioemail: TStringField
      FieldName = 'email'
      Size = 80
    end
    object qValidaUsuariologado: TIntegerField
      FieldName = 'logado'
    end
    object qValidaUsuarioMEI: TStringField
      FieldName = 'MEI'
      Size = 50
    end
    object qValidaUsuariofoto: TBlobField
      FieldName = 'foto'
    end
    object qValidaUsuarioversao_app: TStringField
      FieldName = 'versao_app'
      Size = 250
    end
    object qValidaUsuariocheck_versao: TStringField
      FieldName = 'check_versao'
      Size = 1
    end
  end
  object qAlteraUsuarios: TUniQuery
    Connection = UniConnection1
    Left = 440
    Top = 128
  end
  object qVerificaAvaliacoes: TUniQuery
    Connection = UniConnection1
    Left = 232
    Top = 96
  end
  object qConsultaFotosAvaliacao: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from tbfotosavaliacoes')
    Left = 536
    Top = 88
    object qConsultaFotosAvaliacaoplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qConsultaFotosAvaliacaoFoto: TBlobField
      FieldName = 'Foto'
    end
    object qConsultaFotosAvaliacaoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qConsultaFotosAvaliacaoid_avaliacao: TIntegerField
      FieldName = 'id_avaliacao'
    end
  end
end
