module openWebif;

import vibe.d;

///
struct Movie {
	string fullname;
	string eventname;
	string filename;
	string filename_stripped;
	string description;
	string descriptionExtended;
	string tags;
	long filesize;
	string length;
	string servicename;
	string begintime;
	string serviceref;
	long lastseen;
	long recordingtime;
}

///
struct MovieList
{
	string directory;
	Movie[] movies;
	string[] bookmarks;
}

///
struct Subservice
{
	string servicereference;
	string servicename;
}

///
struct Service
{
	string servicereference;
	string servicename;
	Subservice[] subservices;
}

///
struct ServicesList
{
	bool result;
	Service[] services;
}

///
struct CurrentServiceInfo
{
	string name;
}
struct CurrentServiceEPG
{
	string sname;
	string title;
	long begin_timestamp;
	long now_timestamp;
	string shortdesc;
	string longdesc;
}

///
struct CurrentService
{
	CurrentServiceInfo info;	
	CurrentServiceEPG now;
	CurrentServiceEPG next;
}

///
interface OpenWebifApi {
	MovieList movielist();
	
	ServicesList getallservices();
	CurrentService getcurrent();

	@method(HTTPMethod.GET)
	Json message(string text, int type, int timeout);
}
