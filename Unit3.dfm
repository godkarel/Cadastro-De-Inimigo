object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 242
  ClientWidth = 692
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
    Left = 336
    Top = 8
    Width = 93
    Height = 30
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNomeCadastra: TLabeledEdit
    Left = 24
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object labLevelCadastra: TLabeledEdit
    Left = 24
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Level'
    TabOrder = 1
  end
  object labDanoCadastra: TLabeledEdit
    Left = 24
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Dano'
    TabOrder = 2
  end
  object labCACadastra: TLabeledEdit
    Left = 24
    Top = 192
    Width = 121
    Height = 21
    EditLabel.Width = 14
    EditLabel.Height = 13
    EditLabel.Caption = 'CA'
    TabOrder = 3
  end
  object mmoDescCadastra: TMemo
    Left = 208
    Top = 48
    Width = 361
    Height = 165
    TabOrder = 4
  end
  object btnCadastraDB: TButton
    Left = 592
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 5
  end
  object btnArmasCadastra: TButton
    Left = 592
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Armas'
    TabOrder = 6
  end
end
