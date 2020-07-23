object dtmInimigos: TdtmInimigos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 318
  Width = 455
  object idbInimigos: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:D:\SD\Cadastro de Inimigo\DB\TESTE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=UTF8')
    LoginPrompt = False
    DefaultTransaction = itrInimigos
    ServerType = 'IBServer'
    Left = 336
    Top = 128
  end
  object itrInimigos: TIBTransaction
    Active = True
    DefaultDatabase = idbInimigos
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 128
  end
  object isqAux: TIBSQL
    Database = idbInimigos
    Transaction = itrInimigos
    Left = 304
    Top = 200
  end
end
