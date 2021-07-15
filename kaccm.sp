#include <sourcemod>
#include <sdktools>
#include <multicolors>

public Plugin myinfo =
{
	name = "KACCM",
	author = "ReyZ",
	description = "KACCM",
	version = "1",
	url = "http://www.sourcemod.net/"
};

int cooldownTimes[MAXPLAYERS + 1] = {-1, ...};

public void OnPluginStart()
{
	RegConsoleCmd("sm_kaccm", KomutKACCM, "KACCM");
}

public void OnClientPutInServer(int client)
{
    cooldownTimes[client] = -1;
}

public Action KomutKACCM(client, args)
{
	int currentTime = GetTime();
	if (cooldownTimes[client] != -1 && cooldownTimes[client] > currentTime)
    {
		EmitSoundToClient(client, "buttons/button11.wav");
		CReplyToCommand(client, "{lime}[SourceMod] {white}Bu komutu {red}1 dakikada {white}bir kez kullanabilirsiniz.");
		return Plugin_Handled;
    }
	int RandomNumbersArray[19] = {0,3,4,5,6,8,10,12,15,16,17,19,20,22,26,27,29,30,31}; //Çıkabilecek numaralar
	int randomnum = GetRandomInt(0, 18);
	
	switch(randomnum) {
		case 18:
		{
			CPrintToChatAllEx(client, "{lime}[SourceMod] {teamcolor}%N {white}adlı oyuncunun çubuğu max seviyede {fullred}31CM {darkorange}(düşman götüne kurşun)", client);
		}
		case 0:
		{
			CPrintToChatAllEx(client, "{lime}[SourceMod] {teamcolor}%N {white}adlı oyuncunun çubuğu yok {hotpink}0CM", client);
		}
		default:
		{
			CPrintToChatAllEx(client, "{lime}[SourceMod] {teamcolor}%N {white}adlı oyuncunun çubuğu {limegreen}%dCM", client, RandomNumbersArray[randomnum]);
		}
	}
	cooldownTimes[client] = currentTime + 60;
	return Plugin_Handled;
}
