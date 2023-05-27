object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'What'#39's my IP'
  ClientHeight = 438
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object PageControl: TPageControl
    Left = 8
    Top = 16
    Width = 340
    Height = 369
    ActivePage = TsGeral
    TabOrder = 1
    object TsGeral: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 116
        Height = 15
        Caption = 'Your public IP address'
      end
      object LblIP: TLabel
        Left = 8
        Top = 42
        Width = 305
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = '127.0.0.1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu
      end
      object Panel1: TPanel
        Left = 134
        Top = 21
        Width = 179
        Height = 1
        TabOrder = 0
      end
      object BtnRefresh: TButton
        Left = 238
        Top = 91
        Width = 75
        Height = 25
        Caption = '&Refresh'
        TabOrder = 1
        OnClick = BtnRefreshClick
      end
    end
  end
  object BtnClose: TButton
    Left = 273
    Top = 400
    Width = 75
    Height = 25
    Caption = 'C&lose'
    TabOrder = 0
    OnClick = BtnCloseClick
  end
  object PopupMenu: TPopupMenu
    Left = 29
    Top = 369
    object BtnCopy: TMenuItem
      Caption = '&Copy'
      OnClick = BtnCopyClick
    end
  end
  object Tmr1stRefresh: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Tmr1stRefreshTimer
    Left = 118
    Top = 369
  end
end
