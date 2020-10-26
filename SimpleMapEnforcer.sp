#include<sourcemod>
#pragma semicolon 1

Handle cForcedNextMap;
Handle cNextLevel = INVALID_HANDLE;
char sMapName[512];

public Plugin myinfo = {
	name = "SimpleMapEnforcer",
	author = "Sarrus",
	description = "Forces sm_nextmap to a specified value.",
	version = "1.0",
	url = "http://sarrus.tensor.fr"
};

public void OnPluginStart()
{
    cForcedNextMap = CreateConVar("sm_forced_nextmap", "de_dust2", "Forced value of sm_nextmap");
    AutoExecConfig();

    cNextLevel = FindConVar("nextlevel");
    HookEvent("cs_win_panel_match", OnMatchEnd, EventHookMode_PostNoCopy); 


    GetConVarString(cForcedNextMap, sMapName, sizeof(sMapName));
    SetConVarString(cNextLevel, sMapName, .notify=false);
}

public void OnMapStart()
{
    SetConVarString(cNextLevel, sMapName, .notify=false);
}

public OnMatchEnd(Handle event, const char[] name, bool dontBroadcast)
{
	SetConVarString(cNextLevel, sMapName, .notify=false);
}