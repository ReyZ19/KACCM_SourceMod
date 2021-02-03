#include <sourcemod>
public Plugin:myinfo =
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
	ServerCommand("echo >>> KACCM Plugini Basladi <<<");
	RegConsoleCmd("sm_kaccm", KomutKACCM, "KACCM");
}

public void OnClientPutInServer(int client)
{
    cooldownTimes[client] = -1;
}

public Action:KomutKACCM(client, args)
{
	int currentTime = GetTime();
    if (cooldownTimes[client] != -1 && cooldownTimes[client] > currentTime)
    {
    	ReplyToCommand(client, "\x04[SourceMod] \x01Bu komutu 1 dakikada bir kez kullanabilirsiniz.");
        return Plugin_Handled;
    }
    // Komutlar Buraya return Plugin_Handled; yazma!
    new RandomNumbersArray[19] = {0,3,4,5,6,8,10,12,15,16,17,19,20,22,26,27,29,30,31}; //Çıkabilecek numaralar
	new randomnum = GetRandomInt(0, 18);
	PrintToChatAll("\x04%N \x01adlı oyuncunun çubuğu \x04%dCM", client, RandomNumbersArray[randomnum]);
	// Komutlar bitiş
    cooldownTimes[client] = currentTime + 60; // Sure
    return Plugin_Handled;
}
