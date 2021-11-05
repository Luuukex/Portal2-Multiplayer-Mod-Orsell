//--------------------------------------------------------------------------------------------------------------------------------------//
//                                                             COPYRIGHT                                                                //
//                                                  © 2021 Portal 2: Multiplayer Mod                                                    //
//                                 https://github.com/kyleraykbs/Portal2-32PlayerMod/blob/main/LICENSE                                  //
// (in the case that file does not exist, or doenst exist in the repo this project will fall under a GNU LESSER GENERAL PUBLIC LICENSE) //
//--------------------------------------------------------------------------------------------------------------------------------------//

//  ____               __             ___           ___       __         __       ___
// /\  _`\            /\ \__         /\_ \        /'___`\    /\ \      /'__`\   /'___`\
// \ \ \L\ \___   _ __\ \ ,_\    __  \//\ \      /\_\ /\ \   \ \ \    /\_\L\ \ /\_\ /\ \
//  \ \ ,__/ __`\/\`'__\ \ \/  /'__`\  \ \ \     \/_/// /__   \ \ \   \/_/_\_<_\/_/// /__
//   \ \ \/\ \L\ \ \ \/ \ \ \_/\ \L\.\_ \_\ \_      // /_\ \   \ \ \    /\ \L\ \  // /_\ \
//    \ \_\ \____/\ \_\  \ \__\ \__/.\_\/\____\    /\______/    \ \ \   \ \____/ /\______/
//     \/_/\/___/  \/_/   \/__/\/__/\/_/\/____/    \/_____/      \ \ \   \/___/  \/_____/
//                                                                \ \_\
//                                                                 \/_/

//  ██████  ██████  ███    ██ ███████ ██  ██████
// ██      ██    ██ ████   ██ ██      ██ ██
// ██      ██    ██ ██ ██  ██ █████   ██ ██   ███
// ██      ██    ██ ██  ██ ██ ██      ██ ██    ██
//  ██████  ██████  ██   ████ ██      ██  ██████

//-----------------------------------
DevMode <- false // Set to true if you're a developer
//-----------------------------------
UsePlugin <- false // Set to true if you want to use the plugin (LINUX ONLY)
//-----------------------------------
DedicatedServer <- false // Set to true if you want to run the server as a dedicated server (INDEV)
//-----------------------------------
RandomTurretModels <- true // Set to true if you want to randomize the turret models (INDEV)
//-----------------------------------
TickSpeed <- 0.1 // Set to the tick speed of the server (UNSTABLE - ONLY DO 0.01 TO 0.5) (lower numbers can cause lag on slow computers/connections)
//-----------------------------------


//  ██████  ██████  ██████  ███████
// ██      ██    ██ ██   ██ ██
// ██      ██    ██ ██   ██ █████
// ██      ██    ██ ██   ██ ██
//  ██████  ██████  ██████  ███████

// █▀ █▀▀ ▀█▀ █░█ █▀█   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
// ▄█ ██▄ ░█░ █▄█ █▀▀   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

PreviousTimeDeath <- 0
HasRanGeneralOneTime <- true
tick <- 0
BundgeeHookID <- "none"
BundgeeHookMessage <- "none"
OrangeCacheFailed <- false
CanClearCache <- false
DoneCacheing <- false
CachedModels <- []
IsInSpawnZone <- []
HasSpawned <- false
PlayerColorCached <- []
CurrentlyDead <- []
PlayerID <- 0
GBIsMultiplayer <- 0
cacheoriginalplayerposition <- 0
DoneWaiting <- false
IsSingleplayerMap <- false
LoadPlugin <- false
RunPluginLoad <- false
PluginLoaded <- false
PreviousTime1Sec <- 0
if (UsePlugin==true) {
    LoadPlugin <- true
}

ConsoleAscii <- [
""
"██████╗░░█████╗░██████╗░████████╗░█████╗░██╗░░░░░░░██████╗░"
"██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║░░░░░░░╚════██╗"
"██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██║░░░░░░░░░███╔═╝"
"██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║░░░░░░░██╔══╝░░"
"██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║███████╗░░███████╗"
"╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░╚══════╝"
""
"███╗░░░███╗██████╗░░░░░███╗░░░███╗░█████╗░██████╗░"
"████╗░████║██╔══██╗░░░░████╗░████║██╔══██╗██╔══██╗"
"██╔████╔██║██████╔╝░░░░██╔████╔██║██║░░██║██║░░██║"
"██║╚██╔╝██║██╔═══╝░░░░░██║╚██╔╝██║██║░░██║██║░░██║"
"██║░╚═╝░██║██║░░░░░░░░░██║░╚═╝░██║╚█████╔╝██████╔╝"
""
]

foreach (line in ConsoleAscii) {
    printl(line)
}

// Add names to credits
MPMCoopCreditNames <- [
"",
"",
"",
"",
"Portal 2 Multiplayer Mod: Credits",
"",
"--------------------------",
"Multiplayer Mod: Team",
"--------------------------",
"kyleraykbs | Scripting + Team Lead + Reverse Engineering",
"Vista | Reverse Engineering, Plugin Dev",
"Bumpy | Script Theory",
"Wolƒe Strider Shoσter | Scripting + Script Theory",
"Enator18 | Python"
"Nanoman2525 | Mapping + Entity and Command Help",
"--------------------------",
"Multiplayer Mod: Contributers",
"--------------------------",
"Darnias | Jumpstarter Code",
"Mellow | stole all of Python"
"The Pineapple | Hamachi support",
"actu | Remote File Downloads",
"Blub/Vecc | Code Cleanup + Commenting",
"AngelPuzzle | Translations",
"SuperSpeed | spedrun da test",
"--------------------------",
"Multiplayer Mod: Beta Testers",
"--------------------------",
"sear",
"Trico_Everfire",
"Brawler",
"iambread",
"hulkstar",
"neck",
"soulfur",
"brawler",
"Sheuron",
"portalboy",
"charity",
"Souper Marilogi",
"fluffys",
"JDWMGB",
"ALIEN GOD",
"mono",
"mp_emerald",
"Funky Kong",
"MicrosoftWindows",
"dactam",
"wol",
"kitsune",
"--------------------------",
"Thank you all so so much!!!",
"--------------------------"
"",
"",
"--------------------------",
"Valve: Credits",
"--------------------------",
]

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █ █▄░█ █ ▀█▀
// █ █░▀█ █ ░█░

function init() {

    // Run singleplayer code
    if (GetMapName().slice(0, 7) != "mp_coop") {
        IsSingleplayerMap <- true
        SingleplayerSupport(true, false, false, false, false, false, false)
    }

    // Create an entity to display player color at the bottom left of every clients' screen
    colordisplay <- Entities.CreateByClassname("game_text")
        // Set the entity's targetname to colordisplay + player's index
    colordisplay.__KeyValueFromString("targetname", "colordisplay" + PlayerID)
        // Set the entity's origin to the bottom left of the screen
    colordisplay.__KeyValueFromString("x", "0")
    colordisplay.__KeyValueFromString("y", "1")
        // Set the entity's holdtime to infinity
    colordisplay.__KeyValueFromString("holdtime", "100000")
        // Set the fade time to none
    colordisplay.__KeyValueFromString("fadeout", "0")
    colordisplay.__KeyValueFromString("fadein", "0")
        // Set the channel to top
    colordisplay.__KeyValueFromString("channel", "0")

    // Create an on screen text message entity
    onscreendisplay <- Entities.CreateByClassname("game_text")
    onscreendisplay.__KeyValueFromString("targetname", "onscreendisplaympmod")
    onscreendisplay.__KeyValueFromString("message", "Waiting for players...")
    onscreendisplay.__KeyValueFromString("holdtime", (TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("fadeout", (TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("fadein", (TickSpeed * 2).tostring())
    onscreendisplay.__KeyValueFromString("spawnflags", "1")
    onscreendisplay.__KeyValueFromString("color", "60 200 60")
    onscreendisplay.__KeyValueFromString("channel", "1")
    //onscreendisplay.__KeyValueFromString("x", "-1.1")
    //onscreendisplay.__KeyValueFromString("y", "-1.1")

    // Create a join message entity
    joinmessagedisplay <- Entities.CreateByClassname("game_text")
    joinmessagedisplay.__KeyValueFromString("targetname", "joinmessagedisplaympmod")
    joinmessagedisplay.__KeyValueFromString("holdtime", "3")
    joinmessagedisplay.__KeyValueFromString("fadeout", "0.2")
    joinmessagedisplay.__KeyValueFromString("fadein", "0.2")
    joinmessagedisplay.__KeyValueFromString("spawnflags", "1")
    joinmessagedisplay.__KeyValueFromString("color", "255 200 0")
    joinmessagedisplay.__KeyValueFromString("channel", "3")
    //joinmessagedisplay.__KeyValueFromString("x", "0.1")
    //joinmessagedisplay.__KeyValueFromString("y", "0.1")

    // Create entity to run loop() every 0.1 seconds
    timer <- Entities.CreateByClassname("logic_timer")
    timer.__KeyValueFromString("targetname", "timer")
    EntFireByHandle(timer, "AddOutput", "RefireTime " + TickSpeed, 0, null, null)
    EntFireByHandle(timer, "AddOutput", "classname move_rope", 0, null, null)
    EntFireByHandle(timer, "AddOutput", "OnTimer worldspawn:RunScriptCode:loop():0:-1", 0, null, null)
    EntFireByHandle(timer, "Enable", "", 0.1, null, null)

    // Create an entity that sends a client command
    clientcommand <- Entities.CreateByClassname("point_clientcommand")

    // Load plugin
    if (LoadPlugin==true) {
        if("GetPlayerName" in this) {
            printl("=================================")
            printl("Plugin already loaded skipping...")
            printl("=================================")
            PluginLoaded <- true
        } else {
            printl("============================")
            printl("Plugin not loaded loading...")
            printl("============================")
            pluginloadcommand <- Entities.CreateByClassname("point_servercommand")
            RunPluginLoad <- true
            // SendToConsole("plugin_load pl")
        }
    }

    // Run instant map code
    AllMapsCode(false, false, false, true)
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

// Teleport players within a distance
function TeleportPlayerWithinDistance(SearchPos, SearchDis, TeleportDest) {
    local ent = null
    while(ent = Entities.FindByClassnameWithin(ent, "player", SearchPos, SearchDis)) {
        ent.SetOrigin(TeleportDest)
    }
}

function PlayerWithinDistance(SearchPos, SearchDis) {
    local ent = null
    while(ent = Entities.FindByClassnameWithin(ent, "player", SearchPos, SearchDis)) {
        return ent
    }
}

function DeleteModels(ModelName) {
    local ent = null

}

function CacheModel(ModelName) {
    if (Entities.FindByModel(null, "models/"+ModelName)) {
            printl("Model: " + ModelName + " is already cached!")
        } else {
        try {
            if (servercommand) {
                printl("servercommand exists")
            }
        } catch(exception) {
            // Create an entity that sends a server command
            servercommand <- Entities.CreateByClassname("point_servercommand")
        }
        EntFireByHandle(servercommand, "command", "hud_saytext_time 0", 0, null, null)
        EntFireByHandle(servercommand, "command", "sv_cheats 1", 0, null, null)
        EntFireByHandle(servercommand, "command", "prop_dynamic_create " + ModelName, 0, null, null)
        EntFireByHandle(servercommand, "command", "sv_cheats 0", 0, null, null)
        CachedModels.push("models/"+ModelName)

        printl("Model: " + ModelName + " has been cached sucessfully!")
    }
}

// Find player by index

function FindByIndex(id)  {
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        if (ent.entindex()==id) {
            return ent
        }
    }
}

//-----------------------------------
// Multiplayer support code
//-----------------------------------

// Set GBIsMultiplayer if game is multiplayer
try {
    if (::IsMultiplayer()) {
        GBIsMultiplayer <- 1
    }
} catch(exception) {
    GBIsMultiplayer <- 0
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------//
// ░█▀▄▀█ ─█▀▀█ ▀█▀ ░█▄─░█    ░█─── ░█▀▀▀█ ░█▀▀▀█ ░█▀▀█ //
// ░█░█░█ ░█▄▄█ ░█─ ░█░█░█    ░█─── ░█──░█ ░█──░█ ░█▄▄█ //
// ░█──░█ ░█─░█ ▄█▄ ░█──▀█    ░█▄▄█ ░█▄▄▄█ ░█▄▄▄█ ░█─── //
//------------------------------------------------------//

    function loop() {
        //Count Ticks
        tick <- tick + 1

        // Run player join code when a player joins
        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            if (p.ValidateScriptScope()) {
                local script_scope = p.GetScriptScope()
                // If player hasn't joined yet / hasn't been spawned / colored yet
                if (!("Colored" in script_scope)) {
                    // Run player join code
                    OnPlayerJoin(p, script_scope)
                }
            }
        }

        AllMapsCode(true, false, false, false) // Run map loops

        CreatePropsForLevel(false, false, true) // Create the gmod generated props in the level

        // Cache original spawn position
        if (cacheoriginalplayerposition == 0 && Entities.FindByClassname(null, "player")) {
            // OldPlayerPos = the blues inital spawn position
            OldPlayerPos <- Entities.FindByName(null, "blue").GetOrigin()
            OldPlayerAngles <- Entities.FindByName(null, "blue").GetAngles()
            cacheoriginalplayerposition <- 1
        }

        // Detect death
        local progress = true
        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            // If player is dead
            if (p.GetHealth() == 0) {
                // Put dead players in the dead players array
                foreach (player in CurrentlyDead) {
                    if (player == p) {
                        progress = false
                    }
                }
                if (progress == true) {
                    CurrentlyDead.push(p)
                    OnPlayerDeath(p)
                }
            }
        }

        // Display waiting for players until player exits spawn zone
        try {
            if (HasRanGeneralOneTime == true) {
                if (Entities.FindByName(null, "HasSpawnedMPMod")) {
                    GeneralOneTime()
                    HasRanGeneralOneTime <- false
                }
            }
            if (DoneWaiting == false) {
                // Check if client is in spawn zone
                if (Entities.FindByName(null, "blue").GetVelocity().z == 0) {
                    DoEntFire("onscreendisplaympmod", "display", "", 0.0, null, null)
                } else {
                    DoneWaiting <- true
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "HasSpawnedPreMPMod")
                    EntFire("HasSpawnedPreMPMod", "addoutput", "targetname HasSpawnedMPMod", 1, null)
                }
            }
        } catch(exception) {}

        // Delete all cached models
        if (DoneCacheing==true) {
            // If model has cached successfully delete it from the level
            foreach (index, CustomGameModel in CachedModels)  {
                // Find all entities with the model name
                local ent = null
                while (ent = Entities.FindByModel(ent, CustomGameModel)) {
                    try {
                        // If it's a prop_dynamic_create entity delete it
                    if (ent.GetName().slice(0, 17)!="genericcustomprop") {
                        ent.Destroy()
                    }
                    } catch(exception) {
                        ent.Destroy()
                    }
                }
            }
        }
        if (CanClearCache==true) {
            foreach (index, CustomGameModel in CachedModels)  {
                CachedModels.remove(index)
            }
        }

        // Disconnect player if trying to play singleplayer
        if (GBIsMultiplayer==0) {
            SendToConsole("disconnect \"You cannot play singleplayer when Portal 2 is launched from the Multiplayer Mod Launcher. Please restart the game from Steam\"")
        }

        // Singleplayer loop
        if (GetMapName().slice(0, 7) != "mp_coop") {
            SingleplayerSupport(false, true, false, false, false, false, false)
        }

        if (DevMode==true) {}

        /////////////////////////
        // RUN ON EVERY SECOND //
        /////////////////////////

        if (Time() >= PreviousTime1Sec + 1) {
        PreviousTime1Sec <- Time()

        // Detect respawn
        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            if (p.GetHealth() >= 1) {
                // Get the players from the dead players array
                foreach (index, player in CurrentlyDead) {
                    if (player == p) {
                        CurrentlyDead.remove(index)
                        OnPlayerRespawn(p)
                    }
                }
            }
        }

        // Remove Player Collision
        EntFire("player", "addoutput", "CollisionGroup 2")
        }
    }

//---------------------------------------------------------------//
// ░█▀▀▀ ░█▄─░█ ░█▀▀▄   ░█▀▀▀█ ░█▀▀▀   ░█─── ░█▀▀▀█ ░█▀▀▀█ ░█▀▀█ //
// ░█▀▀▀ ░█░█░█ ░█─░█   ░█──░█ ░█▀▀▀   ░█─── ░█──░█ ░█──░█ ░█▄▄█ //
// ░█▄▄▄ ░█──▀█ ░█▄▄▀   ░█▄▄▄█ ░█───   ░█▄▄█ ░█▄▄▄█ ░█▄▄▄█ ░█─── //
//---------------------------------------------------------------//

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █░█ █▀█ █▀█ █▄▀   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▀█ █▄█ █▄█ █░█   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

//////////////////////////////
// Runs when a player joins //
//////////////////////////////

function OnPlayerJoin(p, script_scope) {
// Get player's index and store it
PlayerID <- p.GetRootMoveParent()
PlayerID <- PlayerID.entindex()

// // Set viewmodel targetnames so we can tell them apart
// local ent = null
// while (ent=Entities.FindByClassname(ent, "predicted_viewmodel")) {
//     EntFireByHandle(ent, "addoutput", "targetname viewmodel_player" + ent.GetRootMoveParent().entindex(), 0, null, null)
//     printl("Renamed predicted_viewmodel to viewmodel_player" + ent.GetRootMoveParent().entindex())
//     // printl("" + ent.GetRootMoveParent().entindex() + " rotation " + ent.GetAngles())
//     // printl("" + ent.GetRootMoveParent().entindex() + "    origin " + ent.GetOrigin())
// }

// Set cvars on joining players' client
SendToConsole("sv_timeout 3")
SendToConsole("gameinstructor_enable 1")
EntFireByHandle(clientcommand, "Command", "gameinstructor_enable 1", 0, p, p)
EntFireByHandle(clientcommand, "Command", "stopvideos", 0, p, p)
EntFireByHandle(clientcommand, "Command", "r_portal_fastpath 0", 0, p, p)
EntFireByHandle(clientcommand, "Command", "r_portal_use_pvs_optimization 0", 0, p, p)
SingleplayerSupport(false, false, false, false, true, false, false)

// Say join message on HUD
if (PluginLoaded==true) {
    JoinMessage <- GetPlayerName(PlayerID) + " joined the game"
} else {
    JoinMessage <- "Player " + PlayerID + " joined the game"
}
// Set join message to player name
JoinMessage = JoinMessage.tostring()
joinmessagedisplay.__KeyValueFromString("message", JoinMessage)
EntFireByHandle(joinmessagedisplay, "display", "", 0.0, null, null)
if (PlayerID >= 2) {
    onscreendisplay.__KeyValueFromString("y", "0.075")
}
// Assign every new targetname to the player after blue and red are used
if (PlayerID >= 3) {
    p.__KeyValueFromString("targetname", "player" + PlayerID)
}

// Set a random color for clients that join after 16 have joined
if (PlayerID != 1) {
    R <- RandomInt(0, 255), G <- RandomInt(0, 255), B <- RandomInt(0, 255)
}

// Set preset colors for up to 16 clients
switch (PlayerID) {
    case 1 : R <- 255; G <- 255; B <- 255; break;
    case 2 : R <- 180, G <- 255, B <- 180; break;
    case 3 : R <- 120, G <- 140, B <- 255; break;
    case 4 : R <- 255, G <- 170, B <- 120; break;
    case 5 : R <- 255, G <- 100, B <- 100; break;
    case 6 : R <- 255, G <- 180, B <- 255; break;
    case 7 : R <- 255, G <- 255, B <- 180; break;
    case 8 : R <-   0, G <- 255, B <- 240; break;
    case 9 : R <-  75, G <-  75, B <-  75; break;
    case 10: R <- 100, G <-  80, B <-   0; break;
    case 11: R <-   0, G <-  80, B <- 100; break;
    case 12: R <- 120, G <- 155, B <-  25; break;
    case 13: R <-   0, G <-   0, B <- 100; break;
    case 14: R <-  80, G <-   0, B <-   0; break;
    case 15: R <-   0, G <-  75, B <-   0; break;
    case 16: R <-   0, G <-  75, B <-  75; break;
}

// Set color of player's in-game model
script_scope.Colored <- true
EntFireByHandle(p, "Color", (R + " " + G + " " + B), 0, null, null)

// Run general map code after a player loads into the game
if (PlayerID == 1) {
    PostMapLoad()
}

// If the player is the first player to join, Fix OrangeOldPlayerPos
if (p.GetTeam() == 2) {
    if (OrangeCacheFailed==true) {
        OrangeOldPlayerPos <- p.GetOrigin()
        OrangeCacheFailed <- false
    }
}

// Print the players' team
printl("Player: " + PlayerID + " is on team " + p.GetTeam())

return
}

//////////////////////
// RUNS AFTER DEATH //
//////////////////////

function OnPlayerDeath(player) {
    printl("Player Death")
    SingleplayerSupport(false, false, false, false, false, player, false)
    SingleplayerSupport(false, false, false, false, false, false, false)
}

////////////////////////
// RUNS AFTER RESPAWN //
////////////////////////

function OnPlayerRespawn(player) {
    printl("Player Respawn")
    SingleplayerSupport(false, false, false, false, false, false, player)
    SingleplayerSupport(false, false, false, false, false, false, false)
}

/////////////////////////////////////
// POST MAP LOADING FUNCTIONS HERE //
/////////////////////////////////////

function PostMapLoad() {
    SingleplayerSupport(false, false, false, true, false, false, false)
    AllMapsCode(false, false, true, false)
    // Enable fast download
    SendToConsole("sv_downloadurl \"https://github.com/kyleraykbs/Portal2-32PlayerMod/raw/main/WebFiles/FastDL/portal2/\"")
    SendToConsole("sv_allowdownload 1")
    SendToConsole("sv_allowupload 1")
    SendToConsole("max_filesize 0")
}

/////////////////////////////////////
// Runs once on first global spawn //
/////////////////////////////////////

function GeneralOneTime() {

    if (RunPluginLoad==true) {
        printl("Loading plugin... Restarting map")
        // Load plugin
        EntFireByHandle(pluginloadcommand, "Command", "plugin_load pl", 0, null, null)
        // Wait for plugin to load and then restart map
        EntFireByHandle(pluginloadcommand, "Command", "changelevel mp_coop_lobby_3", 0, null, null)
        LoadPlugin <- false
    }

    CanClearCache <- true

    HasSpawned <- true

    SendToConsole("hud_saytext_time 12")

    // Cache orange players original position
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.GetTeam()==2) {
            OrangeOldPlayerPos <- p.GetOrigin()
        }
    }
    try {
        if (OrangeOldPlayerPos) { }
    } catch(exeption) {
        printl("OrangeOldPlayerPos not set (Blue probably moved before Orange could load in) Setting OrangeOldPlayerPos to BlueOldPlayerPos")
        OrangeOldPlayerPos <- OldPlayerPos
        OrangeCacheFailed <- true
    }

    // Force open the blue player droppers
    try {
        local ent = null
        while(ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", Vector(OldPlayerPos.x, OldPlayerPos.y, OldPlayerPos.z-300), 100)) {
            if (ent.GetModelName() == "models/props_underground/underground_boxdropper.mdl" || ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                EntFireByHandle(ent, "setanimation", "open", 0, null, null)
                if (ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                    EntFireByHandle(ent, "setanimation", "item_dropper_open", 0, null, null)
                }
                ent.__KeyValueFromString("targetname", "BlueDropperForcedOpenMPMOD")
            }
        }
    } catch(exeption) {
        printl("Blue dropper not found")
    }

    // Force open the orange player droppers
    try {
        radius <- 100

        if (OrangeCacheFailed==true) {
            radius <- 350
        }

        local ent = null
        while(ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", Vector(OrangeOldPlayerPos.x, OrangeOldPlayerPos.y, OrangeOldPlayerPos.z-300), radius)) {
            if (ent.GetModelName() == "models/props_underground/underground_boxdropper.mdl" || ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                EntFireByHandle(ent, "setanimation", "open", 0, null, null)
                if (ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                    EntFireByHandle(ent, "setanimation", "item_dropper_open", 0, null, null)
                }
                EntFireByHandle(ent, "setanimation", "item_dropper_open", 0, null, null)
                ent.__KeyValueFromString("targetname", "OrangeDropperForcedOpenMPMOD")
            }
        }
    } catch(exeption) {
        printl("Orange dropper not found")
    }
    radius <- null

    // Create props after cache
    CreatePropsForLevel(false, true, false)

    AllMapsCode(false, true, false, false)

    SingleplayerSupport(false, false, true, false, false, false, false)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀▄▀█ ▄▀█ █▀█   █▀ █░█ █▀█ █▀█ █▀█ █▀█ ▀█▀
// █░▀░█ █▀█ █▀▀   ▄█ █▄█ █▀▀ █▀▀ █▄█ █▀▄ ░█░

// Run all required map code
function AllMapsCode(AMCLoop, AMCPostPlayerSpawn, AMCPostInit, AMCInstantRun) {


    /////////////////
    // INSTANT RUN //
    /////////////////


    if (AMCInstantRun == true) {
        //## GELOCITY 1 INSTANT RUN ##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_1_v02") {
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "red_dropper-door_eixt"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "blue_dropper-item_door"))

                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }
            }
        } catch(exeption) { }

        //## GELOCITY 2 INSTANT RUN##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_2_v01") {
                // Set the Gelocity 2 map
                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "env_glow")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "light_spot")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "keyframe_rope")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "move_rope")) {
                    ent.Destroy() // 85 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "info_overlay")) {
                    ent.Destroy() // 85 entities removed
                }
            }
        } catch(exeption) { }

        //## GELOCITY 3 INSTANT RUN ##//
        try {
            if (GetMapName().slice(28, 50) == "mp_coop_gelocity_3_v02") {
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_2_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_2"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start_1_1"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "door_start"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "red_dropper-door_eixt"))
                DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null, "blue_dropper-item_door"))


                local ent = null
                while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                    ent.Destroy() // 20 entities removed
                }

                while(ent = Entities.FindByClassname(ent, "beam_spotlight")) {
                    ent.Destroy() // 85 entities removed
                }
            }
         } catch(exeption) { }

        //## MP_COOP_CREDITS INSTANT RUN ##//
        if (GetMapName() == "mp_coop_credits") {
            // Remove selected pods
            function CreditsRemovePod() {
                try {
                    local ent = null
                    while (ent = Entities.FindByNameNearest("chamber*", Vector(-64, 217, 72), 100)) {
                        ent.Destroy()
                    }
                } catch(exeption) { }

                try {
                    while (ent = Entities.FindByNameNearest("bubbles*", Vector(-64, 217, 72), 100)) {
                        ent.Destroy()
                    }
                } catch(exeption) { }
            }
        }

        // Fix void camera glitch
        function FixCreditsCameras() {
            // Disable useless cameras
            EntFireByHandle(Entities.FindByName(null, "camera_SP"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera_O"), "disable", "", 0, null, null)

            // Reload main camera with new params
            Entities.FindByName(null, "camera").__KeyValueFromString("target_team", "-1")
            EntFireByHandle(Entities.FindByName(null, "camera"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera"), "enable", "", 0, null, null)
        }

        // Replace females with P-bodys
        function CreditsSetModelPB(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesPB)

            // Remove pod if needed
            HasRemovedPod <- 0
            foreach (anim in NOTubeAnimsPB) {
                if (AnimationsPB[RandomAnimation] == anim && HasRemovedPod == 0) {
                    HasRemovedPod <- 1
                    CreditsRemovePod()
                }
            }

            // Set model
            ent.SetModel("models/player/eggbot/eggbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(0, 0, 7.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsPB[RandomAnimation], 0, null, null)
        }

        // Replace males with Atlases
        function CreditsSetModelAL(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesAL)

            // Set model
            ent.SetModel("models/player/ballbot/ballbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(-10, 0, 25.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsAL[RandomAnimation], 0, null, null)

            // Remove pod if needed
            HasRemovedPod <- 0
            foreach (anim in NOTubeAnimsAL) {
                if (AnimationsAL[RandomAnimation] == anim && HasRemovedPod == 0) {
                    HasRemovedPod <- 1
                    CreditsRemovePod()
                    ent.SetOrigin(Vector(0, 0, 7.5))
                }
            }
        }

        // Set credits animations
            // P-body animations
            AnimationsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "noGun_airwalk", "noGun_airwalk", "portalgun_drowning", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

            // Atlas animations
            AnimationsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "portalgun_jump_spring", "portalgun_thrash_fall", "noGun_crouch_idle", "noGun_airwalk", "noGun_airwalk"]

            // P-body animations out of tube
            NOTubeAnimsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

            // Atlas animations out of tube
            NOTubeAnimsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "noGun_crouch_idle"]

            // Credit run counter
            MPMCredits <- 0

            // Set the amount of P-body animations
            CRAnimationTypesPB <- -1
            foreach (value in AnimationsPB) {
                CRAnimationTypesPB <- CRAnimationTypesPB + 1
            }

            // Set the amount of Atlas animations
            CRAnimationTypesAL <- -1
            foreach (value in AnimationsAL) {
                CRAnimationTypesAL <- CRAnimationTypesAL + 1
            }

            // Set the amount of credits
            MPModCreditNumber <- -1
            foreach (value in MPMCoopCreditNames) {
                MPModCreditNumber <- MPModCreditNumber + 1
            }

            // Mount list of credits to credits
            foreach (Name in MPMCoopCreditNames) {
                AddCoopCreditsName(Name)
            }

        //## MP_COOP_PAINT_CONVERSION INSTANT RUN ##//
        if (GetMapName() == "mp_coop_paint_conversion") {
            Entities.FindByName(null, "disassembler_1_door_blocker").Destroy()
            Entities.FindByName(null, "disassembler_2_door_blocker").Destroy()

            Entities.FindByName(null, "disassembler_1_door_2").Destroy()
            Entities.FindByName(null, "disassembler_1_door_1").Destroy()

            Entities.FindByName(null, "disassembler_2_door_2").Destroy()
            Entities.FindByName(null, "disassembler_2_door_1").Destroy()
        }

        //## MP_COOP_TRIPLEAXIS INSTANT RUN ##//
        if (GetMapName() == "mp_coop_tripleaxis") {
            Entities.FindByName(null, "outro_math_counter").Destroy()
        }

        //## MP_COOP_SEPARATION_1 INSTANT RUN ##//
        if (GetMapName() == "mp_coop_separation_1") {
            EntFireByHandle(Entities.FindByName(null, "left_1st_room_spawn-initial_blue_spawn"), "SetAsActiveSpawn", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "right_1st_room_spawn-initial_orange_spawn"), "SetAsActiveSpawn", "", 0, null, null)
            Entities.FindByName(null, "split_counter").Destroy()
        }
    }


    ///////////
    // LOOPS //
    ///////////


    if(AMCLoop == true) {
        if (GetMapName() == "mp_coop_lobby_3") {
            local PLent = null
            while(PLent = Entities.FindByClassnameWithin(PLent, "player", Vector(2367, -8126, -54), 30)) {
                local APLent = null
                while(APLent = Entities.FindByClassname(APLent, "player")) {
                    APLent.SetOrigin(Vector(2495, -7451, 410))
                }
            }

            // Art therapy left chute enabler
            local vectorEEL
            vectorEEL = Vector(5727, 3336, -441)
            local EELent = null
            while(EELent = Entities.FindByClassnameWithin(EELent, "player", vectorEEL, 12)) {
                local LCatEn = null
                while(LCatEn = Entities.FindByName(LCatEn, "left-enable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, LCatEn)
                    DoEntFire("!self", "trigger", "", 0.0, null, LCatEn)
                }
            }

            // Art therapy left chute teleporter
            TeleportPlayerWithinDistance(Vector(5729, 3336, 1005), 30, Vector(3194, -1069, 1676))

            // Art therapy right chute enabler
            local vectorEER
            vectorEER = Vector(5727, 3192, -441)
            local EERent = null
            while(EERent = Entities.FindByClassnameWithin(EERent, "player", vectorEER, 12)) {
                local RCatEn = null
                while(RCatEn = Entities.FindByName(RCatEn, "right-enable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, RCatEn)
                    DoEntFire("!self", "trigger", "", 0.0, null, RCatEn)
                }
            }

            // Art therapy right chute teleporter
            TeleportPlayerWithinDistance(Vector(5727, 3180, 1005), 30, Vector(3191, -1228, 1682))

            // Disable art therapy chutes
            local vectorE
            vectorE = Vector(3201, -1152, 1272)
            local Aent = null
            while(Aent = Entities.FindByClassnameWithin(Aent, "player", vectorE, 150)) {
                local LCatDis = null
                while(LCatDis = Entities.FindByName(LCatDis, "left-disable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, LCatDis)
                    DoEntFire("!self", "trigger", "", 0.0, null, LCatDis)
                }
                local RCatDis = null
                while(RCatDis = Entities.FindByName(RCatDis, "right-disable_cats")) {
                    DoEntFire("!self", "enable", "", 0.0, null, RCatDis)
                    DoEntFire("!self", "trigger", "", 0.0, null, RCatDis)
                }
            }

            // Teleport exiting player out of art therapy
            TeleportPlayerWithinDistance(Vector(3584, -1669, 466), 30, Vector(3919, 3352, 158))
        }

    //## MP_COOP_CREDITS LOOP ##//
        if (GetMapName() == "mp_coop_credits") {
            // If mod credits aren't finished change humans to robots
        if (MPMCredits <= MPModCreditNumber) {
            // Change males to Atlases
            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male.mdl")) {
                CreditsSetModelAL(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male01.mdl")) {
                CreditsSetModelAL(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male_02.mdl")) {
                CreditsSetModelAL(ent)
            }

            // Change females to P-bodys
            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_01.mdl")) {
                CreditsSetModelPB(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_02.mdl")) {
                CreditsSetModelPB(ent)
            }

            local ent = null
            while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_03.mdl")) {
                CreditsSetModelPB(ent)
            }
        }
        }

        //## MP_COOP_WALL_5 ##//
        if (GetMapName() == "mp_coop_wall_5") {
            TeleportPlayerWithinDistance(Vector(1224, -1984, 565), 100, Vector(1208, -1989, 315))
            // Open areaportal
            EntFire("portal_close_second_puzzle", "open", "", 0, null)
        }

        //## MP_COOP_2PAINTS_1BRIDGE ##//
        if (GetMapName() == "mp_coop_2paints_1bridge") {
            EntFireByHandle(Entities.FindByName(null, "bridge_2"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "bridge_1"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "paint_sprayer_blue_1"), "start", "", 0, null, null)
        }
    }


    //////////////////
    // ONE TIME RUN //
    //////////////////


    if (AMCPostPlayerSpawn == true) {

        //## GENERAL ONE TIME RUN ##//
        local DoorEntities = [
            "airlock_1-door1-airlock_entry_door_close_rl",
            "airlock_2-door1-airlock_entry_door_close_rl",
            "last_airlock-door1-airlock_entry_door_close_rl",
            "airlock_1-door1-door_close",
            "airlock1-door1-door_close",
            "camera_door_3-relay_doorclose",
            "entry_airlock-door1-airlock_entry_door_close_rl",
            "door1-airlock_entry_door_close_rl",
            "airlock-door1-airlock_entry_door_close_rl",
            "orange_door_1-ramp_close_start",
            "blue_door_1-ramp_close_start",
            "orange_door_1-airlock_player_block",
            "blue_door_1-airlock_player_block",
            "airlock_3-door1-airlock_entry_door_close_rl",  //mp_coop_sx_bounce (Sixense map)
        ]

        foreach (DoorType in DoorEntities) {
            try {
                Entities.FindByName(null, DoorType).Destroy()
            } catch(exception) {
            }
        }

        //## MP_COOP_SEPARATION_1 ##//
        if (GetMapName() == "mp_coop_separation_1") {
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

            local ent = null
            while(ent = Entities.FindByName(ent, "split_exit_arms")) {
                EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
            }

            local ent = null
            while(ent = Entities.FindByName(ent, "split_entrance_arms")) {
                EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
            }

            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000)) {
                EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
            }

            local loopTimes = 0
            while (loopTimes <= 0) {
                Entities.FindByName(null, "split_exit_fake_collision").Destroy()
                local loopTimes = loopTimes + 1
            }
        }

        //## MP_COOP_LOBBY_3 ONE TIME RUN ##//
        if (GetMapName() == "mp_coop_lobby_3") {
            // Enable the hub entirely
            try {
                // Enable team building course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_teambuilding"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_teambuilding"))

                // Enable tbeam course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_tbeam"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_tbeam"))

                // Enable mass and velocity course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_bridge"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_bridge"))

                // Enable paint course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_paint"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_paint"))

                // Enable fling course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_fling"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_fling"))

                // Enable extra course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_extra"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_extra"))

                // Enable all finished course
                DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null, "relay_reveal_all_finished"))
                DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null, "relay_reveal_all_finished"))

                // Enable music
                DoEntFire("!self", "invalue", "7", 0.0, null, Entities.FindByName(null, "@music_lobby_7"))
                Entities.FindByName(null, "brush_spawn_blocker_red").Destroy()
                Entities.FindByName(null, "brush_spawn_blocker_blue").Destroy()
            } catch(exception) {}

            // Remove useless entities so that the entity limit does not crash the game

            // Remove func_portal_bumper's from the map
            local ent = null
            while(ent = Entities.FindByClassname(ent, "func_portal_bumper")) {
                ent.Destroy() // 165 entities removed
            }
            // Remove env_sprite's from the map
            local ent = null
            while(ent = Entities.FindByClassname(ent, "env_sprite")) {
                ent.Destroy() // 31 entities removed
            }

            // Fix art therapy tube glitches
            Entities.FindByName(null, "dlc_room_fall_push_right").Destroy()
            Entities.FindByName(null, "dlc_room_fall_push_left").Destroy()

            // Fix track 5
            // Entry door fix
            Entities.FindByName(null, "track5-door_paint-trigger_hurt_door").Destroy()
            Entities.FindByName(null, "track5-door_paint-collide_door").Destroy()

            // Light fix
            Entities.FindByName(null, "@light_shadowed_paintroom").Destroy()

            // Remove orange exit door
            local ent = null
            while(ent = Entities.FindByName(ent, "track5-orangeiris_door_elevator_pit")) {
                ent.Destroy()
            }

            Entities.FindByName(null, "track5-orangeescape_elevator_clip").Destroy()

            // Remove blue exit door
            local ent = null
            while(ent = Entities.FindByName(ent, "track5-iris_door_elevator_pit")) {
                ent.Destroy()
            }

            Entities.FindByName(null, "track5-escape_elevator_clip").Destroy()

            // Remove the bottom of droppers in Course 5
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                local ent = null
                while (ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", OldPlayerPos, 500)) {
                    if (ent.GetModelName() == "models/props_underground/underground_boxdropper.mdl") {
                        EntFireByHandle(ent, "SetAnimation", "open_idle", 0.0, null, null)
                    }

                    if (ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                        EntFireByHandle(ent, "SetAnimation", "item_dropper_idle", 0.0, null, null)
                    }
                }
            }
        }

        //## MP_COOP_SEPARATION_1 ONETIME ##//
        if (GetMapName() == "mp_coop_separation_1") {
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

            local ent = null
            while(ent = Entities.FindByName(ent, "split_exit_arms")) {
                EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
            }

            local ent = null
            while(ent = Entities.FindByName(ent, "split_entrance_arms")) {
                EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
            }

            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000)) {
                EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
            }

            local loopTimes = 0
            while (loopTimes <= 0) {
                Entities.FindByName(null, "split_exit_fake_collision").Destroy()
                local loopTimes = loopTimes + 1
            }
        }
    }

    ///////////////
    // Post init //
    ///////////////
    if (AMCPostInit==true) {
        // Cache props
        CreatePropsForLevel(true, false, false)
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// █▀ █ █▄░█ █▀▀ █░░ █▀▀ █▀█ █░░ ▄▀█ █▄█ █▀▀ █▀█ 
// ▄█ █ █░▀█ █▄█ █▄▄ ██▄ █▀▀ █▄▄ █▀█ ░█░ ██▄ █▀▄ 

// █▀ █░█ █▀█ █▀█ █▀█ █▀█ ▀█▀
// ▄█ █▄█ █▀▀ █▀▀ █▄█ █▀▄ ░█░

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////
// SINGLEPLAYER FUNCTIONS //
////////////////////////////

    function NewApertureStartElevatorFixes() {
        // Elevator light_spot
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
        } catch(exception) {}

        // Elevator env_projectedtexture
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_dynamic"), "TurnOn", "", 0, null, null)
        } catch(exception) {}

        // Open elevator tube
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_tube_opener"), "setanimation", "open", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_tube_opener"), "setdefaultanimation", "open_idle", 0.10, null, null)
        } catch(exception) {}

        // Open elevator door
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1_body"), "setanimation", "dooropen", 0, null, null)
        } catch(exception) {}

        // Reposition and resize fan soundscape
        try {
            local vec = Entities.FindByName(null, "arrival_elevator-elevator_1").GetOrigin()
            Entities.FindByName(null, "@arrival_elevator_soundscape").__KeyValueFromString("radius", "300")
            Entities.FindByName(null, "@arrival_elevator_soundscape").SetOrigin(Vector(vec.x, vec.y, vec.z + 200))
        } catch(exception) {}
        // Enable vgui displays
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-signs_on"), "trigger", "", 0, null, null)
            Entities.FindByName(null, "arrival_elevator-signs_off").Destroy()
        } catch(exception) {}
    }
    function disablewheatleyplayerpickup() {
        printl("Player picked up Wheatley. Disabling pickup!")
        EntFire("@sphere", "disablepickup", "", 0, null)
        EntFire("@sphereDummy", "enablepickup", "", 0, null)
    }
    function enablewheatleyplayerpickup() {
        printl("Player picked up Wheatley. Enabling pickup!")
        EntFire("@sphere", "enablepickup", "", 0, null)
        EntFire("@sphereDummy", "enablepickup", "", 0, null)
    }

// Run mapspawn.nut
try {
Entities.First().ConnectOutput("OnUser1", "init")
} catch(exception) {}
try {
DoEntFire("worldspawn", "FireUser1", "", 0.0, null, null)
} catch(exception) {}

///////////////////////////////////
// SINGLEPLAYER MAP SUPPORT CODE //
///////////////////////////////////

function SingleplayerSupport(SSInstantRun, SSLoop, SSPostPlayerSpawn, SSPostMapSpawn, SSOnPlayerJoin, SSOnDeath, SSOnRespawn) {

    //## SP_A1_INTRO2 ##//
    if (GetMapName() == "sp_a1_intro2") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            SendToConsole("commentary 0")
            Entities.FindByName(null, "@entry_door-door_close_relay").Destroy()
            Entities.FindByName(null, "@exit_door-door_close_relay").Destroy()
            Entities.FindByName(null, "Fizzle_Trigger").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {

            local portalgun = null
            while (portalgun = Entities.FindByClassname(portalgun, "weapon_portalgun")) {
                portalgun.Destroy()
            }

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-320, 1248, -656), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro3")
            }

            try {
                Entities.FindByName(null, "block_boxes").Destroy()
            } catch(exception) {}
        }
    }


    //## SP_A1_INTRO3 ##//
    if (GetMapName() == "sp_a1_intro3") {

        if (SSInstantRun == true) {
            Entities.FindByName(null, "door_0-door_close_relay").Destroy()
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "player_clips").Destroy()
            // Destroy pusher x4
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "podium_collapse_push_brush").Destroy()
            Entities.FindByName(null, "door_3-door_close_relay").Destroy()
            Entities.FindByName(null, "portal_orange_2").Destroy()
            Entities.FindByName(null, "emitter_orange_2").Destroy()
            Entities.FindByName(null, "backtrack_brush").Destroy()
            Entities.FindByName(null, "portal_orange_mtg").Destroy()
            Entities.FindByName(null, "emitter_orange_mtg").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1344, 4304, -784), 50)) {
            SendToConsole("commentary 1")
            SendToConsole("changelevel sp_a1_intro4")
            }

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}

            // Remove Portal Gun
            if (hasgotportalgunSPMP == 0) {
                local portalgun = null
                while (portalgun = Entities.FindByClassname(portalgun, "weapon_portalgun")) {
                    portalgun.Destroy()
                }
            }

            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A1_INTRO4 ##//
    if (GetMapName() == "sp_a1_intro4") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-door_close_relay").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(464, 136, 72), 1024).Destroy()
            EntFireByHandle(Entities.FindByName(null, "glass_pane_intact_model"), "kill", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "glass_pane_fractured_model"), "enable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "glass_pane_1_door_1"), "open", "", 0, null, null)
            Entities.FindByName(null, "glass_pane_1_door_1_blocker").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(878, -528, 137), 1024).Destroy()
            Entities.FindByName(null, "glass_shard").Destroy()
            Entities.FindByName(null, "section_2_trigger_portal_spawn_a2_rm3a").Destroy()
            Entities.FindByName(null, "portal_a_lvl3").Destroy()
            Entities.FindByName(null, "section_2_portal_a1_rm3a").Destroy()
            Entities.FindByName(null, "section_2_portal_a2_rm3a").Destroy()
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "room_2_portal_activate_rl").Destroy()
            Entities.FindByName(null, "room_3_portal_activate_rl").Destroy()
            Entities.FindByName(null, "door_2-close_door_rl").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(806, -528, 64), 150)) {
                EntFire("projected_texture_03", "TurnOn", "", 0, null)
            }
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(2151, -527, -499), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro5")
            }
        }
    }

    //## SP_A1_INTRO5 ##//
    if (GetMapName() == "sp_a1_intro5") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(-64, 824, 320), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-67, 1319, -102), 60)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro6")
            }
        }
    }

    //## SP_A1_INTRO6 ##//
    if (GetMapName() == "sp_a1_intro6") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "room_1_entry_door-close_door_rl").Destroy()
            Entities.FindByName(null, "room_1_fling_portal_activate_rl").Destroy()
            Entities.FindByName(null, "fling_safety_catapult").Destroy()
            Entities.FindByName(null, "room_1_fling_portal_emitter").Destroy()
            Entities.FindByName(null, "room_2_fling_portal_activate_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(648, 0, 176), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(1200, -136, 188), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2504, -160, 448), 1024).Destroy()
            local fallenautoportal = CreateProp("prop_dynamic", Vector(-325, 24, 0), "models/props/portal_emitter.mdl", 0)
            fallenautoportal.SetAngles(-90, 69, 0)
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(3015, -174, -125), 60)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_intro7")
            }
        }
    }

    //## SP_A1_INTRO7 ##//
    if (GetMapName() == "sp_a1_intro7") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
            Entities.FindByName(null, "InstanceAuto9-socket_trigger").Destroy()
            Entities.FindByName(null, "bts_panel_door-LR_heavydoor_close").Destroy()
            Entities.FindByName(null, "heavy_door_backtrack_clip").Destroy()
            Entities.FindByName(null, "bts_panel_door-heavydoor_open_clip").Destroy()
            Entities.FindByName(null, "transition_airlock_door_close_rl").Destroy()
            Entities.FindByName(null, "transition_trigger").Destroy()
            Entities.FindByName(null, "portal_detector").__KeyValueFromString("CheckAllIDs", "1")

            function wheatleyhitground() {
                EntFire("@sphere", "disablepickup", "", 1.05, null)
                EntFire("@sphere", "enablepickup", "", 8, null)
                EntFire("spherebot_1_top_swivel_1", "deactivate", "", 1.01, null)
            }

            function SPSkipPanel() {
                EntFire("InstanceAuto9-sphere_socket", "setanimation", "bindpose", 2.7, null)
                myexplode2 <- Entities.CreateByClassname("npc_personality_core")
                myexplode2.__KeyValueFromString("targetname", "myexplode2")
                myexplode2.SetOrigin(Vector(-822, -523, 1269))

                myexplode <- Entities.CreateByClassname("env_ar2explosion")
                myexplode.__KeyValueFromString("targetname", "myexplode")
                myexplode.__KeyValueFromString("material", "particle/particle_noisesphere")
                myexplode.SetOrigin(Vector(-822, -523, 1269))
                EntFire("myexplode", "explode", "", 2.5, null)
                EntFire("myexplode2", "explode", "", 2.5, null)
                EntFire("myexplode2", "explode", "", 3.0, null)

                Entities.FindByName(null, "@sphere").__KeyValueFromString("targetname", "@sphereDummy")
                local mysphere = Entities.FindByName(null, "@spheredummy")

                self.PrecacheSoundScript("sphere03.sp_a2_wheatley_ows01")
                self.PrecacheSoundScript("sphere03.sp_a2_wheatley_ows02")
                self.PrecacheSoundScript("sphere03.sphere_flashlight_tour67")
                self.PrecacheSoundScript("sphere03.sp_a1_wakeup_hacking09")
                self.PrecacheSoundScript("sphere03.sp_a1_wakeup_hacking12")
                self.PrecacheSoundScript("sphere03.sp_a1_wakeup_hacking10")
                self.PrecacheSoundScript("sphere03.bw_finale4_hackworked01")
                self.PrecacheSoundScript("Portal.elevator_chime")
                self.PrecacheSoundScript("sphere03.GloriousFreedom03")
                self.PrecacheSoundScript("sphere03.bw_fire_lift03")

                self.PrecacheSoundScript("sphere03.sp_a1_intro7_hoboturret01")
                self.PrecacheSoundScript("sphere03.sp_a1_intro7_hoboturret08")
                self.PrecacheSoundScript("sphere03.sp_a1_intro7_hoboturret07")
                self.PrecacheSoundScript("sphere03.sp_a1_intro7_hoboturret05")
                self.PrecacheSoundScript("sphere03.sp_a1_intro7_hoboturret06")

                EntFire("myexplode2", "addoutput", "targetname playline1", 2, null)
                EntFire("playline1", "addoutput", "targetname myexplode2", 2+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline2", 6, null)
                EntFire("playline2", "addoutput", "targetname myexplode2", 6+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline3", 12, null)
                EntFire("playline3", "addoutput", "targetname myexplode2", 12+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline4", 16, null)
                EntFire("playline4", "addoutput", "targetname myexplode2", 16+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline5", 18, null)
                EntFire("playline5", "addoutput", "targetname myexplode2", 18+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline6", 24, null)
                EntFire("playline6", "addoutput", "targetname myexplode2", 24+ (TickSpeed * 2), null)

                EntFire("myexplode2", "addoutput", "targetname playline7", 25, null)
                EntFire("playline7", "addoutput", "targetname myexplode2", 25+ (TickSpeed * 2), null)

                EntFire("bts_panel_door-LR_heavydoor_open", "trigger", "", 25+ (TickSpeed * 2), null)

            }
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            WheatleySeq1 <- false
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_top_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            // Make Wheatley non stealable
            try {
            Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerPickup","disablewheatleyplayerpickup")
            Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerDrop","enablewheatleyplayerpickup")
            // Disable sentaint arm and disable pickup until spchill is over
            Entities.FindByName(null, "sphere_impact_trigger").ConnectOutput("OnStartTouch","wheatleyhitground")
            // Skip panel bit
            Entities.FindByName(null, "@plug_open_rl").ConnectOutput("OnTrigger","SPSkipPanel")
            } catch(exception) { }

            // Voice Lines
            if(Entities.FindByName(null, "playline1")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a2_wheatley_ows01.wav")
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a2_wheatley_ows02.wav")
                printl("Played line 1")
            }

            if(Entities.FindByName(null, "playline2")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sphere_flashlight_tour67.wav")
                printl("Played line 2")
            }

            if(Entities.FindByName(null, "playline3")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking09.wav")
                printl("Played line 3")
            }

            if(Entities.FindByName(null, "playline4")) {
                Entities.FindByName(null, "InstanceAuto9-sphere_socket").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking12.wav")
                printl("Played line 4")
            }

            if(Entities.FindByName(null, "playline5")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_wakeup_hacking10.wav")
                printl("Played line 5")
            }

            if(Entities.FindByName(null, "playline6")) {
                Entities.FindByName(null, "InstanceAuto9-sphere_socket").EmitSound("ambient\\alarms\\portal_elevator_chime.wav")
                printl("Played line 6")
            }

            if(Entities.FindByName(null, "playline7")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\bw_finale4_hackworked01.wav")
                printl("Played line 7")
            }

            if(Entities.FindByName(null, "playline8")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret01.wav")
                printl("Played line 8")
            }

            if(Entities.FindByName(null, "playline9")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret08.wav")
                printl("Played line 9")
            }

            if(Entities.FindByName(null, "playline10")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret07.wav")
                printl("Played line 10")
            }

            if(Entities.FindByName(null, "playline11")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret05.wav")
                printl("Played line 11")
            }

            if(Entities.FindByName(null, "playline12")) {
                Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\sp_a1_intro7_hoboturret06.wav")
                printl("Played line 12")
            }

            if (!Entities.FindByName(null, "seq1finished")) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-1117, -416, 1280), 100)) {
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "seq1finished")
                    printl("Sequence 1 done")
                    Entities.FindByName(null, "@spheredummy").EmitSound("vo\\wheatley\\gloriousfreedom03.wav")
                    EntFire("offrails_airlock_door_1_open_rl", "trigger", "", 0, null)
                }
            }

            if (!Entities.FindByName(null, "seq2finished")) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-2692, -404, 1280), 100)) {
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "seq2finished")
                    printl("Sequence 2 done")

                    EntFire("@glados", "runscriptcode", "sp_a1_intro7_HoboTurretScene()", 0, null)

                    EntFire("myexplode2", "addoutput", "targetname playline8", 0, null)
                    EntFire("playline8", "addoutput", "targetname myexplode2", 0+ (TickSpeed * 2), null)

                    EntFire("myexplode2", "addoutput", "targetname playline9", 1.50, null)
                    EntFire("playline9", "addoutput", "targetname myexplode2", 1.50+ (TickSpeed * 2), null)

                    EntFire("myexplode2", "addoutput", "targetname playline10", 3, null)
                    EntFire("playline10", "addoutput", "targetname myexplode2", 3+ (TickSpeed * 2), null)

                    EntFire("myexplode2", "addoutput", "targetname playline11", 5, null)
                    EntFire("playline11", "addoutput", "targetname myexplode2", 5+ (TickSpeed * 2), null)

                    EntFire("myexplode2", "addoutput", "targetname playline12", 8, null)
                    EntFire("playline12", "addoutput", "targetname myexplode2", 8+ (TickSpeed * 2), null)
                }
            }

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-2207, 384, 1280), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a1_wakeup")
            }
        }
    }

    //## SP_A1_WAKEUP ##//
    if (GetMapName()=="sp_a1_wakeup") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "basement_breakers_entrance_door").Destroy()
            Entities.FindByName(null, "basement_breakers_entrance_blocker").Destroy()
            Entities.FindByName(null, "basement_breakers_entrance_blocker_trigger").Destroy()

            function elevatorrecreationsp_a1_wakeup() {
                printl("Elevator recreationsp_a1_wakeup")
                EntFire("@sphere", "DisableMotion", "", 0, null)
                Entities.FindByName(null, "@sphere").SetOrigin(Vector(11357, -819, 161))
                // Sphere attach bs
                EntFire("@sphere", "EnableMotion", "", 0.7, null)
                EntFire("@sphere", "setparent", "core_receptacle_socket", 1.1, null)
                EntFire("@sphere", "setparentattachment", "sphere_attach", 1.5, null)
                EntFire("spark_glados_fuse_place", "SparkOnce", "", 1.5, null)
                EntFire("@sphere", "PlayAttach", "", 2, null)
                EntFire("@sphere", "AddContext", "socket_name:$socket_context", 1.5, null)
                EntFire("core_receptacle_socket", "setanimation", "attach", 2, null)

                // SpA1Wakeup viewcontrols
                SpA1WakeupViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                SpA1WakeupViewcontrol.__KeyValueFromString("targetname", "SpA1WakeupViewcontrol")
                SpA1WakeupViewcontrol.__KeyValueFromString("target_team", "-1")
                SpA1WakeupViewcontrol.SetOrigin(Vector(8976, 1119, -412))
                SpA1WakeupViewcontrol.SetAngles(27, -90, 0)
                EntFire("SpA1WakeupViewcontrol", "setparent", "core_receptacle_socket", 0, null)
                EntFire("SpA1WakeupViewcontrol", "enable", "", 0.8, null)
                EntFire("SpA1WakeupViewcontrol", "disable", "", 28, null)
                EntFire("TPPLAYERS1", "addoutput", "targetname TPPLAYERS2", 27.8, null)

                SpA1WakeupViewcontrol2 <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                SpA1WakeupViewcontrol2.__KeyValueFromString("targetname", "SpA1WakeupViewcontrol2")
                SpA1WakeupViewcontrol2.__KeyValueFromString("target_team", "-1")
                SpA1WakeupViewcontrol2.SetOrigin(Entities.FindByName(null, "camera_ghostAnim_2").GetOrigin())
                EntFire("SpA1WakeupViewcontrol2", "setparent", "camera_ghostAnim_2", 0.50, null)
                EntFire("SpA1WakeupViewcontrol2", "enable", "", 74, null)
                EntFire("SpA1WakeupViewcontrol2", "disable", "", 108, null)
                EntFire("TPPLAYERS2", "addoutput", "targetname TPPLAYERS3", 74, null)
                EntFire("TPPLAYERS3", "addoutput", "targetname TPPLAYERS4", 108, null)
                // Ent Fire PIT OF PAIN AND AGONY !!!!!!!

                EntFire("glados_postwake_soundscape", "Enable", "", 2, null)
                EntFire("glados_prewake_soundscape", "Disable", "", 2, null)
                EntFire("basement_breakers_platform_clipping", "Enable", "", 2, null)

                EntFire("basement_breakers_upper_blocker", "Enable", "", 2, null)
                EntFire("@sphere", "SetIdleSequence", "sphere_plug_idle_neutral", 2, null)
                EntFire("breaker_blocker_brush", "Disable", "", 2, null)
                EntFire("@sphere", "SpeakResponseConcept", "TLK_SOCKET_POWERED", 2.1, null)
                EntFire("@sphere", "PlayLock", "", 3.50, null)
                EntFire("aud_World.LightPowerOnLg", "PlaySound", "", 3.60, null)
                EntFire("breaker_elevator_spotlight_2", "TurnOn", "", 3.60, null)
                EntFire("basement_breakers_clack", "PlaySound", "", 3.60, null)
                EntFire("music_breakers_start", "PlaySound", "", 4, null)
                EntFire("basement_breakers_start", "Trigger", "", 4, null)

                Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "TPPLAYERS1DIS")
                EntFire("TPPLAYERS1DIS", "addoutput", "targetname TPPLAYERS1", 1, null)
            }

            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)

            Entities.FindByClassnameNearest("trigger_once", Vector(8032, 1216, 487), 100).Destroy()

            Entities.FindByClassnameNearest("trigger_once", Vector(6144, 3456, 904), 100).Destroy()

            Entities.FindByName(null, "do_not_touch_anything_trigger").Destroy()

            Entities.FindByName(null, "basement_breaker_room_entry_trigger").Destroy()

            Entities.FindByName(null, "basement_breakers_socket_trigger").Destroy()

            SpA1WakeupONCE1 <- true
            SpA1WakeupONCE2 <- true
            SpA1WakeupONCE3 <- true
            NOLLFIX <- true
            TPP1 <- true
            TPP2 <- true
            TPP3 <- true
            TPP4 <- true

            SpA1WakeupPostPlayerSpawn <- true

            Entities.FindByName(null, "@basement_entry_portal_black").Destroy()
            Entities.FindByClassnameNearest("func_areaportalwindow", Vector(10364, 1080, -216), 100).__KeyValueFromString("FadeStartDist", "1750")
            Entities.FindByClassnameNearest("func_areaportalwindow", Vector(10364, 1080, -216), 100).__KeyValueFromString("FadeDist", "1950")
            Entities.FindByClassnameNearest("func_areaportalwindow", Vector(10364, 1080, -216), 100).__KeyValueFromString("targetname", "incinerator_portal_custom")
        }

        if (SSPostMapSpawn==true) {
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
            SpA1WakeupPostPlayerSpawn <- false
        }

            if (SSLoop==true) {
                if (TPP1==true) {
                    if (Entities.FindByName(null, "TPPLAYERS1")) {
                        local p = null
                        while (p = Entities.FindByClassname(p, "player")) {
                            p.SetOrigin(Vector(8548, 1204, 106))
                            p.SetVelocity(Vector(0, 0, 0))
                        }
                        TPP1 <- false
                }
            }

            if (TPP2==true) {
                if (Entities.FindByName(null, "TPPLAYERS2")) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(8947, 1062, 451))
                        p.SetVelocity(Vector(0, 0, 0))
                        p.SetAngles(20, 40, 0)
                    }
                    TPP2 <- false
                }
            }

            if (TPP3==true) {
                if (Entities.FindByName(null, "TPPLAYERS3")) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(8548, 1204, 106))
                        p.SetVelocity(Vector(0, 0, 0))
                        p.SetAngles(20, 40, 0)
                    }
                    TPP3 <- false
                }
            }

            if (TPP4==true) {
                if (Entities.FindByName(null, "TPPLAYERS4")) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(10366, 1215, 486))
                        p.SetVelocity(Vector(0, 0, 0))
                        p.SetAngles(90, 0, 0)
                    }
                    TPP4 <- false
                }
            }

                if (NOLLFIX==true) {
                    if (Entities.FindByName(null, "Startelevatorrecreationsp_a1_wakeup")) {
                        elevatorrecreationsp_a1_wakeup()
                        NOLLFIX <- false
                    }
                }

                if (SpA1WakeupONCE3 == true) {
                    local p = null
                    while (p = Entities.FindByClassnameWithin(p, "player", Vector(8976.9541015625, 1085.8822021484, -435.20544433594), 33.199999332428)) {
                        EntFire("@glados", "RunScriptCode", "sp_a1_wakeup_Do_Not_Touch()", 0, null)
                        EntFire("basement_breakers_entrance_door", "Close", "", 0, null)
                        EntFire("basement_breakers_entrance_blocker_trigger", "Enable", "", 0, null)
                        EntFire("basement_breakers_clack", "PlaySound", "", 1.60, null)

                        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "NOLLENTITY")
                        EntFire("NOLLENTITY", "addoutput", "targetname Startelevatorrecreationsp_a1_wakeup", 25, null)
                        SpA1WakeupONCE3 <- false
                    }
                }

                if (SpA1WakeupONCE2 == true) {
                    local p = null
                    while (p = Entities.FindByClassnameWithin(p, "player", Vector(9377, 1344, -415), 33.199999332428)) {
                        EntFire("basement_breakers_prop_0", "SetAnimation", "breaker_shaft_open_hatch", 0, null)
                        EntFire("light_orange_glados", "TurnOn", "", 0, null)
                        EntFire("basement_breakers_open_wav", "PlaySound", "", 0, null)
                        EntFire("@glados", "RunScriptCode", "sp_a1_wakeup_This_Is_Breaker_Room()", 0, null)
                        EntFire("breaker_bottom_light", "TurnOn", "", 0.10, null)
                        SpA1WakeupONCE2 <- false
                    }
                }

            if (SpA1WakeupPostPlayerSpawn == true) {
                try {
                Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerPickup","disablewheatleyplayerpickup")
                Entities.FindByName(null, "@sphere").ConnectOutput("OnPlayerDrop","enablewheatleyplayerpickup")
                } catch(exception) { }

                Entities.FindByName(null, "@sphere").SetOrigin(Vector(6975, 561, 412))
            }

            // Find all players within 100 units of 8032 1216 487
            local p = null
            while (p = Entities.FindByClassnameWithin(p, "player", Vector(8032, 1216, 487), 100)) {
                if (SpA1WakeupONCE1 == true) {
                    printl("Wakeup sequence started")
                    EntFire("@glados", "runscriptcode", "sp_a1_wakeup_gantry_door_open()", 0, null)
                    EntFire("training_door", "open", "", 0, null)
                    SpA1WakeupONCE1 <- false
                }
            }

            // find all players within 100 units of 6977, 493, 572
            local p = null
            while (p = Entities.FindByClassnameWithin(p, "player", Vector(6976, 568, 521), 225)) {
                if (p.GetOrigin().z >= 450) {
                    printl("Player is in the elevator")
                    if (p.GetTeam()==2) {
                        p.SetOrigin(Vector(6926, 398, 410))
                    } else {
                        p.SetOrigin(Vector(7026, 398, 410))
                    }
                    p.SetAngles(5, 90, 0)
                }
            }

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(6144, 3456, 904), 120)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_intro")
            }
        }
    }

    //## SP_A2_INTRO ##//
    if (GetMapName()=="sp_a2_intro") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "incinerator_death_fade").Destroy()
            Entities.FindByName(null, "camera_ghostAnim").Destroy()
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "incinerator_window_brush").Destroy()
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("FadeStartDist", "1750")
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("FadeDist", "1950")
            Entities.FindByName(null, "incinerator_portal").__KeyValueFromString("targetname", "incinerator_portal_custom")
            EntFire("@enable_arms", "trigger", "", 0, null)
            Entities.FindByName(null, "InstanceAuto13-dangle_ceiling-disable_arms").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2704, -1260, 112), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            printl("Ran")
            SpA2IntroViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
            SpA2IntroViewcontrol.__KeyValueFromString("targetname", "SpA2IntroViewcontrol")
            SpA2IntroViewcontrol.__KeyValueFromString("target_team", "-1")
            SpA2IntroViewcontrol.SetOrigin(Entities.FindByName(null, "ghostAnim").GetOrigin())
            EntFire("SpA2IntroViewcontrol", "setparent", "ghostAnim", 0, null)
            EntFire("SpA2IntroViewcontrol", "setparentattachment", "attach_1", 0, null)
            EntFire("SpA2IntroViewcontrol", "enable", "", 0, null)
            EntFire("SpA2IntroViewcontrolTele", "disable", "", 20.75, null)
            EntFire("SpA2IntroViewcontrol", "addoutput", "targetname SpA2IntroViewcontrolTele", 0.25, null)
            EntFire("SpA2IntroViewcontrolTele", "addoutput", "targetname SpA2IntroViewcontrolDone", 20.80, null)
            self.PrecacheSoundScript("ScriptedSequence.IncineratorFall")
            local TempEnt = Entities.CreateByClassname("prop_dynamic")
            TempEnt.__KeyValueFromString("targetname", "TempEnt")
            EntFire("TempEnt", "addoutput", "targetname PlayFallSound", 0, null)
            EntFire("PlayFallSound", "kill", "", 0 + (TickSpeed * 2), null)
        }

        if (SSLoop==true) {

            if (Entities.FindByName(null, "PlayFallSound")) {
            Entities.FindByName(null, "blue").EmitSound("playonce\\scripted_sequences\\incinerator_fall_01.wav")
            }

            if (Entities.FindByName(null, "SpA2IntroViewcontrolTele")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(2704, -1260, 92))
                }
            }

            if (Entities.FindByName(null, "SpA2IntroViewcontrolDone")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(-3308, 536, -10737))
                    p.SetAngles(0 0 0)
                }
                EntFire("SpA2IntroViewcontrolDone", "addoutput", "targetname SpA2IntroViewcontrolFinished", 0.15, null)
            }

            EntFire("shaft_areaportal_1", "open", "", 0, null)
            EntFire("shaft_areaportal_2", "open", "", 0, null)

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-736, 1594, -11038), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_intro")
            }

            // Remove the player's Portal Gun
            if (Entities.FindByName(null, "portalgun")) {
                local ent = null
                while (ent = Entities.FindByClassname(ent, "weapon_portalgun")) {
                    ent.Destroy()
                }
            }

            // Give the player a Portal Gun
            if (!Entities.FindByName(null, "portalgun")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    if (Entities.FindByName(null, "CustomPortalGun")) {
                    } else {
                        PortalGunGiveContinue <- true
                        local ent = null
                        while (ent = Entities.FindByClassnameWithin(ent, "weapon_portalgun", p.GetOrigin(), 2)) {
                            PortalGunGiveContinue <- false
                        }
                        if (PortalGunGiveContinue==true) {
                        PortalGun <- Entities.CreateByClassname("weapon_portalgun")
                        PortalGun.__KeyValueFromString("StartingTeamNum", "0")
                        PortalGun.__KeyValueFromString("targetname", "CustomPortalGun")
                        PortalGun.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, p.GetOrigin().z+20))
                        EntFireByHandle(PortalGun, "use", "", 0.25, p, p)
                        EntFireByHandle(PortalGun, "kill", "", 1.25, p, p)
                        }
                    }
                }
            }
        }
    }

    //## SP_A2_LASER_INTRO ##//
    if (GetMapName() == "sp_a2_laser_intro") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(712, 0, 0), 100).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(816, 0, -8), 100).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1224, 8, -590), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_stairs")
            }
        }
    }

    //## SP_A2_LASER_STAIRS ##//
    if (GetMapName() == "sp_a2_laser_stairs") {
        if (SSInstantRun == true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(144, 600, 94.82), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(144, 704, 72), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(148, 1126, -396), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_dual_lasers")
            }
        }
    }

    //## SP_A2_DUAL_LASERS ##//
    if (GetMapName()=="sp_a2_dual_lasers") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(640, 224, 936), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(488, 216, 960), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1063, 210, 277), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_over_goo")
            }
        }
    }

    //## SP_A2_LASER_OVER_GOO ##//
    if (GetMapName()=="sp_a2_laser_over_goo") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            Entities.FindByName(null, "@repair_wall_kill_all").Destroy()
            Entities.FindByName(null, "door_1-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2552, -1056, 142.82), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2432, -1056, 72), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(2008, -1055, -328), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_catapult_intro")
            }


        }
    }

    //## SP_A2_CATAPULT_INTRO ##//
    if (GetMapName()=="sp_a2_catapult_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_1-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-56, -1576, -384), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-64, -1696, -408), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-80, -2106, -805), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_trust_fling")
            }


        }
    }
    //## SP_A2_TRUST_FLING ##//
    if (GetMapName()=="sp_a2_trust_fling") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1152, 1616, 120), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1152, 1680, 40), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1151, 2087, -319), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_pit_flings")
            }


        }
    }

    //## SP_A2_PIT_FLINGS ##//
    if (GetMapName()=="sp_a2_pit_flings") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "walltunnel_1_Cover_clip").Destroy()
            Entities.FindByName(null, "exit_door_lock_counter").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Cube ramp disabler
            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "prop_weighted_cube", Vector(-448, -416, -104), 32)) {
                try {
                    Entities.FindByName(null, "ramp_90deg_02-ramp_close").Destroy()
                    Entities.FindByName(null, "ramp_90deg_04-ramp_close").Destroy()
                } catch(exception) { }
            }

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-893, 1223, -362), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_fizzler_intro")
            }


        }
    }

    //## SP_A2_FIZZLER_INTRO ##//
    if (GetMapName()=="sp_a2_fizzler_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(872, -64, -8), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(928, -64, -24), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1351, -71, -503), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_sphere_peek")
            }


        }
    }

    //## SP_A2_SPHERE_PEEK ##//
    if (GetMapName()=="sp_a2_sphere_peek") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-544, 1096, 464), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-544, 992, 488), 1024).Destroy()
            Cardio <- true
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            local p = null
            while (p = Entities.FindByClassnameWithin(p, "player", Vector(-1259.1446533203, 1557.3728027344, 455.14566040039), 280)) {
                Cardio <- false
            }

            // Find every player within 600 units of -1953 1570 575
            if (Cardio == true) {
                local p = null
                while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1953, 1570, 575), 600)) {
                    local p2 = Entities.FindByClassnameNearest("player", Vector(-1953, 1570, 575), 10620)
                    if (p != p2) {
                        p.SetOrigin(Vector(-2230, 1725, -90))
                        p.SetVelocity(Vector(0, 0, 0))
                    }
                }
            }
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-544, 573, 154), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_ricochet")
            }
        }
    }

    //## SP_A2_RICOCHET ##//
    if (GetMapName()=="sp_a2_ricochet") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(4008, 1152, -456), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(4064, 1152, -472), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(4478, 1158, -774), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bridge_intro")
            }
        }
    }

    //## SP_A2_BRIDGE_INTRO ##//
    if (GetMapName()=="sp_a2_bridge_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_52-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(0, 760, 56), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(0, 832, 40), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(0, 1255, -297), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bridge_the_gap")
            }
        }
    }

    //## SP_A2_BRIDGE_THE_GAP ##//
    if (GetMapName()=="sp_a2_bridge_the_gap") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy beginning door triggers
            Entities.FindByClassnameNearest("trigger_once", Vector(-1296, -640, 1280), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-496, -640, 1216), 1024).Destroy()
            // Destroy objects
            Entities.FindByClassnameNearest("trigger_once", Vector(320, 624, 960), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(320, 960, 936), 1024).Destroy()
            // Fix func_portal_detectors
            local ent = null
            while (ent = Entities.FindByClassname(ent, "func_portal_detector")) {
                ent.__KeyValueFromString("CheckAllIDs", "1")
            }
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "@sphere_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "@sphere_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(321, 1374, 561), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_turret_intro")
            }
        }
    }

    //## SP_A2_TURRET_INTRO ##//
    if (GetMapName()=="sp_a2_turret_intro") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            //Kill the last door close trigger
            Entities.FindByClassnameNearest("trigger_multiple", Vector(-174.19, 392.03, -160), 1024).Destroy()
            //Kill the changelevel trigger
            Entities.FindByName(null, "transition_trigger").Destroy()
            // Set the door logic
            TurretIntroOpenDoor <- false
            TurretIntroDoorOpened <- false
            Entities.FindByName(null, "@exit_door-testchamber_door").__KeyValueFromString("targetname", "MpModDoorOverride")
            Entities.FindByName(null, "@exit_door-door_player_clip").__KeyValueFromString("targetname", "MpModDoorClipOverride")
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Find all prop_weighted_cube entities within 24 units of 704, -512 16
            TurretIntroOpenDoor <- false
            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "prop_weighted_cube", Vector(704, -512, 8, 24), 28)) {
                TurretIntroOpenDoor <- true
            }

            local ent = null
            while (ent = Entities.FindByClassnameWithin(ent, "player", Vector(704, -512, 8, 24), 24)) {
                TurretIntroOpenDoor <- true
            }

            if (TurretIntroOpenDoor==true) {
                if (TurretIntroDoorOpened==false) {
                    // Open the door
                    EntFireByHandle(Entities.FindByName(null, "MpModDoorOverride"), "open", "", 0, null, null)
                    EntFireByHandle(Entities.FindByName(null, "MpModDoorClipOverride"), "disable", "", 0, null, null)
                    TurretIntroDoorOpened <- true
                }
            } else {
                if (TurretIntroDoorOpened==true) {
                    EntFireByHandle(Entities.FindByName(null, "MpModDoorOverride"), "close", "", 0, null, null)
                    EntFireByHandle(Entities.FindByName(null, "MpModDoorClipOverride"), "enable", "", 0, null, null)
                    TurretIntroDoorOpened <- false
                }
            }

            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-452, 196, -292), 200)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_relays")
            }
        }
    }

    //## SP_A2_LASER_RELAYS ##//
    if (GetMapName()=="sp_a2_laser_relays") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Kill the beginning door close trigger
            Entities.FindByClassnameNearest("trigger_once", Vector(1224, -704, 32), 1024).Destroy()
            // Kill the panels' relays
            Entities.FindByName(null, "animset01_kill_rl").Destroy()
            Entities.FindByName(null, "animset02_kill_rl").Destroy()
            Entities.FindByName(null, "animset03_kill_rl").Destroy()
            Entities.FindByName(null, "animset04_kill_rl").Destroy()
            Entities.FindByName(null, "animset05_kill_rl").Destroy()
            Entities.FindByName(null, "animset06_kill_rl").Destroy()
            Entities.FindByName(null, "animset07_kill_rl").Destroy()
            Entities.FindByName(null, "animset08_kill_rl").Destroy()
            Entities.FindByName(null, "lift_kill_rl").Destroy()
            // Kill the end door close trigger even though it probably isn't linked to the door relay
            Entities.FindByClassnameNearest("trigger_once", Vector(-320, -1376, 40), 1024).Destroy()
            SingleplayerOneTimeTrigger1 <- true
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSOnPlayerJoin==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
                EntFireByHandle(p, "setfogcontroller", "@environment_mines_fog", 0, null, null)
            }
        }

        if (SSLoop==true) {
            if (SingleplayerOneTimeTrigger1 == true) {
                if (!Entities.FindByClassnameNearest("trigger_once", Vector(-468, -704, -63), 10)) {
                    // Find all players
                    local p = null
                    while(p = Entities.FindByClassname(p, "player")) {
                        // Teleport them to the elevator
                        p.SetOrigin(Vector(-449, -704, -55))
                        p.SetAngles(0, 0, 0)
                        p.SetVelocity(Vector(0, 0, 0))
                    }
                    Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "TPUpLaserRelaysDIS")
                    EntFire("TPUpLaserRelaysDIS", "addoutput", "targetname TPUpLaserRelays", 12, null)
                    SingleplayerOneTimeTrigger1 <- false
                }
            }

            if (Entities.FindByName(null, "TPUpLaserRelays")) {
                local p = null
                while(p = Entities.FindByClassname(p, "player")) {
                    SKIPLaserRelays <- false
                    local p2 = null
                    while (p2 = Entities.FindByClassnameWithin(p2, "player", Vector(-319.15093994141, -1782.7447509766, -17.6354637146), 380.50416564941)) {
                        if (p2==p) {
                            SKIPLaserRelays <- true
                        }
                    }
                    if (SKIPLaserRelays == false) {
                        if (p.GetOrigin().z <= -50) {
                            p.SetOrigin(Vector(-256, -189, 28))
                            p.SetAngles(0, -90, 0)
                            p.SetVelocity(Vector(0, 0, 0))
                        }
                    }
                }
            }

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-318, -1790, -267), 50)) {
                // Reset r_flashlightbrightness
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 0.25", 0, p, p)
                }
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_turret_blocker")
            }
        }
    }

    //## SP_A2_TURRET_BLOCKER ##//
    if (GetMapName()=="sp_a2_turret_blocker") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "blast_door").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(64, 1704, 64), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(64, 1776, 40), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

            if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(63, 2185, -265), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_vs_turret")
            }
        }
    }

    //## SP_A2_LASER_VS_TURRET ##//
    if (GetMapName()=="sp_a2_laser_vs_turret") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-631, 377, 322), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-672, 384, 296), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1075, 382, -8), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_pull_the_rug")
            }


        }
    }

    //## SP_A2_PULL_THE_RUG ##//
    if (GetMapName()=="sp_a2_pull_the_rug") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "prevent_ratman_backtrack").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(64, 896, 104), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(64, 888, 96), 1024).Destroy()
            Entities.FindByClassnameNearest("prop_dynamic", Vector(80, -755, 256), 1024).SetOrigin(Vector(72, -777, 192))
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(64, 1311, -200), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_column_blocker")
            }
        }
    }

    //## SP_A2_COLUMN_BLOCKER ##//
    if (GetMapName()=="sp_a2_column_blocker") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            // Kill the point_teleport so we aren't teleporting 33 players to the exact same place
            Entities.FindByName(null, "blackout_teleport_player_to_surprise").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-976, 256, 32), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1056, 256, 40.25), 1024).Destroy()
            OnlySpA2ColumBlocker1 <- true
            OnlyOnceColumBlocker2 <- true
            OnlyOnceColumBlocker3 <- true
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
            Entities.FindByClassnameNearest("trigger_once", Vector(-1394, 108, -1906), 1024).__KeyValueFromString("spawnflags", "4161")
            Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -2591.75), 1024).__KeyValueFromString("spawnflags", "4161")
        }

        if (SSLoop==true) {
            if (OnlyOnceSpA2ColumBlocker3==true) {
                if (!Entities.FindByClassnameNearest("trigger_once", Vector(-1486, 256, -139.75), 10)) {
                    printl("Elevator viewcontrol activated")
                    // Elevator viewcontrol
                    SpA2ColumBlockerViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                    SpA2ColumBlockerViewcontrol.__KeyValueFromString("target_team", "-1")
                    SpA2ColumBlockerViewcontrol.__KeyValueFromString("fov", "100")
                    SpA2ColumBlockerViewcontrol.__KeyValueFromString("targetname", "SpA2ColumBlockerViewcontrol")
                    SpA2ColumBlockerViewcontrol.SetOrigin(Vector(-1475, 256, -90))
                    EntFire("SpA2ColumBlockerViewcontrol", "setparent", "departure_elevator-elevator_1", 0, null)
                    SpA2ColumBlockerViewcontrol.SetAngles(0, 0, 0)
                    EntFire("SpA2ColumBlockerViewcontrol", "enable", "", 0, null)

                    EntFire("global_ents-proxy", "OnProxyRelay2", "", 6.2, null)
                    EntFire("departure_elevator-bts_shadowed_light_01", "TurnOn", "", 6.2, null)
                    EntFire("departure_elevator-elevator_1", "SetSpeedReal", "50", 6.2, null)

                    OnlyOnceSpA2ColumBlockerGlobalTime <- 9
                    Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "SpA2ColumBlockerCommand")
                    EntFire("@sphere", "RunScriptCode", "ElevatorThereYouAre()", OnlyOnceSpA2ColumBlockerGlobalTime, null)
                    EntFire("departure_elevator-//spherebot_train_1_chassis_1", "MoveToPathNode", "spherebot_train_1_path_2", OnlyOnceSpA2ColumBlockerGlobalTime, null)
                    EntFire("ColumServerCommand", "command", "echo Changing level...", OnlyOnceSpA2ColumBlockerGlobalTime + 31, null)
                    EntFire("ColumServerCommand", "command", "changelevel sp_a2_laser_chaining", OnlyOnceSpA2ColumBlockerGlobalTime + 31, null)

                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(-1964, 331, -2479))
                    }

                    OnlyOnceSpA2SpA2ColumBlocker3 <- false
                }
            }

            // Delete office door after walking through it
            if (OnlyOnceSpA2ColumBlocker2==true) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-63, -780, 320), 40)) {
                    Entities.FindByName(null, "officedoor_1").Destroy()
                    OnlyOnceSpA2ColumBlocker2 <- false
                }
            }

            // Teleport players after blackout
            if (OnlyOnceSpA2ColumBlocker1==true) {
                if (!Entities.FindByClassnameNearest("trigger_once", Vector(-76, -1040, 311.5), 3)) {
                    // Find all players
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(-64, -1088, 256))
                        p.SetAngles(0, 90, 0)
                    }
                    OnlyOnceSpA2ColumBlocker1 <- false
                }
            }

            // Make Wheatley look at nearest player
            try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "departure_elevator-spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "departure_elevator-spherebot_1_bottom_swivel_1"), "SetTargetEntity", "ColumBlockerViewcontrol", 0, null, null)
            } catch(exception) {}

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1469, 265, -2870), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_laser_chaining")
            }
        }
    }

    //## SP_A2_LASER_CHAINING ##//
    if (GetMapName()=="sp_a2_laser_chaining") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(1048, 352, 320), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(1088, 352, 296), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1500, 352, -13), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_triple_laser")
            }
        }
    }

    //## SP_A2_TRIPLE_LASER ##//
    if (GetMapName()=="sp_a2_triple_laser") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            // We should do something sussy in this map, probably something the observation room (Kinda Moja)
            Entities.FindByClassnameNearest("trigger_once", Vector(6984, -5376, 40), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(6912, -5376, 40), 1024).Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(6494, -5376, -273), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bts1")
            }

            // Elevator env_projectedtexture
            try {
                EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_BTS1 ##//
    if (GetMapName()=="sp_a2_bts1") {
        if (SSInstantRun==true) {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "chamber_door-close_door_rl").Destroy()
            Entities.FindByName(null, "jailbreak_chamber_unlit-toxin_death_fade").Destroy()
            Entities.FindByName(null, "jailbreak_chamber_unlit-toxin_death_trigger").Destroy()
            Entities.FindByName(null, "pre_solved_chamber-toxin_kill_trigger").__KeyValueFromString("damage", "15")
            Entities.FindByName(null, "pre_solved_chamber-toxin_kill_trigger").__KeyValueFromString("damagecap", "15")
            Entities.FindByName(null, "pre_solved_chamber-toxin_fade").Destroy()
            Entities.FindByName(null, "pre_solved_chamber-jailbreak_wall_row_5_close_logic").Destroy()
            Entities.FindByName(null, "pre_solved_chamber-jailbreak_wall_row_6_close_logic").Destroy()
            Entities.FindByName(null, "transition_trigger").Destroy()

            Entities.FindByClassnameNearest("trigger_once", Vector(-2816, -1576, 32), 1024).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(864, -1488, -16), 1024).Destroy()

            Entities.FindByName(null, "pre_solved_chamber-chamber_bridge").__KeyValueFromString("targetname", "MPModBridgeOverride")
            EntFire("MPModBridgeOverride", "enable", "", 3, null)

            OnceTwiceSp_A2_Bts1 <- true
            OneTimeRunSp_A2_Bts1 <- true
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Bridge drop trigger
            if (OnceTwiceSp_A2_Bts1==true) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(836.91394042969, -1589.0966796875, -30.565340042114), 104.79999542236)) {
                    EntFire("@glados", "RunScriptCode", "JailbreakBridgeDisappear()", 0, null)
                    EntFire("MPModBridgeOverride", "disable", "", 0, null)
                    OnceTwiceSp_A2_Bts1 <- false
                }
            }

            // Exit Test Trigger
            if (OneTimeRunSp_A2_Bts1==true) {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-3004.51953125, -1652.0881347656, 58.625823974609), 72.800002098083)) {
                    EntFire("jailbreak_chamber_unlit-jailbreak_flashlight", "TurnOff", "", 1, null)
                    EntFire("@sphere", "DisableFlashlight", "", 0, null)
                    EntFire("@glados", "RunScriptCode", "JailbreakWheatleyCloseChamber()", 0, null)
                    OneTimeRunSp_A2_Bts1 <- false
                }
            }

            // Make Wheatley look at nearest player
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Teleport bois to spawn
            if (Entities.FindByName(null, "jailbreak_chamber_lit-jailbreak_trigger")) {
                local p = null
                while(p = Entities.FindByClassnameWithin(p, "player", Vector(-3792, -1128, 142), 350)) {
                    if (p.GetTeam()==2) {
                        p.SetOrigin(Vector(-10066, -2281, 0))
                    } else {
                        p.SetOrigin(Vector(-10066, -2581, 0))
                    }
                }
            } else {
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-9915.5029296875, -2433.4301757812, -34.047546386719), 369.50420379639)) {
                    p.SetOrigin(Vector(-3482.0803222656, -2117.7331542969, 20.649803161621))
                }
                local p = null
                while (p = Entities.FindByClassnameWithin(p, "player", Vector(-9241.060546875, -2418.1635742188, 104.73459625244), 200)) {
                    p.SetOrigin(Vector(-3481.3332519531, -2119.4982910156, 20.3405418396))
                }
            }

            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1253.4089355469, -1319.4395751953, -320.2317199707), 104.79999542236)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bts2")
            }
        }
    }

    //## SP_A2_BTS2 ##//
    if (GetMapName()=="sp_a2_bts2") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "player_clip").Destroy()
            Entities.FindByName(null, "player_died_relay").Destroy()
            Entities.FindByName(null, "transition_trigger").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(1332, -250, 296), 100).__KeyValueFromString("targetname", "StartDeathEventMPMod")
            Entities.FindByClassnameNearest("trigger_once", Vector(2208, 1468, 304), 100).__KeyValueFromString("targetname", "EndDeathEventMPMod")
            Entities.FindByName(null, "pillar_fx_D_start_rl").Destroy()
            Entities.FindByName(null, "container_1_catwalk_hurt_1_rl").Destroy()
            Entities.FindByName(null, "catwalk_fx_E_1").__KeyValueFromString("targetname", "my mom")
            Entities.FindByName(null, "container_1_catwalk_hurt_2_floor").__KeyValueFromString("targetname", "my dad")
            OnlyOnceSp_A2_Bts2 <- true
            PreviousTimeSp_A2_Bts2 <- 0
            PreviousTimeSp_A2_Bts2Again <- 0
            NoPlayerMadeItOnlyOnceSp_A2_Bts2 <- true
            OnlyOnceSp_A2_Bts2AgainV2 <- true
        }

        if (SSPostPlayerSpawn==true) {
            local ent = null
            while (ent = Entities.FindByModel(ent, "models/anim_wp/room_transform/arm_exterior.mdl")) {
                EntFireByHandle(ent, "setanimation", "block_upper01_drop_idle", 0, null, null)
                ent.__KeyValueFromString("DefaultAnim", "block_upper01_drop_idle")
                local ent2 = null
                while (ent2 = Entities.FindByClassnameWithin(ent2, "prop_dynamic", Vector(1490, -4311, 128), 300)) {
                    if (ent == ent2) {
                        ent2.Destroy()
                    }
                }
            }
        }

        if (SSLoop==true) {
            // if a player made it teleport everyone into the elevator
            local p = null
            while (p = Entities.FindByClassnameWithin(p, "player", Vector(2207.8967285156, 1452.6505126953, 264.08181762695), 40)) {
                if (OnlyOnceSp_A2_Bts2AgainV2==true) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(2202, 1454, 303))
                        p.SetAngles(0, -90, 0)
                        p.SetVelocity(Vector(0, 0, 0))
                    }
                    OnlyOnceSp_A2_Bts2AgainV2 <- false
                }
            }

            // if no player made it, show a message and restart the level
            if (!Entities.FindByName(null, "StartDeathEventMPMod")) {
                if (OnlyOnceSp_A2_Bts2 == true) {
                    PreviousTimeSp_A2_Bts2 <- Time()
                    OnlyOnceSp_A2_Bts2 <- false
                }
                if (PreviousTimeSp_A2_Bts2 + 31 <= Time()) {
                    if (Entities.FindByName(null, "EndDeathEventMPMod")) {
                        if (NoPlayerMadeItOnlyOnceSp_A2_Bts2 == true) {
                            printl("No player made it")
                            PreviousTimeSp_A2_Bts2Again <- Time()
                            onscreendisplay.__KeyValueFromString("message", "Nobody escaped...")
                            onscreendisplay.__KeyValueFromString("holdtime", "3")
                            onscreendisplay.__KeyValueFromString("fadeout", "2")
                            onscreendisplay.__KeyValueFromString("fadein", "1.25")
                            onscreendisplay.__KeyValueFromString("spawnflags", "1")
                            onscreendisplay.__KeyValueFromString("color", "230 30 30")
                            onscreendisplay.__KeyValueFromString("channel", "1")
                            onscreendisplay.__KeyValueFromString("x", "0.425")
                            onscreendisplay.__KeyValueFromString("y", "-0.2")

                            local envfade = Entities.CreateByClassname("env_fade")
                            envfade.__KeyValueFromString("duration", "5")
                            envfade.__KeyValueFromString("holdtime", "10")
                            envfade.__KeyValueFromString("ReverseFadeDuration", "0")
                            envfade.__KeyValueFromString("rendercolor", "0 0 0")
                            envfade.__KeyValueFromString("renderamt", "255")
                            envfade.__KeyValueFromString("targetname", "FadeyBoi")
                            DoEntFire("onscreendisplaympmod", "display", "", 0.0, null, null)
                            DoEntFire("FadeyBoi", "fade", "", 0.0, null, null)
                            NoPlayerMadeItOnlyOnceSp_A2_Bts2 <- false
                        }

                        if (PreviousTimeSp_A2_Bts2Again + 6.75 <= Time()) {
                            SendToConsole("commentary 1")
                            SendToConsole("changelevel sp_a2_bts2")
                        }
                    }
                }
            }


            // Make Wheatley look at nearest player
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(2207, 1983, 689), 150)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bts3")
            }

            // Fix the player's spawn position
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(825, -3756, 240), 25)) {
                p.SetOrigin(Vector(772, -3780, 64))
                p.SetAngles(0, -90, 0)
                p.SetVelocity(Vector(0, -90, 0))
            }
        }
    }

    //## SP_A2_BTS3 ##//
    if (GetMapName()=="sp_a2_bts3") {
        if (SSInstantRun==true) {
            // Destroy objects
            Entities.FindByName(null, "death_fade").Destroy()
            Entities.FindByName(null, "death_fade").Destroy()
            Entities.FindByName(null, "death_fade").Destroy()
            Entities.FindByName(null, "blackout_teleport_player_to_wheatley").Destroy()
            Entities.FindByName(null, "laser_cutter_room_kill_relay").Destroy()
            Entities.FindByName(null, "fizzle_backtrack_trigger").Destroy()
            Entities.FindByName(null, "backtrack_portal_blocker").Destroy()
            Entities.FindByName(null, "backtrack_fun_preventer").Destroy()
            Entities.FindByName(null, "tube_scanner_room-shutdown_tube_objects").Destroy()
            Entities.FindByClassnameNearest("logic_auto", Vector(4231, 990, 194), 20).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(5952, 4624, -1736), 20).Destroy()
            // Set func_portal_detector to detect all portals
            Entities.FindByName(null, "blindness_detector").__KeyValueFromString("CheckAllIDs", "1")
        }

        if (SSPostPlayerSpawn==true) {
            EntFireByHandle(Entities.FindByName(null, "entry_canyon_global_impact_sound"), "PlaySound", "", 1.8, null, null)
            EntFireByHandle(Entities.FindByName(null, "entry_canyon_shake"), "StartShake", "", 1.8, null, null)
            EntFireByHandle(Entities.FindByName(null, "security_door_2_door_spark_1"), "StartSpark", "", 3, null, null)
            EntFireByHandle(Entities.FindByName(null, "entry_airlock_door-proxy"), "OnProxyRelay7", "", 3, null, null)
            EntFireByHandle(Entities.FindByName(null, "entry_container_impact_relay"), "Trigger", "", 5, null, null)
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(5952, 4624, -1736), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bts4")
            }
        }
    }

    //## SP_A2_BTS4 ##//
    if (GetMapName()=="sp_a2_bts4") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "canyon_death_fade").Destroy()
            Entities.FindByName(null, "death_fade").Destroy()
            Entities.FindByName(null, "gib_conveyor_shutdown_relay").Destroy()
            Entities.FindByName(null, "dummy_shoot_entry_door_clip").Destroy()
            // By deleting these doors players can glitch a trigger and make Wheatley trigger a privious line.
            // To solve this we detect when scanner_socket_new_turret_trigger doesn't exist and then we do something (Moja)
            Entities.FindByName(null, "control_room_blocking_doors").Destroy()
            Entities.FindByName(null, "control_room_blocking_doors").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(800, -2896, 7224), 20).Destroy()
            // We need to recreate this trigger because it destroys portals and sets up the next area (Moja)
            Entities.FindByClassnameNearest("trigger_once", Vector(2192, -6295.99, 6704), 20).Destroy()
            // Delete these because they close doors and delete parts of the map
            Entities.FindByClassnameNearest("trigger_once", Vector(-768, -7372, 6784), 20).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-4080, -7232, 6328), 20).Destroy()
            // Fix dummy room door closing
            local ent = Entities.FindByName(null, "dummy_shoot_entry_door").__KeyValueFromString("targetname", "moja")
            EntFire("moja", "setanimation", "open", 2, null)
        }

        if (SSPostPlayerSpawn==true) {
            EntFireByHandle(Entities.FindByName(null, "@transition_script"), "RunScriptCode", "OnPostTransition()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "entry_airlock_door-proxy"), "OnProxyRelay1", "", 1.5, null, null)
        }

        if (SSLoop==true) {
            // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-4080, -7232, 6328), 64)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a2_bts5")
            }
        }
    }

    //## SP_A2_BTS5 ##//
    // We need to do something with the elevator or use teleports so all players can get up (Moja)
    // We also need to polish the point_viewcontrol somehow to better funnel the players into the vactube (Moja)
    if (GetMapName()=="sp_a2_bts5") {
        if (SSInstantRun==true) {
            // Open the airlock areaportal on mapspawn
            EntFireByHandle(Entities.FindByName(null, "airlock_door_01_areaportal"), "Open", "", 0, null, null)
            // Set sv_allow_mobile_portals to 1 and set up the changelevel command entity
            Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "Sp_A2_Bts5ServerCommand")
            EntFire("Sp_A2_Bts5ServerCommand", "command", "sv_allow_mobile_portals 1", 1, null)
            // Set the viewcontrol parent first stop to a our pathtrack
            EntFireByHandle(Entities.FindByName(null, "podtrain_player"), "target", "tube_path1", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "airlock_door_01-close_door_fast").Destroy()
            Entities.FindByName(null, "lock_door_trigger").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(3794.06, -1727.98, 3488), 20).Destroy()
            OnlyOnceSp_A2_Bts5 <- true
        }

        if (SSPostPlayerSpawn==true) {
            Entities.FindByName(null, "airlock_door_01_areaportal").__KeyValueFromString("targetname", "moja")
            EntFireByHandle(Entities.FindByName(null, "@transition_script"), "RunScriptCode", "OnPostTransition()", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "exit_airlock_door-proxy"), "OnProxyRelay1", "", 0.5, null, null)
        }

        if (SSLoop==true) {
            if (OnlyOnceSp_A2_Bts5==true) {
                if (!Entities.FindByName(null, "exit_tube_1_exit_trigger")) {
                    printl("Suction viewcontrol activated")
                    // Sp_A2_Bts5 viewcontrol
                    Sp_A2_Bts5Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                    Sp_A2_Bts5Viewcontrol.__KeyValueFromString("target_team", "-1")
                    Sp_A2_Bts5Viewcontrol.__KeyValueFromString("fov", "100")
                    Sp_A2_Bts5Viewcontrol.__KeyValueFromString("targetname", "Sp_A2_Bts5Viewcontrol")
                    Sp_A2_Bts5Viewcontrol.SetOrigin(Vector(2285, 512, 4508))
                    EntFire("Sp_A2_Bts5Viewcontrol", "setparent", "podtrain_player", 0, null)
                    Sp_A2_Bts5Viewcontrol.SetAngles(0, 180, 0)
                    EntFire("Sp_A2_Bts5Viewcontrol", "enable", "", 0, null)

                    local tube_path1 = Entities.CreateByClassname("path_track")
                    tube_path1.__KeyValueFromString("targetname", "tube_path1")
                    tube_path1.__KeyValueFromString("target", "tube_path2")
                    tube_path1.__KeyValueFromString("orientationtype", "0")

                    EntFire("Sp_A2_Bts5ServerCommand", "command", "echo Changing level...", 2, null)
                    EntFire("Sp_A2_Bts5ServerCommand", "command", "changelevel sp_a2_bts6", 2, null)

                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(-1964, 331, -2479))
                    }

                    OnlyOnceSp_A2_Bts5 <- false
                }
            }
            // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A2_BTS6 ##//
    if (GetMapName()=="sp_a2_bts6") {
        if (SSInstantRun==true) {
            // Set up the changelevel command entity
            Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "Sp_A2_Bts6ServerCommand")
            // Destroy objects
            Entities.FindByName(null, "tube_ride_start_relay").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            printl("Ran")
            // Fire every single event in the map
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_1"), "SetAnimation", "bts6_A5", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_2"), "SetAnimation", "bts6_A4", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_3"), "SetAnimation", "bts6_A3", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_4"), "SetAnimation", "bts6_A2", 0.6, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_ride_chell_animation"), "SetAnimationNoReset", "chell_bts6", 2, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_ride_viewproxy"), "Enable", "", 2, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_ride_wheatley_animation"), "SetAnimationNoReset", "wheatley_bts6", 2, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_5"), "SetAnimation", "bts6_A1", 2.8, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "RunScriptCode", "GladosPlayVcd(392)", 3, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_6"), "SetAnimation", "bts6_A1", 4, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_7"), "SetAnimation", "bts6_A1", 5, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_8"), "SetAnimation", "bts6_A2", 7, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_9"), "SetAnimation", "bts6_A1", 9, null, null)
            EntFireByHandle(Entities.FindByName(null, "@sphere"), "DisableFlashlight", "", 10, null, null)
            EntFireByHandle(Entities.FindByName(null, "shadowed_light_01"), "TurnOn", "", 10.1, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_main_prop_10"), "SetAnimation", "bts6_A2", 12, null, null)
            EntFireByHandle(Entities.FindByName(null, "shadowed_light_02"), "TurnOn", "", 18, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_loopy_start"), "Trigger", "", 18, null, null)
            EntFireByHandle(Entities.FindByName(null, "@cube_kill_rl"), "Trigger", "", 20, null, null)
            EntFireByHandle(Entities.FindByName(null, "tuberide_section_1_areaportal_1"), "Close", "", 20, null, null)
            EntFireByHandle(Entities.FindByName(null, "tuberide_section_1_areaportal_1_blackbrush"), "Enable", "", 20, null, null)
            EntFireByHandle(Entities.FindByName(null, "@glados"), "RunScriptCode", "GladosPlayVcd(393)", 29, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_straight_start"), "Trigger", "", 32, null, null)
            EntFireByHandle(Entities.FindByName(null, "tube_collision_start"), "Trigger", "", 36.75, null, null)
            EntFireByHandle(Entities.FindByName(null, "shadowed_light_03"), "TurnOn", "", 37, null, null)

            // Sp_A2_Bts6 viewcontrol creation
            Sp_A2_Bts6Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
            Sp_A2_Bts6Viewcontrol.__KeyValueFromString("targetname", "Sp_A2_Bts6Viewcontrol")
            Sp_A2_Bts6Viewcontrol.__KeyValueFromString("target_team", "-1")
            Sp_A2_Bts6Viewcontrol.SetOrigin(Entities.FindByName(null, "tube_ride_chell_proxy").GetOrigin())
            Sp_A2_Bts6Viewcontrol.SetAngles(270, 0, 0)
            EntFire("Sp_A2_Bts6Viewcontrol", "setparent", "tube_ride_chell_proxy", 0, null)
            EntFire("Sp_A2_Bts6Viewcontrol", "setparentattachment", "chell_bts6_attach", 0, null)
            EntFire("Sp_A2_Bts6Viewcontrol", "enable", "", 0, null)
            EntFire("Sp_A2_Bts6Viewcontrol", "disable", "", 50.66, null)

            EntFire("Sp_A2_Bts6ServerCommand", "command", "echo Changing level...", 51, null)
            EntFire("Sp_A2_Bts6ServerCommand", "command", "changelevel sp_a2_core", 51, null)
        }
    }

    //## SP_A2_CORE ##//
    if (GetMapName()=="sp_a2_core") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "death_fade").Destroy()
            Entities.FindByName(null, "rv_trap_portal_surf_cleanser").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(0, 304, -10438), 20).Destroy()
            OnlyOnceSp_A2_Core <- true
            TPSp_A2_Core <- true
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSOnPlayerJoin==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
                EntFireByHandle(p, "setfogcontroller", "@environment_darkness_fog", 0, null, null)
            }
        }

        if (SSLoop==true) {
            if (OnlyOnceSp_A2_Core==true) {
                if (!Entities.FindByName(null, "exit_elevator_departure_trigger")) {
                    printl("Elevator viewcontrol activated")
                    // Elevator viewcontrol
                    Sp_A2_CoreViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                    Sp_A2_CoreViewcontrol.__KeyValueFromString("target_team", "-1")
                    Sp_A2_CoreViewcontrol.__KeyValueFromString("targetname", "Sp_A2_CoreViewcontrol")
                    Sp_A2_CoreViewcontrol.SetOrigin(Vector(0, 324, 0))
                    EntFire("Sp_A2_CoreViewcontrol", "setparent", "exit_elevator_train", 0, null)
                    Sp_A2_CoreViewcontrol.SetAngles(0, 270, 0)
                    EntFire("Sp_A2_CoreViewcontrol", "enable", "", 0, null)
                    EntFire("Sp_A2_CoreViewcontrol", "disable", "", 144.8, null)

                    Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "Sp_A2_CoreServerCommand")
                    Entities.FindByName(null, "rv_trap_floor_down_door_1").Destroy()
                    EntFire("Sp_A2_CoreServerCommand", "command", "echo Changing level...", 150.8, null)
                    EntFire("Sp_A2_CoreServerCommand", "command", "changelevel sp_a3_00", 150.8, null)

                    // First teleport behind the panels so players can't be seen from the elevator
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(0, 768, 64))
                        p.SetVelocity(Vector(0, 0, 0))
                    }

                    OnlyOnceSp_A2_Core <- false
                }
            }

            // Second teleport into the elevator
            if (TPSp_A2_Core==true) {
                if (!Entities.FindByName(null, "rv_trap_floor_down_door_1")) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(0, 290, -200))
                        p.SetVelocity(Vector(0, 0, 0))
                        p.SetAngles(80, 270, 0)
                    }
                    TPSp_A2_Core <- false
                }
            }

            // Make central core point at nearest player (We need it to stop pointing at the player when core transfer begins) (Moja)
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "glados_pointer").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "glados_pointer"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make core receptacle point at nearest player (We need it to stop pointing at the player when core transfer begins) (Moja)
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "core_receptacle_pointer_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "core_receptacle_pointer_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make primary panel pointer target the nearest player
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "shield_1_pointer_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "shield_1_pointer_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}

            // Make secondary panel pointer target the nearest player
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "shield_1_pointer_2").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "shield_1_pointer_2"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A3_00 ##//
    if (GetMapName()=="sp_a3_00") {
        if (SSInstantRun==true) {
            Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "Sp_A3_00ServerCommand")
            printl(Entities.FindByName(null, "@environment_mines_fog").__KeyValueFromString("fogmaxdensity", "1"))
            Entities.FindByName(null, "@environment_mines_fog").__KeyValueFromString("fogend", "1")
            Entities.FindByName(null, "@environment_bottomless_pit_falling_fog").__KeyValueFromString("farz", "0")
            Entities.FindByName(null, "potatos_prop").__KeyValueFromString("solid", "0")
            // Destroy objects
            Entities.FindByClassnameNearest("logic_auto", Vector(144, -4048, 64), 20).Destroy()
            local ent = null
            while (ent = Entities.FindByClassname(ent, "trigger_push")) {
                ent.Destroy()
            }
        }

        if (SSPostPlayerSpawn==true) {
            EntFireByHandle(Entities.FindByName(null, "player_looktarget"), "SetParent", "!player", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "potatos_tank"), "SetTargetEntity", "player_looktarget", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "shaft_section_0"), "StartForward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "shaft_section_1"), "StartForward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "lift_mover"), "Open", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "ambient_sp_a3_01_b1"), "PlaySound", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "potatos_relay"), "Trigger", "", 3, null, null)
            EntFireByHandle(Entities.FindByName(null, "potatos_train"), "StartForward", "", 4, null, null)

            EntFire("Sp_A3_00ServerCommand", "command", "echo Changing level...", 76, null)
            EntFire("Sp_A3_00ServerCommand", "command", "changelevel sp_a3_01", 76, null)
        }

        if (SSLoop==true) {
            // Make POTATOS tank point at nearest player
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "potatos_tank").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "potatos_tank"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}
        }
    }

    //## SP_A3_01 ##//
    if (GetMapName()=="sp_a3_01") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "transition_trigger").Destroy()
            Entities.FindByClassnameNearest("logic_auto", Vector(-10304, 2544, 112), 20).Destroy()
            OnlyOnceSp_A3_01 <- true
        }

        if (SSPostPlayerSpawn==true) {
            EntFireByHandle(Entities.FindByName(null, "global_ents-proxy"), "OnProxyRelay8", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "knockout_start"), "Trigger", "", 1, null, null)

            printl("Ran")
            Sp_A3_01Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
            Sp_A3_01Viewcontrol.__KeyValueFromString("targetname", "Sp_A3_01Viewcontrol")
            Sp_A3_01Viewcontrol.__KeyValueFromString("target_team", "-1")
            Sp_A3_01Viewcontrol.SetOrigin(Entities.FindByName(null, "knockout-viewcontroller").GetOrigin())
            Sp_A3_01Viewcontrol.SetAngles(0, 270, 0)
            EntFire("Sp_A3_01Viewcontrol", "setparent", "knockout-viewcontroller", 0, null)
            EntFire("Sp_A3_01Viewcontrol", "setparentattachment", "knockout-viewcontroller", 0, null)
            EntFire("Sp_A3_01Viewcontrol", "enable", "", 0, null)
            EntFire("Sp_A3_01ViewcontrolTele", "disable", "", 13, null)
            EntFire("Sp_A3_01Viewcontrol", "addoutput", "targetname Sp_A3_01ViewcontrolTele", 0.25, null)
            EntFire("Sp_A3_01ViewcontrolTele", "addoutput", "targetname Sp_A3_01ViewcontrolDone", 13.30, null)
        }

        if (SSLoop==true) {

            if (Entities.FindByName(null, "Sp_A3_01ViewcontrolTele")) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(-162, -1966, 20))
                }
            }

            if (OnlyOnceSp_A3_01 == true) {
                if (Entities.FindByName(null, "Sp_A3_01ViewcontrolDone")) {
                    local p = null
                    while (p = Entities.FindByClassname(p, "player")) {
                        p.SetOrigin(Vector(-720, -1852, 10))
                        p.SetAngles(0, 90, 0)
                        Entities.FindByName(null, "knockout-viewcontroller-prop").Destroy()
                        Entities.FindByName(null, "knockout-portalgun").Destroy()
                    }
                    OnlyOnceSp_A3_01 <- false
                }
            }

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(6016, 4496, -448), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_03")
            }
        }
    }

    //## SP_A3_03 ##//
    if (GetMapName()=="sp_a3_03") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "pumproom_door_bottom_prop").__KeyValueFromString("targetname", "moja1")
            Entities.FindByName(null, "pumproom_door_bottom_portal").__KeyValueFromString("targetname", "moja2")
            // Here if we need to ent_fire something
            EntFireByHandle(Entities.FindByName(null, "pumproom_door_bottom_button"), "addoutput", "OnPressed moja1:SetAnimation:open", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "moja2"), "Open", "", 1, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
            Entities.FindByName(null, "main_elevator_bottom_clipbrush").Destroy()
            Entities.FindByName(null, "silent_fizzler").Destroy()
            Entities.FindByName(null, "@transition_from_map").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-6080, -2812, -5160), 20).Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSOnPlayerJoin==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
                EntFireByHandle(p, "setfogcontroller", "@environment_lake_fog", 0, null, null)
            }
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-3631, 1284, -2100), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_jump_intro")
            }
        }
    }

    //## SP_A3_JUMP_INTRO ##//
    if (GetMapName()=="sp_a3_jump_intro") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-8880, 2096, -412), 20).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(-676, 896, 448), 20).Destroy()
            OnlyOnceSp_A3_Jump_Intro <- true
        }

        if (SSPostPlayerSpawn==true) {
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto12-entrance_lift_train"), "StartForward", "", 2, null, null)
            OnlyOnceSp_A3_Jump_Intro <- false
        }

        if (SSLoop==true) {
            if (OnlyOnceSp_A3_Jump_Intro == true) {
                local p = null
                while (p = Entities.FindByClassname(p, "player")) {
                    p.SetOrigin(Vector(-8880, 2096, -458))
                }
            }

            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-668, 2080, 2314), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_bomb_flings")
            }
        }
    }

    //## SP_A3_BOMB_FLINGS ##//
    if (GetMapName()=="sp_a3_bomb_flings") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto8-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-256, 1570, 1288), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_crazy_box")
            }
        }
    }

    //## SP_A3_CRAZY_BOX ##// What do we do if the players vaporize the box?
    if (GetMapName()=="sp_a3_crazy_box") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto17-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death").Destroy()
            Entities.FindByName(null, "AutoInstance1-door_close").Destroy()
            Entities.FindByName(null, "AutoInstance1-door_pushers").Destroy()
            Entities.FindByName(null, "AutoInstance1-door_pushers").Destroy()
            // We need to add a trigger to the crazy box test that plays ambient_sp_a3_crazy_box_b2 (Moja)
            Entities.FindByClassnameNearest("trigger_once", Vector(144, -1280, 1600), 20).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(200, -1272, 1600), 20).Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(640, 174, 2740), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_transition01")
            }
        }
    }

    //## SP_A3_TRANSITION01 ##//
    if (GetMapName()=="sp_a3_transition01") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto2-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fall_death_fade").Destroy()
            Entities.FindByName(null, "pumproom_door_bottom_trigger").Destroy()
            Entities.FindByName(null, "pumproom_door_top_prop").__KeyValueFromString("targetname", "moja1")
            Entities.FindByName(null, "pumproom_portal_top").__KeyValueFromString("targetname", "moja2")
            // Here if we need to ent_fire something
            EntFireByHandle(Entities.FindByName(null, "pumproom_door_top_button"), "addoutput", "OnPressed moja1:SetAnimation:open", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "moja2"), "Open", "", 1, null, null)
        }

        if (SSPostPlayerSpawn==true) {
            Entities.FindByName(null, "officedoor_4").__KeyValueFromString("targetname", "moja3")
        }

        if (SSOnPlayerJoin==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
                EntFireByHandle(p, "setfogcontroller", "@environment_lake_fog", 0, null, null)
            }
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-2048, -130, -3750), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_speed_ramp")
            }
        }
    }

    //## SP_A3_SPEED_RAMP ##//
    if (GetMapName()=="sp_a3_speed_ramp") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto20-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
            Entities.FindByName(null, "fade_to_death-fade_to_death").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1232, -642, 962), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_speed_flings")
            }
        }
    }

    //## SP_A3_SPEED_FLINGS ##//
    if (GetMapName()=="sp_a3_speed_flings") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto6-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
            Entities.FindByName(null, "fade_to_death-fade_to_death").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(396, 1152, 656), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_portal_intro")
            }
        }
    }

    //## SP_A3_PORTAL_INTRO ##//
    if (GetMapName()=="sp_a3_portal_intro") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "1970s_door1door_lower").__KeyValueFromString("targetname", "moja1")
            Entities.FindByName(null, "1970s_door1door_upper").__KeyValueFromString("targetname", "moja2")
            Entities.FindByName(null, "1970s_door_1_areaportal").__KeyValueFromString("targetname", "moja3")
            Entities.FindByName(null, "1970s_door2_door_lower").__KeyValueFromString("targetname", "moja4")
            Entities.FindByName(null, "1970s_door2_door_upper").__KeyValueFromString("targetname", "moja5")
            Entities.FindByName(null, "1970s_door_2_areaportal").__KeyValueFromString("targetname", "moja6")
            Entities.FindByName(null, "bowl_areaportal").__KeyValueFromString("targetname", "moja7")
            Entities.FindByName(null, "paint_sprayer_2").__KeyValueFromString("targetname", "moja8")
            // Here if we need to ent_fire something
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "addoutput", "OnTrigger moja4:Open", 1, null, null)
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "addoutput", "OnTrigger moja5:Open", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "sphere_entrance_lift_train_path_2"), "addoutput", "OnPass moja8:Start", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "moja3"), "Open", "", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "moja6"), "Open", "", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "moja7"), "Open", "", 1, null, null)
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "abyss_loadsaved").Destroy()
            Entities.FindByName(null, "bowl_areaportal_blackbrush").Destroy()
            Entities.FindByName(null, "damaged_sphere_door_3-door_close").Destroy()
            Entities.FindByName(null, "damaged_sphere_door_4-door_close").Destroy()
            Entities.FindByName(null, "liftshaft_entrance_door-door_close").Destroy()
            Entities.FindByName(null, "transition_trigger").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2400, 1360, -1920), 20).Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2416, -128, 640.01), 20).Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(3839.99, 348.8, 5674.67), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a3_end")
            }
        }
    }

    //## SP_A3_END ##//
    if (GetMapName()=="sp_a3_end") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "entrance_door_prop").__KeyValueFromString("targetname", "moja1")
            Entities.FindByName(null, "paint_trickle_blue_1").__KeyValueFromString("targetname", "moja2")
            Entities.FindByName(null, "paint_trickle_white_1").__KeyValueFromString("targetname", "moja3")
            Entities.FindByName(null, "paint_trickle_orange_1").__KeyValueFromString("targetname", "moja4")
            Entities.FindByName(null, "paint_trickle_blue_2").__KeyValueFromString("targetname", "moja5")
            Entities.FindByName(null, "paint_trickle_blue_2").__KeyValueFromString("targetname", "moja5")
            Entities.FindByName(null, "paint_trickle_white_2").__KeyValueFromString("targetname", "moja6")
            // Here if we need to ent_fire something
            EntFireByHandle(Entities.FindByName(null, "entrance_door_button"), "addoutput", "OnPressed moja1:SetAnimation:open", 1, null, null)
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "addoutput", "OnTrigger moja3:Start", 1, null, null)
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "addoutput", "OnTrigger moja4:Start", 1, null, null)
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "addoutput", "OnTrigger moja5:Start", 1, null, null)
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-552, 256, -2200), 20), "addoutput", "OnTrigger moja6:Start", 1, null, null)
            // Fix func_portal_detectors
            local ent = null
            while (ent = Entities.FindByClassname(ent, "func_portal_detector")) {
                ent.__KeyValueFromString("CheckAllIDs", "1")
            }
            // Destroy objects
            Entities.FindByName(null, "fade_to_death").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSOnPlayerJoin==true) {
            // Find all players
            local p = null
            while (p = Entities.FindByClassname(p, "player")) {
                EntFireByHandle(clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
                EntFireByHandle(p, "setfogcontroller", "@environment_lake_fog", 0, null, null)
            }
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(-1540, -830, 3840), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_intro")
            }
        }
    }

    //## SP_A4_INTRO ##//
    if (GetMapName()=="sp_a4_intro") {
        if (SSInstantRun==true) {
            Entities.FindByName(null, "@exit_door1-proxy").__KeyValueFromString("targetname", "moja1")
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "button_1_pressed"), "addoutput", "OnTrigger moja1:OnProxyRelay2:open", 1, null, null)
            EntFireByHandle(Entities.FindByName(null, "button_1_unpressed"), "addoutput", "OnTrigger moja1:OnProxyRelay1:close", 1, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByName(null, "@entrance_door1-close_door_rl").Destroy()
            Entities.FindByName(null, "cube_bot_model").Destroy()
            Entities.FindByName(null, "room2_wall_close").Destroy()
            Entities.FindByName(null, "room2a_wall_close").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_tb_intro")
            }
        }
    }

        //## SP_A4_TB_INTRO ##//
    if (GetMapName()=="sp_a4_tb_intro") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "door_0-door_close_relay"), "Kill", "", 0, null, null)
            // Allow starting door to stay open once opened
            Entities.FindByName(null, "door_0-door_close_relay").Destroy()
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(2368, 736, 72), 1).Destroy() // Keep starting door open
            Entities.FindByClassnameNearest("trigger_once", Vector(2368, 736, 64), 1).Destroy() // Keep exit door open
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(2784, 736, 432), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_tb_trust_drop")
            }
        }
    }

        //## SP_A4_TB_TRUST_DROP ##//
    if (GetMapName()=="sp_a4_tb_trust_drop") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(320, 1080, 928), 1).Destroy() // Keep starting door open
            Entities.FindByClassnameNearest("trigger_once", Vector(624, 448, 960), 1).Destroy() // Keep exit door open
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1120, 448, 1328), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_tb_wall_button")
            }
        }
    }

        //## SP_A4_TB_WALL_BUTTON ##//
    if (GetMapName()=="sp_a4_tb_wall_button") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
            Entities.FindByClassnameNearest("trigger_once", Vector(144, 2112, 128), 1).Destroy() // Keep starting door open
            Entities.FindByClassnameNearest("trigger_once", Vector(864, 960, 168), 1).Destroy() // Keep exit door open
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1280, 960, 528), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel sp_a4_tb_polarity")
            }
        }
    }
}

//////////////////////
// Boilerplate code //
//////////////////////

/*

    // Use with new Aperture maps //

    //## MAPNAME ##//
    if (GetMapName()=="LEVELNAME") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        }

        if (SSPostPlayerSpawn==true) {
            NewApertureStartElevatorFixes()
        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel LEVELNAME")
            }
        }
    }

    // Use with maps without entrance or exit elevators //

    //## MAPNAME ##//
    if (GetMapName()=="LEVELNAME") {
        if (SSInstantRun==true) {
            // Here if we need to ent_fire something
            EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
            // Destroy objects
            Entities.FindByName(null, "NAME").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Make our own changelevel trigger
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 50)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel LEVELNAME")
            }
        }
    }

    // Use with old Aperture maps //

    //## MAPNAME ##//
    if (GetMapName()=="LEVELNAME") {
        if (SSInstantRun==true) {
            // Make elevator start moving on level load
            EntFireByHandle(Entities.FindByName(null, "InstanceAuto8-entrance_lift_train"), "StartForward", "", 0, null, null)
            // Destroy objects
            Entities.FindByName(null, "fade_to_death-proxy").Destroy()
        }

        if (SSPostPlayerSpawn==true) {

        }

        if (SSLoop==true) {
            // Elevator changelevel
            local p = null
            while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 100)) {
                SendToConsole("commentary 1")
                SendToConsole("changelevel LEVELNAME")
            }
        }
    }


// Destroy object using FindByName
Entities.FindByName(null, "NAME").Destroy()

// Find and destroy object using FindByClassnameNearest within 1 unit of given vector
Entities.FindByClassnameNearest("CLASS", Vector(1, 2, 3), 1).Destroy()

// Changelevel trigger
local p = null
while(p = Entities.FindByClassnameWithin(p, "player", Vector(1, 2, 3), 50)) {
    SendToConsole("commentary 1")
    SendToConsole("changelevel LEVELNAME")
}

local ent = null
while (ent = Entities.FindByClassname(ent, "CLASSNAME")) {
    ent.Destroy()
}

// Make Wheatley look at nearest player
local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)

if (GetMapName() == "MAPNAME") {
    SendToConsole("commentary 0")
}

// ent_fire an object
EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)

// Pretty sure this is unified in the NewAperture function use find to delete unused entrys (Moja)
try {
    EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
} catch(exception) {}
*/




// ╔═╗╦═╗╔═╗╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔  ╔═╗╔═╗╔╦╗╔═╗
// ╠═╝╠╦╝║ ║╠═╝  ║  ╠╦╝║╣ ╠═╣ ║ ║║ ║║║║  ║  ║ ║ ║║║╣
// ╩  ╩╚═╚═╝╩    ╚═╝╩╚═╚═╝╩ ╩ ╩ ╩╚═╝╝╚╝  ╚═╝╚═╝═╩╝╚═╝
// ╦╔╦╗╔═╗╔═╗╦═╗╔╦╗╔═╗╔╦╗  ╔═╗╦═╗╔═╗╔╦╗  ╔═╗╔╦╗╔═╗╔╦╗
// ║║║║╠═╝║ ║╠╦╝ ║ ║╣  ║║  ╠╣ ╠╦╝║ ║║║║  ║ ╦║║║║ ║ ║║
// ╩╩ ╩╩  ╚═╝╩╚═ ╩ ╚═╝═╩╝  ╚  ╩╚═╚═╝╩ ╩  ╚═╝╩ ╩╚═╝═╩╝

function CreatePropsForLevel(CacheTime, CreateTime, LoopTime) {

//=============================//
//CREATE OBJECTS FOR sp_a2_bts2//
//=============================//

if (GetMapName() == "sp_a2_bts2") {
    if (CacheTime==true) {
        // Cache Objects

        CacheModel("props_bts/hanging_walkway_128a.mdl")

        DoneCacheing <- true
  }


    if (CreateTime==true) {
        // Create Objects

        local sp_a2_bts2_custom_prop_144 = CreateProp("prop_dynamic", Vector(1210.9047851562, -3591.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_144.SetAngles(-89.999946594238, -179.99993896484, 180)
        sp_a2_bts2_custom_prop_144.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_144.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_144, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_145 = CreateProp("prop_dynamic", Vector(1210.9046630859, -3463.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_145.SetAngles(-89.999946594238, -179.99992370605, 180)
        sp_a2_bts2_custom_prop_145.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_145.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_145, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_146 = CreateProp("prop_dynamic", Vector(1407.3646240234, -3066.5859375, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_146.SetAngles(-89.979080200195, 90.006011962891, 180)
        sp_a2_bts2_custom_prop_146.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_146.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_146, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_147 = CreateProp("prop_dynamic", Vector(1733.7668457031, -3890.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_147.SetAngles(-89.999946594238, 9.5622635853942e-05, 180)
        sp_a2_bts2_custom_prop_147.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_147.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_147, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_148 = CreateProp("prop_dynamic", Vector(1732.4794921875, -3133.6625976562, 10.172374725342), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_148.SetAngles(-89.999984741211, 8.720429832465e-06, 180)
        sp_a2_bts2_custom_prop_148.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_148.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_148, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_149 = CreateProp("prop_dynamic", Vector(1210.9049072266, -3719.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_149.SetAngles(-89.999946594238, -179.99995422363, 180)
        sp_a2_bts2_custom_prop_149.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_149.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_149, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_150 = CreateProp("prop_dynamic", Vector(1210.9050292969, -3847.4582519531, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_150.SetAngles(-89.999946594238, -179.99996948242, 180)
        sp_a2_bts2_custom_prop_150.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_150.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_150, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_151 = CreateProp("prop_dynamic", Vector(1210.9045410156, -3335.4580078125, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_151.SetAngles(-89.999946594238, -179.99990844727, 180)
        sp_a2_bts2_custom_prop_151.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_151.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_151, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_152 = CreateProp("prop_dynamic", Vector(1210.904296875, -3207.4577636719, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_152.SetAngles(-89.999946594238, -179.99989318848, 180)
        sp_a2_bts2_custom_prop_152.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_152.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_152, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_153 = CreateProp("prop_dynamic", Vector(1210.9040527344, -3079.4577636719, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_153.SetAngles(-89.999946594238, -179.99989318848, 180)
        sp_a2_bts2_custom_prop_153.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_153.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_153, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_154 = CreateProp("prop_dynamic", Vector(1279.3647460938, -3066.5993652344, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_154.SetAngles(-89.979103088379, 90.006004333496, 180)
        sp_a2_bts2_custom_prop_154.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_154.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_154, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_155 = CreateProp("prop_dynamic", Vector(2119.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_155.SetAngles(-89.999946594238, 89.999984741211, 180)
        sp_a2_bts2_custom_prop_155.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_155.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_155, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_156 = CreateProp("prop_dynamic", Vector(2244.1625976562, -3520.9521484375, 13.540298461914), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_156.SetAngles(-89.911918640137, -0.34657052159309, -179.76554870605)
        sp_a2_bts2_custom_prop_156.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_156.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_156, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_157 = CreateProp("prop_dynamic", Vector(1733.7669677734, -4018.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_157.SetAngles(-89.999954223633, 5.4641506721964e-05, 180)
        sp_a2_bts2_custom_prop_157.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_157.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_157, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_158 = CreateProp("prop_dynamic", Vector(1733.7672119141, -4146.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_158.SetAngles(-89.999946594238, 9.5622635853942e-05, 180)
        sp_a2_bts2_custom_prop_158.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_158.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_158, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_159 = CreateProp("prop_dynamic", Vector(2176.3408203125, -3588.1184082031, 10.380084037781), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_159.SetAngles(-89.999984741211, -89.999992370605, 180)
        sp_a2_bts2_custom_prop_159.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_159.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_159, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_160 = CreateProp("prop_dynamic", Vector(1733.7663574219, -3634.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_160.SetAngles(-89.999946594238, 0.00010928301344393, 180)
        sp_a2_bts2_custom_prop_160.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_160.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_160, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_161 = CreateProp("prop_dynamic", Vector(2244.4130859375, -3392.9523925781, 13.541104316711), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_161.SetAngles(-89.911918640137, -0.34657019376755, -179.76554870605)
        sp_a2_bts2_custom_prop_161.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_161.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_161, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_162 = CreateProp("prop_dynamic", Vector(2247.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_162.SetAngles(-89.999946594238, 89.999984741211, 180)
        sp_a2_bts2_custom_prop_162.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_162.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_162, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_163 = CreateProp("prop_dynamic", Vector(1663.3646240234, -3066.5588378906, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_163.SetAngles(-89.979080200195, 90.006042480469, 180)
        sp_a2_bts2_custom_prop_163.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_163.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_163, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_164 = CreateProp("prop_dynamic", Vector(1535.3646240234, -3066.572265625, 10.300641059875), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_164.SetAngles(-89.979080200195, 90.00602722168, 180)
        sp_a2_bts2_custom_prop_164.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_164.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_164, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_165 = CreateProp("prop_dynamic", Vector(1210.9050292969, -4103.4584960938, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_165.SetAngles(-89.999984741211, 180, 180)
        sp_a2_bts2_custom_prop_165.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_165.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_165, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_166 = CreateProp("prop_dynamic", Vector(1733.7666015625, -3762.8125, 9.1990060806274), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_166.SetAngles(-89.999946594238, 0.00010928301344393, 180)
        sp_a2_bts2_custom_prop_166.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_166.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_166, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_167 = CreateProp("prop_dynamic", Vector(1863.7722167969, -3195.4938964844, 12.396701812744), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_167.SetAngles(-89.999984741211, 89.999984741211, 180)
        sp_a2_bts2_custom_prop_167.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_167.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_167, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_168 = CreateProp("prop_dynamic", Vector(1210.9050292969, -3975.4584960938, 10.96333694458), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_168.SetAngles(-89.999954223633, -179.99998474121, 180)
        sp_a2_bts2_custom_prop_168.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_168.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_168, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_169 = CreateProp("prop_dynamic", Vector(1991.7722167969, -3195.4938964844, 12.396705627441), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_169.SetAngles(-89.999954223633, 89.999984741211, 180)
        sp_a2_bts2_custom_prop_169.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_169.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_169, "disabledraw", "", 0, null, null)

        local sp_a2_bts2_custom_prop_170 = CreateProp("prop_dynamic", Vector(2244.6635742188, -3264.9526367188, 13.541909217834), "models/props_bts/hanging_walkway_128a.mdl", 0)
        sp_a2_bts2_custom_prop_170.SetAngles(-89.91194152832, -0.34656989574432, -179.76559448242)
        sp_a2_bts2_custom_prop_170.__KeyValueFromString("solid", "6")
        sp_a2_bts2_custom_prop_170.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a2_bts2_custom_prop_170, "disabledraw", "", 0, null, null)

  }


    if (LoopTime==true) {
        // Generated Teleports

  }
}

}