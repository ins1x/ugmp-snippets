// UG-MP client version checker
public OnPlayerConnect(playerid)
{
	new ClientVersion[24];
	GetPlayerVersion(playerid, ClientVersion, sizeof(ClientVersion));

	if(strcmp(ClientVersion, "1.0 -"))
	{
		new tmpstr[128];
		format(tmpstr. sizeof(tmpstr), "You are using game version %s, please use UG-MP launcher to connect!", ClientVersion);
		SendClientMessage(playerid, COLOR_RED, tmpstr);
		SendClientMessage(playerid, COLOR_RED, "Download it from: https://gtaundergroundmod.com/");
		//Kick(playerid);
	}

	// Sampcac version check
	#if defined _sampcac_included
	if(CAC_GetStatus(playerid) == 0) {
		SendClientMessage(playerid,COLOR_RED, "SAMPCAC is not installed! Please install the Anti-Cheat SAMPCAC client version.");
		SendClientMessage(playerid, COLOR_RED, "Download it from: www.bitly.com/sampcac10");
		//KickEx(playerid, "SAMPCAC is not installed");
		return true;
	}
	#endif
	return 1;
}