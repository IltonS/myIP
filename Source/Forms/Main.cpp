//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;
//---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
UnicodeString TFrmMain::GetPublicIPv4()
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
UnicodeString TFrmMain::GetPublicIPv6()
{
	try
	{
		return IdHTTP->Get("https://[api64.ipify.org]");
	}
	catch (Exception &exception)
	{
		return "::1";
	}
}
//---------------------------------------------------------------------------
void TFrmMain::InsertDetails(UnicodeString AProperty, UnicodeString AValue)
{
	CdsDetails->Insert();
	CdsDetails->FieldByName("Property")->Value = AProperty;
	CdsDetails->FieldByName("Value")->Value = AValue;
	CdsDetails->Post();
}
//---------------------------------------------------------------------------
void TFrmMain::GetIPGeolocation()
{
	UnicodeString Response;
	TJSONObject *JSONObject;

	try
	{
		Response = IdHTTP->Get("http://ip-api.com/json/");
		JSONObject = (TJSONObject*) TJSONObject::ParseJSONValue(Response);

		CdsDetails->Open();

		InsertDetails("AS", JSONObject->GetValue("as")->Value());
		InsertDetails("Org", JSONObject->GetValue("org")->Value());
		InsertDetails("ISP", JSONObject->GetValue("isp")->Value());
		InsertDetails("Time Zone", JSONObject->GetValue("timezone")->Value());
		InsertDetails("Longitude", JSONObject->GetValue("lon")->Value());
		InsertDetails("Latitude", JSONObject->GetValue("lat")->Value());
		InsertDetails("Zip", JSONObject->GetValue("zip")->Value());
		InsertDetails("City", JSONObject->GetValue("city")->Value());
		InsertDetails("Region Name", JSONObject->GetValue("regionName")->Value());
		InsertDetails("Region", JSONObject->GetValue("region")->Value());
		InsertDetails("Country Code", JSONObject->GetValue("countryCode")->Value());
		InsertDetails("Country", JSONObject->GetValue("country")->Value());
	}
	__finally
	{
        JSONObject->Free();
	}
}
//---------------------------------------------------------------------------
void TFrmMain::LoadIPInfo()
{
	IPInfo.PublicIPv4 = GetPublicIPv4();
	IPInfo.PublicIPv6 = GetPublicIPv6();
    GetIPGeolocation();
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

void __fastcall TFrmMain::FormShow(TObject *Sender)
{
	Tmr1stRefresh->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::BtnCopyClick(TObject *Sender)
{
	TMenuItem *AMenuItem = (TMenuItem*) Sender;
	TPopupMenu *APopupMenu = (TPopupMenu*) AMenuItem->GetParentComponent();
	TLabel *ALabel = (TLabel*) APopupMenu->PopupComponent;

	if (ALabel->Name == "LblPublicIPv4") {
		Clipboard()->AsText = LblPublicIPv4->Caption;
	}else if (ALabel->Name == "LblPublicIPv6"){
		Clipboard()->AsText = LblPublicIPv6->Caption;
	}
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::Tmr1stRefreshTimer(TObject *Sender)
{
	Tmr1stRefresh->Enabled = false;
	ActRefreshExecute(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TFrmMain::ActRefreshExecute(TObject *Sender)
{
		try
	{
		ActRefresh->Enabled = false;
		Screen->Cursor = crHourGlass;
        Application->ProcessMessages();

		LoadIPInfo();

		LblPublicIPv4->Caption = IPInfo.PublicIPv4;
		LblPublicIPv6->Caption = IPInfo.PublicIPv6;
	}
	__finally
	{
		Screen->Cursor = crDefault;
		ActRefresh->Enabled = true;
	}
}
//---------------------------------------------------------------------------

