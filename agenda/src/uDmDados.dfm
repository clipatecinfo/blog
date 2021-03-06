object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 325
  Width = 502
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 56
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 16
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenvolvimento\Samples\aulasClipatec\agenda\db\AGEN' +
        'DA.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'Server=localhost'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 256
    Top = 16
  end
  object fdqCidadePesq: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'select C.*'
      'from CIDADE C'
      'where (C.DESCRICAO like '#39'%'#39' || :DESCRICAO || '#39'%'#39')')
    Left = 40
    Top = 72
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object fdqCidadePesqID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqCidadePesqUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object fdqCidadePesqDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object fdqPessoaPesq: TFDQuery
    AfterOpen = fdqPessoaPesqAfterOpen
    AfterClose = fdqPessoaPesqAfterClose
    Connection = fdConexao
    SQL.Strings = (
      
        'select P.ID, (P.NOME || '#39' ('#39' || coalesce(P.APELIDO, '#39#39') || '#39')'#39') ' +
        'as NOME, (C.DESCRICAO || '#39'-'#39' || C.UF) as CIDADE'
      'from PESSOA P'
      'left join CIDADE C on (P.ID_CIDADE = C.ID)')
    Left = 128
    Top = 72
    object fdqPessoaPesqID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqPessoaPesqNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 183
    end
    object fdqPessoaPesqCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 103
    end
  end
  object fdqPessoaCad: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'select P.*,'
      '       (C.DESCRICAO || '#39'-'#39' || C.UF) as CIDADE'
      'from PESSOA P'
      'left join CIDADE C on (P.ID_CIDADE = C.ID)'
      'where (P.ID = :ID)')
    Left = 216
    Top = 72
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqPessoaCadID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqPessoaCadID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
    end
    object fdqPessoaCadNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object fdqPessoaCadAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 80
    end
    object fdqPessoaCadOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object fdqPessoaCadCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 103
    end
  end
  object fdqPessoaContatoCad: TFDQuery
    IndexFieldNames = 'ID_PESSOA'
    MasterSource = dsPessoa
    MasterFields = 'ID'
    DetailFields = 'ID_PESSOA'
    Connection = fdConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select C.*'
      'from PESSOA_CONTATO C'
      'where (C.ID_PESSOA = :ID_PESSOA)')
    Left = 216
    Top = 184
    ParamData = <
      item
        Name = 'ID_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqPessoaContatoCadID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqPessoaContatoCadID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      Required = True
    end
    object fdqPessoaContatoCadDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object fdqPessoaContatoCadCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Required = True
      Size = 100
    end
  end
  object dsPessoa: TDataSource
    DataSet = fdqPessoaCad
    Left = 216
    Top = 128
  end
end
