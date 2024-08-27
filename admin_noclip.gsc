init() {
    level.XUIDs = ["5ce5daeeef33a81e", "anotherXUID12345678", "yetAnotherXUID98765432"];

    level thread on_player_connected();
    level thread player_connect_event();
}

on_player_connected()
{
    level endon("game_ended");

    for(;;)
    {
        level waittill("connected", player);
        player thread on_player_spawned();
    }
}

on_player_spawned()
{
    self endon("disconnect");
    self endon("game_ended");

    is_whitelisted = check_whitelist(self.xuid);

    self waittill("spawned_player");

    if (is_whitelisted) {
        // Starte den UFO-Modus, wenn der Spieler whitelisted ist
        self thread UFOMode();
    }
}

check_whitelist(xuid)
{
    is_whitelisted = false;
    
    // Überprüfe, ob die XUID in der Whitelist ist
    for (i = 0; i < level.XUIDs.size; i++) {
        if (level.XUIDs[i] == xuid) {
            is_whitelisted = true;
            break;
        }
    }

    return is_whitelisted;
}

player_connect_event() {
    while (true) {
        level waittill("connected", player);

        if (player.xuid == "0") {
            continue;
        }

        is_whitelisted = check_whitelist(player.xuid);

        if (is_whitelisted) {
            // wait 1.0;
            executeCommand("say Welcome to the server, " + player.name + "!");
            executeCommand("say " + player.name + " is whitelisted. Admin.");
            //executeCommand("say XUID is: " + player.xuid);
            // executeCommand("say GUID is: " + player.guid);
        } else {
            // wait 1.0;
            executeCommand("say Welcome to the server, " + player.name + "!");
            executeCommand("say " + player.name + " is not whitelisted. User.");
            executeCommand("say XUID is: " + player.xuid);
            executeCommand("say GUID is: " + player.guid);
        }
    }
}

UFOMode()
{
    if(self.UFOMode == false)
    {
        self thread doUFOMode();
        self.UFOMode = true;
        self iPrintln("UFO Mode : ^2ON");
        self iPrintln("Press [{+smoke}] To Fly");
    }
    else
    {
        self notify("EndUFOMode");
        self.UFOMode = false;
        self iPrintln("UFO Mode : ^1OFF^7");
    }
}

doUFOMode()
{
    self endon("EndUFOMode");
    self.Fly = 0;
    UFO = spawn("script_model",self.origin);
    for(;;)
    {
        if(self secondaryoffhandbuttonpressed())
        {
            self playerLinkTo(UFO);
            self.Fly = 1;
        }
        else
        {
            self.Fly = 0;
        }
        if(self AdsButtonPressed() && self.fly == 0)
        {
            self unlink();
            self.Fly = 0;
            self.UFo delete();
        }
        if(self.Fly == 1)
        {
            Fly = self.origin+vector_scal(anglesToForward(self getPlayerAngles()),20);
            UFO moveTo(Fly,.03);
        }
        wait .001;
    }
}

vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}


