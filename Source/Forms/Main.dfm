object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'What'#39's my IP'
  ClientHeight = 428
  ClientWidth = 798
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
  object Panel2: TPanel
    Left = 368
    Top = 40
    Width = 409
    Height = 345
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
  object PopupMenu: TPopupMenu
    Left = 405
    Top = 57
    object BtnCopy: TMenuItem
      Caption = '&Copy'
      OnClick = BtnCopyClick
    end
  end
  object Tmr1stRefresh: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Tmr1stRefreshTimer
    Left = 542
    Top = 54
  end
  object IdHTTP: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 406
    Top = 122
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 544
    Top = 122
  end
end
