// Simple filterscript to control UG-MP cool features
// Type /ugmp to open dialog in game

#include <a_samp>
#include <ugmp>
#include <ugmp_postfx>

#define DIALOG_UGMP_FEATURES 8888
#define FILTERSCRIPT

public OnPlayerConnect(playerid)
{
	// Makes rubbish (e.g. the flying 'zombie elvis found' newspapers and leaves) (in)visible for a single player.
	// Rubbish is visible by all players by default.
	TogglePlayerRubbish(playerid, true);
	// Makes procedural grass visible to a single player. 
	// The grass will move with the in-game wind, and is visible to all players by default.
	TogglePlayerGrass(playerid, true);
	SetPVarInt(playerid, "TogglePlayerGrass", true);
	// Enables or disables the sun for a single player.
	TogglePlayerSun(playerid, true);
	SetPVarInt(playerid, "TogglePlayerSun", true);
	// Enables or disables the night vision effect inmediately.
	TogglePlayerNightVision(playerid, true);
	SetPVarInt(playerid, "TogglePlayerNightVision", true);
	// Enables or disables the infrared effect inmediately.
	TogglePlayerInfraRed(playerid, true);
	SetPVarInt(playerid, "TogglePlayerInfraRed", true);
	// Enables or disables the CCTV effect inmediately. This effect is never used in the original game.
	TogglePlayerCCTV(playerid, true);
	SetPVarInt(playerid, "TogglePlayerCCTV", true);
	// Enables or disables the fog effect inmediately. This effect is never used in the original game.
	TogglePlayerFogOverlay(playerid, true);
	SetPVarInt(playerid, "TogglePlayerFogOverlay", true);
	// Enables or disables the video camera effect inmediately. This effect is present in GTA: SA, but never used.
	// It is used in GTA: VC as the camera overlay you see when entering/exiting the golf club or airport.
	TogglePlayerVideoCameraOverlay(playerid, true);
	SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", true);
	// Makes real-time shadows visible to a single player.
	// This includes the stencil shadow you see below the player on the PC version of GTA: SA. 
	// By default, real-time shadows are enabled for all players.
	TogglePlayerRealTimeShadows(playerid, true);
	SetPVarInt(playerid, "TogglePlayerRealTimeShadows", true);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (!strcmp(cmdtext, "/ugmp", true))
	{
		new
			grass_state[14], rubbish_state[14],
			sun_state[14], nightvision_state[14],
			infared_state[14], cctv_state[14],
			fogoverlay_state[14], vccam_state[14],
			realtimeshadows_state[14]
		;
		
		if (GetPVarInt(playerid, "TogglePlayerGrass") > 0) grass_state = "{00FF00}[ON]";
		else grass_state = "{FF0000}[OFF]";
		if (IsRubbishVisibleForPlayer(playerid)) rubbish_state = "{00FF00}[ON]";
		else rubbish_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerSun") > 0) sun_state = "{00FF00}[ON]";
		else sun_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerNightVision") > 0) nightvision_state = "{00FF00}[ON]";
		else nightvision_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerInfraRed") > 0) infared_state = "{00FF00}[ON]";
		else infared_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerCCTV") > 0) cctv_state = "{00FF00}[ON]";
		else cctv_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerFogOverlay") > 0) fogoverlay_state = "{00FF00}[ON]";
		else fogoverlay_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerVideoCameraOverlay") > 0) vccam_state = "{00FF00}[ON]";
		else vccam_state = "{FF0000}[OFF]";
		if (GetPVarInt(playerid, "TogglePlayerRealTimeShadows") > 0) realtimeshadows_state = "{00FF00}[ON]";
		else realtimeshadows_state = "{FF0000}[OFF]";
		
		new tablisttext[350];
		format(tablisttext, sizeof(tablisttext),
		"option\tstate\n\
		Crass on floor\t%s\n\
		Rubbish on ground\t%s\n\
		Show sun to a player\t%s\n\
		Night vision\t%s\n\
		InfaRed vision\t%s\n\
		CCTV\t%s\n\
		FogOverlay\t%s\n\
		VideoCameraOverlay\t%s\n\
		RealTimeShadows\t%s\n",
		grass_state, rubbish_state, 
		sun_state, nightvision_state,
		infared_state, cctv_state,
		fogoverlay_state, vccam_state,
		realtimeshadows_state);

		ShowPlayerDialog(playerid, DIALOG_UGMP_FEATURES, DIALOG_STYLE_TABLIST_HEADERS,
		"UG-MP Features", tablisttext, "Select", "Cancel");
		return true;
	}

	return true;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_UGMP_FEATURES)
	{
		if (response)
		{
			switch(listitem)
			{
				case 0:
				{
					if (GetPVarInt(playerid, "TogglePlayerGrass") > 0)
					{
						TogglePlayerGrass(playerid, false);
						SetPVarInt(playerid, "TogglePlayerGrass", false);
					} else {
						TogglePlayerGrass(playerid, true);
						SetPVarInt(playerid, "TogglePlayerGrass", true);
					}
				}
				case 1: 
				{
					if (IsRubbishVisibleForPlayer(playerid)) {
						TogglePlayerRubbish(playerid, false);
					} else {
						TogglePlayerRubbish(playerid, true);
					}
				}
				case 2:
				{
					if (GetPVarInt(playerid, "TogglePlayerSun") > 0)
					{
						TogglePlayerSun(playerid, false);
						SetPVarInt(playerid, "TogglePlayerSun", false);
					} else {
						TogglePlayerSun(playerid, true);
						SetPVarInt(playerid, "TogglePlayerSun", true);
					}
				}
				case 3:
				{
					if (GetPVarInt(playerid, "TogglePlayerNightVision") > 0)
					{
						TogglePlayerNightVision(playerid, false);
						SetPVarInt(playerid, "TogglePlayerNightVision", false);
					} else {
						TogglePlayerNightVision(playerid, true);
						SetPVarInt(playerid, "TogglePlayerNightVision", true);
					}
				}
				case 4:
				{
					if (GetPVarInt(playerid, "TogglePlayerInfraRed") > 0)
					{
						TogglePlayerInfraRed(playerid, false);
						SetPVarInt(playerid, "TogglePlayerInfraRed", false);
					} else {
						TogglePlayerInfraRed(playerid, true);
						SetPVarInt(playerid, "TogglePlayerInfraRed", true);
					}
				}
				case 5:
				{
					if (GetPVarInt(playerid, "TogglePlayerCCTV") > 0)
					{
						TogglePlayerCCTV(playerid, false);
						SetPVarInt(playerid, "TogglePlayerCCTV", false);
					} else {
						TogglePlayerCCTV(playerid, true);
						SetPVarInt(playerid, "TogglePlayerCCTV", true);
					}
				}
				case 6:
				{
					if (GetPVarInt(playerid, "TogglePlayerFogOverlay") > 0)
					{
						TogglePlayerFogOverlay(playerid, false);
						SetPVarInt(playerid, "TogglePlayerFogOverlay", false);
					} else {
						TogglePlayerFogOverlay(playerid, true);
						SetPVarInt(playerid, "TogglePlayerFogOverlay", true);
					}
				}
				case 7:
				{
					if (GetPVarInt(playerid, "TogglePlayerVideoCameraOverlay") > 0)
					{
						TogglePlayerVideoCameraOverlay(playerid, false);
						SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", false);
					} else {
						TogglePlayerVideoCameraOverlay(playerid, true);
						SetPVarInt(playerid, "TogglePlayerVideoCameraOverlay", true);
					}
				}
				case 8:
				{
					if (GetPVarInt(playerid, "TogglePlayerRealTimeShadows") > 0)
					{
						TogglePlayerRealTimeShadows(playerid, false);
						SetPVarInt(playerid, "TogglePlayerRealTimeShadows", false);
					} else {
						TogglePlayerRealTimeShadows(playerid, true);
						SetPVarInt(playerid, "TogglePlayerRealTimeShadows", true);
					}
				}
			}
		}
	}
	return 1;
}
