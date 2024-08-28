![h2m](https://github.com/user-attachments/assets/4ca24ebf-86f1-4bc6-96d5-570e4110b8b9)

<div align="center">
  <a href="https://discord.gg/bXAuff2nsm" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/discord/default.svg" width="52" height="40" alt="discord logo"  />
  </a>
  <a href="https://www.youtube.com/@Austria_Sativa" target="_blank">
    <img src="https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/youtube/default.svg" width="52" height="40" alt="youtube logo"  />
  </a>
</div>


</head>
<body>
    <h1>H2-MOD-Admin-NoClip</h1>
    <p>This script allows whitelisted admins and VIPs to enable NoClip mode (UFO mode) in <em>Call of Duty Modern Warfare Remastered 2</em>.</p>
    <h2>Installation</h2>
    <ol>
        <li><strong>Download and Place the Script:</strong> Put the <code>AdminNoClip.gsc</code> file in the following directory:
            <pre>Call of Duty Modern Warfare Remastered 2\user_scripts\mp</pre>
        </li>
        <li><strong>Add Your XUIDs:</strong> In the second line of the script, add your Admin and VIP XUIDs:
            <pre>
level.Admin_XUIDs = ["your_admin_xuid_1", "your_admin_xuid_2"];
level.VIP_XUIDs = ["your_vip_xuid_1", "your_vip_xuid_2"];
            </pre>
        </li>
    </ol>
    <h2>Controls</h2>
    <ul>
        <li><strong>PC Keyboard:</strong> [Q + 4]</li>
        <li><strong>PlayStation Controller:</strong> [R1 + R2]</li>
        <li><strong>Xbox Controller:</strong> [LB + LT]</li>
    </ul>
    <h2>Features</h2>
    <ul>
        <li><strong>Admin and VIP Whitelisting:</strong> Only users whose XUIDs are listed in the whitelist can access NoClip mode.</li>
        <li><strong>NoClip (UFO) Mode:</strong> Allows selected players to fly around the map without collision.</li>
        <li><strong>Custom Welcome Messages:</strong> Configurable messages for admins, VIPs, and regular users upon connecting to the server.</li>
    </ul>
    <h2>How It Works</h2>
    <p>The script runs several checks and events to manage player connections and permissions:</p>
    <ul>
        <li><strong>Initialization:</strong> Sets up the admin and VIP whitelists and starts the connection handler threads.</li>
        <li><strong>UFOMode:</strong> Enables and disables the NoClip mode, allowing players to fly around the map.</li>
    </ul>
    <h2>Example Configuration</h2>
    <pre>
level.Admin_XUIDs = ["5ce5daeeef33a81e", "anotherXUID12345678", "yetAnotherXUID98765432"];
level.VIP_XUIDs = ["anotherXUIDadadw", "anotherXUID12345678", "yetAnotherXUID98765432"];
    </pre>
    <h2>Notes</h2>
    <p>Make sure to replace the placeholder XUIDs with actual player XUIDs to properly whitelist users for NoClip mode.</p>
</body>
</html>
