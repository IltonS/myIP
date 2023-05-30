//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdHTTP.hpp>
#include <IdTCPClient.hpp>
#include <IdTCPConnection.hpp>
#include <IdIPWatch.hpp>
#include <IdIOHandler.hpp>
#include <IdIOHandlerSocket.hpp>
#include <IdIOHandlerStack.hpp>
#include <IdSSL.hpp>
#include <IdSSLOpenSSL.hpp>
#include <Vcl.Menus.hpp>
#include <Clipbrd.hpp>
#include "IPUtils.h"
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
//---------------------------------------------------------------------------
class TFrmMain : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControl;
	TTabSheet *TsGeral;
	TButton *BtnClose;
	TLabel *Label1;
	TPanel *Panel1;
	TLabel *LblPublicIPv4;
	TButton *BtnRefresh;
	TPopupMenu *PopupMenu;
	TMenuItem *BtnCopy;
	TTimer *Tmr1stRefresh;
	TPanel *Panel2;
	TIdHTTP *IdHTTP;
	TIdSSLIOHandlerSocketOpenSSL *IdSSLIOHandlerSocketOpenSSL;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *LblPublicIPv6;
	TActionList *ActionList;
	TAction *ActRefresh;
	void __fastcall FormCanResize(TObject *Sender, int &NewWidth, int &NewHeight, bool &Resize);
	void __fastcall BtnCloseClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BtnCopyClick(TObject *Sender);
	void __fastcall Tmr1stRefreshTimer(TObject *Sender);
	void __fastcall ActRefreshExecute(TObject *Sender);

private:	// User declarations
	TIPInfo IPInfo;
	UnicodeString GetPublicIPv4();
	UnicodeString GetPublicIPv6();
public:		// User declarations
	__fastcall TFrmMain(TComponent* Owner);
    void LoadIPInfo();
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmMain *FrmMain;
//---------------------------------------------------------------------------
#endif
