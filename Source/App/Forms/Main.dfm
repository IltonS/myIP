object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'What'#39's my IP'
  ClientHeight = 427
  ClientWidth = 794
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
      object LblPublicIPv4: TLabel
        Left = 268
        Top = 42
        Width = 45
        Height = 15
        Alignment = taRightJustify
        Caption = '127.0.0.1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu
      end
      object Label2: TLabel
        Left = 17
        Top = 42
        Width = 61
        Height = 15
        Caption = 'Public IPv4:'
      end
      object Label3: TLabel
        Left = 17
        Top = 64
        Width = 61
        Height = 15
        Caption = 'Public IPv6:'
      end
      object LblPublicIPv6: TLabel
        Left = 301
        Top = 64
        Width = 12
        Height = 15
        Alignment = taRightJustify
        Caption = '::1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu
      end
      object Label4: TLabel
        Left = 8
        Top = 93
        Width = 38
        Height = 15
        Caption = 'Details:'
      end
      object Panel1: TPanel
        Left = 132
        Top = 21
        Width = 181
        Height = 1
        TabOrder = 0
      end
      object BtnRefresh: TButton
        Left = 234
        Top = 306
        Width = 75
        Height = 25
        Action = ActRefresh
        TabOrder = 1
      end
      object DbgDetails: TDBGrid
        Left = 17
        Top = 121
        Width = 292
        Height = 174
        DataSource = DsDetails
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object Panel3: TPanel
        Left = 53
        Top = 102
        Width = 256
        Height = 1
        TabOrder = 3
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
    Interval = 500
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
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 544
    Top = 122
  end
  object ActionList: TActionList
    Left = 687
    Top = 54
    object ActRefresh: TAction
      Caption = '&Refresh'
      Enabled = False
      ShortCut = 116
      OnExecute = ActRefreshExecute
    end
    object ActForceRefresh: TAction
      Caption = 'ActForceRefresh'
      ShortCut = 16500
      OnExecute = ActForceRefreshExecute
    end
  end
  object CdsDetails: TClientDataSet
    PersistDataPacket.Data = {
      510000009619E0BD01000000180000000200000000000300000051000850726F
      706572747901004900000001000557494454480200020014000556616C756501
      004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Property'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Value'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 407
    Top = 189
    object CdsDetailsProperty: TStringField
      FieldName = 'Property'
    end
    object CdsDetailsValue: TStringField
      FieldName = 'Value'
    end
  end
  object DsDetails: TDataSource
    DataSet = CdsDetails
    Left = 545
    Top = 189
  end
end
