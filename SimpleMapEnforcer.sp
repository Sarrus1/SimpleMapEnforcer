#include<sourcemod>
#pragma semicolon 1

Handle cForcedNextMap;
char sCommand[512];

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
    char sBuffer[512];
    Format(sCommand, sizeof(sCommand), "sm_nextmap %s", GetConVarString(cForcedNextMap, sBuffer, sizeof(sBuffer)));
    ServerCommand(sCommand);
}

public void OnMapStart()
{
    ServerCommand(sCommand);
}