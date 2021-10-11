object Form1: TForm1
  Left = 235
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Creation table Paradox'
  ClientHeight = 425
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object SBQuitter: TSpeedButton
    Left = 608
    Top = 384
    Width = 145
    Height = 33
    Caption = '&Exit'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBQuitterClick
  end
  object LabelPhoto: TLabel
    Left = 576
    Top = 8
    Width = 48
    Height = 18
    Caption = 'Photo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 576
    Top = 192
    Width = 89
    Height = 18
    Caption = 'Remarques:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 88
    Width = 561
    Height = 289
    DataSource = DS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator: TDBNavigator
    Left = 8
    Top = 384
    Width = 590
    Height = 33
    Flat = True
    TabOrder = 1
  end
  object PlFiche: TPanel
    Left = 8
    Top = 8
    Width = 561
    Height = 73
    BorderStyle = bsSingle
    TabOrder = 2
    object LabelNom: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 18
      Caption = 'Nom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPrenom: TLabel
      Left = 160
      Top = 8
      Width = 57
      Height = 18
      Caption = 'Prenom'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelAge: TLabel
      Left = 472
      Top = 8
      Width = 28
      Height = 18
      Caption = 'Age'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelDate: TLabel
      Left = 320
      Top = 8
      Width = 135
      Height = 18
      Caption = 'Date de naissance'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBENom: TDBEdit
      Left = 8
      Top = 32
      Width = 145
      Height = 25
      TabOrder = 0
    end
    object DBEPrenom: TDBEdit
      Left = 160
      Top = 32
      Width = 153
      Height = 25
      TabOrder = 1
    end
    object DBEAge: TDBEdit
      Left = 472
      Top = 32
      Width = 73
      Height = 25
      TabOrder = 3
    end
    object DBEDate: TDBEdit
      Left = 320
      Top = 32
      Width = 145
      Height = 25
      TabOrder = 2
    end
  end
  object DBImage: TDBImage
    Left = 576
    Top = 32
    Width = 177
    Height = 154
    TabOrder = 3
    OnDblClick = DBImageDblClick
  end
  object DBMemo: TDBMemo
    Left = 576
    Top = 216
    Width = 177
    Height = 161
    TabOrder = 4
  end
  object DS: TDataSource
    Left = 96
    Top = 104
  end
  object OPD: TOpenPictureDialog
    Left = 128
    Top = 104
  end
end
