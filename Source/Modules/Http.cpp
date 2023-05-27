//---------------------------------------------------------------------------


#pragma hdrstop

#include "Http.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TDmHttp *DmHttp;
//---------------------------------------------------------------------------
__fastcall TDmHttp::TDmHttp(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
