//---------------------------------------------------------------------------

#include <vcl.h>
#include <Clipbrd.hpp>
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;
//---------------------------------------------------------------------------
UnicodeString TFrmMain::PublicIP()
{
	try
	{
		return IdHTTP->Get("https://api.ipify.org/");
	}
	catch (Exception &exception)
	{
		return "127.0.0.1";
	}
}
//---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::FormCanResize(TObject *Sender, int &NewWidth, int &NewHeight,
		  bool &Resize)
{
	NewHeight = 476;
	NewWidth = 371;
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::BtnCloseClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::FormCreate(TObject *Sender)
{
	this->Height = 476;
	this->Width = 371;
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::BtnRefreshClick(TObject *Sender)
{
	try
	{
		BtnRefresh->Enabled = false;
		Screen->Cursor = crHourGlass;
		LblIP->Caption = PublicIP();
	}
	__finally
	{
		Screen->Cursor = crDefault;
		BtnRefresh->Enabled = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::FormShow(TObject *Sender)
{
    Tmr1stRefresh->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::BtnCopyClick(TObject *Sender)
{
	Clipboard()->AsText = LblIP->Caption;
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::Tmr1stRefreshTimer(TObject *Sender)
{
	Tmr1stRefresh->Enabled = false;
	BtnRefreshClick(Sender);
}
//---------------------------------------------------------------------------

