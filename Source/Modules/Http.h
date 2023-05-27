//---------------------------------------------------------------------------

#ifndef HttpH
#define HttpH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdHTTP.hpp>
#include <IdIOHandler.hpp>
#include <IdIOHandlerSocket.hpp>
#include <IdIOHandlerStack.hpp>
#include <IdSSL.hpp>
#include <IdSSLOpenSSL.hpp>
#include <IdTCPClient.hpp>
#include <IdTCPConnection.hpp>
//---------------------------------------------------------------------------
class TDmHttp : public TDataModule
{
__published:	// IDE-managed Components
	TIdHTTP *IdHTTP;
	TIdSSLIOHandlerSocketOpenSSL *S;
private:	// User declarations
public:		// User declarations
	__fastcall TDmHttp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDmHttp *DmHttp;
//---------------------------------------------------------------------------
#endif
