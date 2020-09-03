object frmMonstro: TfrmMonstro
  Left = 0
  Top = 0
  Caption = 'Banco de Dados dos Inimigos'
  ClientHeight = 664
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 16
    Width = 191
    Height = 24
    Caption = 'Registro de Inimigos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object labSeach: TLabel
    Left = 548
    Top = 42
    Width = 114
    Height = 18
    Caption = 'Porcurar Inimigo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object labDesc: TLabel
    Left = 392
    Top = 94
    Width = 77
    Height = 19
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labListaInimigos: TLabel
    Left = 27
    Top = 343
    Width = 158
    Height = 24
    Caption = 'Lista de Inimigos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object labArma1: TLabel
    Left = 245
    Top = 213
    Width = 66
    Height = 13
    Caption = 'Primeira Arma'
  end
  object labArma2: TLabel
    Left = 408
    Top = 213
    Width = 70
    Height = 13
    Caption = 'Segunda Arma'
  end
  object labArma3: TLabel
    Left = 578
    Top = 213
    Width = 67
    Height = 13
    Caption = 'Terceira Arma'
  end
  object edtLevel: TLabeledEdit
    Left = 16
    Top = 120
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Level'
    TabOrder = 0
  end
  object edtDano: TLabeledEdit
    Left = 16
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Dano'
    TabOrder = 1
  end
  object edtCA: TLabeledEdit
    Left = 16
    Top = 232
    Width = 121
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = 'C.A'
    TabOrder = 2
  end
  object edtSeach: TEdit
    Left = 548
    Top = 66
    Width = 133
    Height = 21
    TabOrder = 3
  end
  object btnProcurar: TButton
    Left = 440
    Top = 63
    Width = 102
    Height = 25
    Caption = 'Procurar Especifico'
    TabOrder = 4
    OnClick = btnProcurarClick
  end
  object mmoDesc: TMemo
    Left = 216
    Top = 120
    Width = 465
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object edtNome: TLabeledEdit
    Left = 16
    Top = 65
    Width = 121
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 6
  end
  object btnCadastrar: TButton
    Left = 216
    Top = 46
    Width = 123
    Height = 42
    Caption = 'Cadastrar Novo Inimigo'
    TabOrder = 7
    OnClick = btnCadastrarClick
  end
  object dbg1: TDBGrid
    Left = 8
    Top = 381
    Width = 665
    Height = 199
    DataSource = dsListaInimigos
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtProcura2: TEdit
    Left = 218
    Top = 349
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object btnProcura2: TButton
    Left = 584
    Top = 344
    Width = 83
    Height = 31
    Caption = 'Monstrar Tudo'
    TabOrder = 10
    OnClick = btnProcura2Click
  end
  object btnListaInimigos: TButton
    Left = 366
    Top = 344
    Width = 105
    Height = 31
    Caption = 'Listar Inimigos'
    TabOrder = 11
    OnClick = btnListaInimigosClick
  end
  object btnDeletar: TButton
    Left = 304
    Top = 592
    Width = 121
    Height = 25
    Caption = 'Deletar Todos Inimigos'
    TabOrder = 12
    OnClick = btnDeletarClick
  end
  object edtIDProcura: TEdit
    Left = 16
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object edtRegistroArma1: TEdit
    Left = 216
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object edtRegistroArma2: TEdit
    Left = 382
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object edtRegistroArma3: TEdit
    Left = 552
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 16
  end
  object isqProcuraInimigo: TIBSQL
    Database = dtmInimigos.idbInimigos
    Transaction = dtmInimigos.itrInimigos
    Left = 368
    Top = 48
  end
  object tqrListaInimigos: TIBQuery
    Database = dtmInimigos.idbInimigos
    Transaction = dtmInimigos.itrInimigos
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 136
    Top = 600
  end
  object dsListaInimigos: TDataSource
    DataSet = tqrListaInimigos
    Left = 72
    Top = 600
  end
  object dsArmaRegistro: TDataSource
    DataSet = tqrArmaInimigo
    Left = 472
    Top = 8
  end
  object tqrArmaInimigo: TIBQuery
    Database = dtmInimigos.idbInimigos
    Transaction = dtmInimigos.itrInimigos
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 552
  end
end
