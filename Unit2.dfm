object frmMonstro: TfrmMonstro
  Left = 0
  Top = 0
  Caption = 'Banco de Dados dos Inimigos'
  ClientHeight = 277
  ClientWidth = 714
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
    Left = 248
    Top = 8
    Width = 205
    Height = 24
    Caption = 'Cadastro de Inimigo'
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
    Width = 133
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
    Width = 87
    Height = 20
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
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
    Left = 467
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Procurar'
    TabOrder = 4
    OnClick = btnProcurarClick
  end
  object mmoDesc: TMemo
    Left = 216
    Top = 120
    Width = 465
    Height = 133
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edtNome: TEdit
    Left = 16
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'edtNome'
  end
  object isqProcuraInimigo: TIBSQL
    Database = dtmInimigos.idbInimigos
    Transaction = dtmInimigos.itrInimigos
    Left = 352
    Top = 56
  end
end
