object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 273
  ClientWidth = 635
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
    Left = 152
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 227
    Top = 135
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 152
    Top = 112
    Width = 150
    Height = 17
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 368
    Top = 56
    Width = 225
    Height = 153
    TabOrder = 2
  end
  object Button1: TButton
    Left = 227
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
