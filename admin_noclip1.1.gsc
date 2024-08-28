init() {
    level.Admin_XUIDs = ["anotherXUIDadadw", "anotherXUID12345678", "yetAnotherXUID98765432"];
    level.VIP_XUIDs = ["anotherXUIDadadw", "anotherXUID12345678", "yetAnotherXUID98765432"];

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


    self waittill("spawned_player");
    is_admin_whitelisted = check_admin_whitelist(self.xuid);

    if (is_admin_whitelisted) {
        // Starte den UFO-Modus, wenn der Spieler whitelisted ist
        self thread UFOMode();
    }

    is_vip_whitelisted = check_vip_whitelist(self.xuid);

    if (is_vip_whitelisted) {
        // Starte den UFO-Modus, wenn der Spieler whitelisted ist
        self thread UFOMode();
    }
}

check_admin_whitelist(xuid)
{
    is_admin_whitelisted = false;
    
    // Überprüfe, ob die XUID in der Whitelist ist
    for (i = 0; i < level.Admin_XUIDs.size; i++) {
        if (level.Admin_XUIDs[i] == xuid) {
            is_admin_whitelisted = true;
            break;
        }
    }

    return is_admin_whitelisted;
}

check_vip_whitelist(xuid)
{
    is_vip_whitelisted = false;
    
    // Überprüfe, ob die XUID in der Whitelist ist
    for (i = 0; i < level.VIP_XUIDs.size; i++) {
        if (level.VIP_XUIDs[i] == xuid) {
            is_vip_whitelisted = true;
            break;
        }
    }

    return is_vip_whitelisted;
}

player_connect_event() {
    while (true) {
        level waittill("connected", player);

        if (player.xuid == "0") {
            continue;
        }

        is_admin_whitelisted = check_admin_whitelist(player.xuid);
        is_vip_whitelisted = check_vip_whitelist(player.xuid);

        self waittill("spawned_player");

        if (is_admin_whitelisted) {
            // wait 1.0;
            if (getDvarInt("enable_admin_welcome") == 1) {
                executeCommand("say Welcome to the server, " + player.name + "!");
            }

            if (getDvarInt("enable_admin_is_whitelisted") == 1) {
                executeCommand("say " + player.name + " is whitelisted. Admin.");
            }

            if (getDvarInt("enable_admin_ids") == 1) {
                executeCommand("say XUID is: " + player.xuid);
                executeCommand("say GUID is: " + player.guid);
            }

        } else if (is_vip_whitelisted) {
            // wait 1.0;
            if (getDvarInt("enable_vip_welcome") == 1) {
                executeCommand("say Welcome to the server, " + player.name + "!");
            }

            if (getDvarInt("enable_vip_is_whitelisted") == 1) {
                executeCommand("say " + player.name + " is whitelisted. VIP.");
            }

            if (getDvarInt("enable_vip_ids") == 1) {
                executeCommand("say XUID is: " + player.xuid);
                executeCommand("say GUID is: " + player.guid);
            }
           
        } else {
            // wait 1.0;
            if (getDvarInt("enable_user_welcome") == 1) {
                executeCommand("say Welcome to the server, " + player.name + "!");
            }

            if (getDvarInt("set enable_user_is_whitelisted") == 1) {
                executeCommand("say " + player.name + " is not whitelisted. User.");
            }

            if (getDvarInt("enable_user_ids") == 1) {
                executeCommand("say XUID is: " + player.xuid);
                executeCommand("say GUID is: " + player.guid);
            }
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