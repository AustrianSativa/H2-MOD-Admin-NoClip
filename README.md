![h2m](https://github.com/user-attachments/assets/4ca24ebf-86f1-4bc6-96d5-570e4110b8b9)


#H2-MOD-Admin-NoClip
This script provides whitelisted Admins and VIPs with the ability to activate a "UFO Mode" (Noclip) in the game. It checks whether players are whitelisted upon connecting and spawns them with special permissions based on their status. Additionally, it welcomes players to the server and displays their information if certain conditions are met.

Features
Whitelist Check: Only players with their XUID in the Admin or VIP whitelist can use the UFO Mode.
UFO Mode (Noclip): Allows whitelisted Admins and VIPs to fly around the game map.
Customizable Welcome Messages: Provides different welcome messages and status updates for Admins, VIPs, and regular users.
Player Information Display: Displays XUID and GUID for whitelisted players if configured.
Installation
Download the Script: Download the script and save it in the following directory:

Call of Duty Modern Warfare Remastered 2\user_scripts\mp

Add Your XUIDs: Modify the script to include your XUIDs in the appropriate whitelist section:
level.Admin_XUIDs = ["5ce5daeeef33a81e", "anotherXUID12345678", "yetAnotherXUID98765432"];
level.VIP_XUIDs = ["anotherXUIDadadw", "anotherXUID12345678", "yetAnotherXUID98765432"];
Replace these example XUIDs with your own.

Controls
PC Keyboard: Press [Q + 4] to activate UFO Mode.
Playstation Controller: Press [R1 + R2] to activate UFO Mode.
Xbox Controller: Press [LB + LT] to activate UFO Mode.
Usage
Player Connection Event: When a player connects, the script will check their XUID against the Admin and VIP whitelists.
Whitelist Verification: If the player is whitelisted as an Admin or VIP, they will have access to the UFO Mode.
UFO Mode Activation: Admins and VIPs can activate UFO Mode (Noclip) using the controls specified above.
Information Display: Custom welcome messages and information (such as XUID and GUID) are displayed based on the player's whitelist status.
Customization
Configure Welcome Messages
You can enable or disable welcome messages and whitelist notifications by setting the following game variables (Dvar):

Admin Welcome: set enable_admin_welcome 1
VIP Welcome: set enable_vip_welcome 1
User Welcome: set enable_user_welcome 1
Configure Whitelist Notifications
Admin Whitelist: set enable_admin_is_whitelisted 1
VIP Whitelist: set enable_vip_is_whitelisted 1
User Whitelist: set enable_user_is_whitelisted 1
Configure ID Display
Admin IDs: set enable_admin_ids 1
VIP IDs: set enable_vip_ids 1
User IDs: set enable_user_ids 1
How It Works
Initialization (init()):

Define Admin and VIP XUIDs.
Start player connection threads.
Player Connection Handling:

The on_player_connected() function continuously listens for players connecting to the server.
For each connection, it spawns a thread to handle player-specific events (on_player_spawned()).
Whitelist Checking:

Functions check_admin_whitelist(xuid) and check_vip_whitelist(xuid) check if a player's XUID is present in the Admin or VIP lists.
UFO Mode Activation (UFOMode()):

If a player is whitelisted, they can enable UFO Mode, which allows them to fly around the map.
Contributing
Feel free to contribute to this project by submitting pull requests or reporting issues!

License
This project is licensed under the MIT License - see the LICENSE file for details.
