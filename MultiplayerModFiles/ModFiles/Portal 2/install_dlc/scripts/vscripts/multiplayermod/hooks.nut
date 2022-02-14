// █░█ █▀█ █▀█ █▄▀   █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// █▀█ █▄█ █▄█ █░█   █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

//////////////////////////////
// Runs when a player joins //
//////////////////////////////

function OnPlayerJoin(p, script_scope) {

    // GlobalSpawnClass Teleport
    if (GlobalSpawnClass.useautospawn == true) {
        TeleportToSpawnPoint(p, null)
    }

    //# Get player's index and store it #//
    PlayerID <- p.GetRootMoveParent()
    PlayerID <- PlayerID.entindex()

    //# Assign every new targetname to the player after blue and red are used #//
    if (PlayerID >= 3) {
        p.__KeyValueFromString("targetname", "player" + PlayerID)
    }

    //# Change player portal targetname #//
    local ent1 = null
    local ent2 = null
    local ent = null
    while (ent = Entities.FindByClassname(ent, "prop_portal")) {
        if (ent.GetName() == "") {
            if (ent1 == null) {
                ent1 = ent
            } else {
                ent2 = ent
            }
        }
    }

    try {
        if (ent1.entindex() > ent2.entindex()) {
            ent1.__KeyValueFromString("targetname", p.GetName() + "_portal-" + "2")
            ent2.__KeyValueFromString("targetname", p.GetName() + "_portal-" + "1")
        } else {
            ent1.__KeyValueFromString("targetname", p.GetName() + "_portal-" + "1")
            ent2.__KeyValueFromString("targetname", p.GetName() + "_portal-" + "2")
        }
    } catch (exception) {
        if (GetDeveloperLevel() == 1) {
            printl("(P2:MM): Failed to rename portals" + exception)
        }
    }

    //# Set viewmodel targetnames so we can tell them apart #//
    local ent = null
    while (ent=Entities.FindByClassname(ent, "predicted_viewmodel")) {
        EntFireByHandle(ent, "addoutput", "targetname viewmodel_player" + ent.GetRootMoveParent().entindex(), 0, null, null)
        // printl("(P2:MM): Renamed predicted_viewmodel to viewmodel_player" + ent.GetRootMoveParent().entindex())
        // printl("" + ent.GetRootMoveParent().entindex() + " rotation " + ent.GetAngles())
        // printl("" + ent.GetRootMoveParent().entindex() + "    origin " + ent.GetOrigin())
    }

    // If the player is the first player to join, Fix OrangeOldPlayerPos
    if (p.GetTeam() == 2) {
        if (OrangeCacheFailed==true) {
            OrangeOldPlayerPos <- p.GetOrigin()
            OrangeCacheFailed <- false
        }
    }

    // Run general map code after a player loads into the game
    if (PlayerID == 1) {
        PostMapLoad()
    }

    //# Set cvars on joining players' client #//
    SendToConsole("sv_timeout 3")
    EntFireByHandle(clientcommand, "Command", "stopvideos", 0, p, p)
    EntFireByHandle(clientcommand, "Command", "r_portal_fastpath 0", 0, p, p)
    EntFireByHandle(clientcommand, "Command", "r_portal_use_pvs_optimization 0", 0, p, p)
    MapSupport(false, false, false, false, true, false, false)

    //# Say join message on HUD #//
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

    //# Set Player Color #//

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

    //# Setup Player Class #//
    local currentplayerclass = {}

    // player
    currentplayerclass.player <- p
    // player id
    currentplayerclass.id <- p.entindex()
    // player name
    if (PluginLoaded==true) {
        currentplayerclass.username <- GetPlayerName(p.entindex())
    } else {
        currentplayerclass.username <- "Player " + p.entindex()
    }
    // player angles
    currentplayerclass.eyeangles <- Vector(0, 0, 0)
    currentplayerclass.eyeforwardvector <- Vector(0, 0, 0)

    SetCosmetics(p)

    // player color
    local localcolorclass = {}
    localcolorclass.r <- R
    localcolorclass.g <- G
    localcolorclass.b <- B
    currentplayerclass.color <- localcolorclass
    // player noclip status
    currentplayerclass.noclip <- p.IsNoclipping()

    // Add player class to the player class array
    playerclasses.push(currentplayerclass)

    printl("===== Player Class =====")
    foreach (thing in FindPlayerClass(p)) {
        printl(thing)
    }
    printl("===================")

    // Set fog controller
    if (HasSpawned==true) {
        if (usefogcontroller == true) {
            EntFireByHandle(p, "setfogcontroller", defaultfog, 0, null, null)
        }
    }
}

//////////////////////
// RUNS AFTER DEATH //
//////////////////////

function OnPlayerDeath(player) {
    if (GetDeveloperLevel() == 1) {
        printl("(P2:MM): Player died!")
        MapSupport(false, false, false, false, false, player, false)
    }
}

////////////////////////
// RUNS AFTER RESPAWN //
////////////////////////

function OnPlayerRespawn(player) {
    // GlobalSpawnClass Teleport
    if (GlobalSpawnClass.useautospawn == true) {
        TeleportToSpawnPoint(player, null)
    }

    if (GetDeveloperLevel() == 1) {
        printl("(P2:MM): Player respawned!")
        MapSupport(false, false, false, false, false, false, player)
    }
}

///////////////////////////////////////
// RUNS AFTER BLUE INITALLY LOADS IN //
///////////////////////////////////////

function PostMapLoad() {
    //## Cheat Detection ##//
    SendToConsole("prop_dynamic_create cheatdetectionp232")
    SendToConsole("script SetCheats()")

    // add a hook to the chat command function
    if (PluginLoaded==true) {
        printl("(P2:MM): Plugin Loaded")
        AddChatCallback("ChatCommands")
    }
    // Edit Cvars
    SendToConsole("mp_allowspectators 0")
    // Force spawn players in map
    AddBranchLevelName( 1, "P2 32" )
    MapSupport(false, false, false, true, false, false, false)
    CreatePropsForLevel(true, false, false)
    // Enable fast download
    SendToConsole("sv_downloadurl \"https://github.com/kyleraykbs/Portal2-32PlayerMod/raw/main/WebFiles/FastDL/portal2/\"")
    SendToConsole("sv_allowdownload 1")
    SendToConsole("sv_allowupload 1")
    if (DevMode==true) {
        SendToConsole("developer 1")
        StartDevModeCheck <- true
    }

    if (RandomTurrets==true) {
        PrecacheModel("npcs/turret/turret_skeleton.mdl")
        PrecacheModel("npcs/turret/turret_backwards.mdl")
    }

	//gelocity alias, put gelocity1(2,or 3) into console to easier changelevel
	SendToConsole("alias gelocity1 changelevel workshop/596984281130013835/mp_coop_gelocity_1_v02")
	SendToConsole("alias gelocity2 changelevel workshop/594730048530814099/mp_coop_gelocity_2_v01")
	SendToConsole("alias gelocity3 changelevel workshop/613885499245125173/mp_coop_gelocity_3_v02")
}

//////////////////////////////////////
// RUNS AFTER EVERYONE FIRST SPAWNS //
//////////////////////////////////////

function GeneralOneTime() {
    EntFire("p232servercommand", "command", "script ForceRespawnAll()", 1)

    // Single player maps with chapter titles
    local CHAPTER_TITLES =
    [
        { map = "sp_a1_intro1", title_text = "#portal2_Chapter1_Title", subtitle_text = "#portal2_Chapter1_Subtitle", displayOnSpawn = false,		displaydelay = 1.0 },
        { map = "sp_a2_laser_intro", title_text = "#portal2_Chapter2_Title", subtitle_text = "#portal2_Chapter2_Subtitle", displayOnSpawn = true,	displaydelay = 2.5 },
        { map = "sp_a2_sphere_peek", title_text = "#portal2_Chapter3_Title", subtitle_text = "#portal2_Chapter3_Subtitle", displayOnSpawn = true,	displaydelay = 2.5 },
        { map = "sp_a2_column_blocker", title_text = "#portal2_Chapter4_Title", subtitle_text = "#portal2_Chapter4_Subtitle", displayOnSpawn = true, displaydelay = 2.5 },
        { map = "sp_a2_bts3", title_text = "#portal2_Chapter5_Title", subtitle_text = "#portal2_Chapter5_Subtitle", displayOnSpawn = true,			displaydelay = 1.0 },
        { map = "sp_a3_00", title_text = "#portal2_Chapter6_Title", subtitle_text = "#portal2_Chapter6_Subtitle", displayOnSpawn = true,			displaydelay = 1.5 },
        { map = "sp_a3_speed_ramp", title_text = "#portal2_Chapter7_Title", subtitle_text = "#portal2_Chapter7_Subtitle", displayOnSpawn = true,	displaydelay = 1.0 },
        { map = "sp_a4_intro", title_text = "#portal2_Chapter8_Title", subtitle_text = "#portal2_Chapter8_Subtitle", displayOnSpawn = true,			displaydelay = 2.5 },
        { map = "sp_a4_finale1", title_text = "#portal2_Chapter9_Title", subtitle_text = "#portal2_Chapter9_Subtitle", displayOnSpawn = false,		displaydelay = 1.0 },
    ]

    if (fogs == false) {
        usefogcontroller <- false
        printl("(P2:MM): No fog controller found, disabling fog controller")
    } else {
        usefogcontroller <- true
        printl("(P2:MM): Fog controller found, enabling fog controller")
    }

    if (usefogcontroller == true) {
        foreach (fog in fogs) {
            EntFireByHandle(Entities.FindByName(null, fog.name), "addoutput", "OnTrigger p232servercommand:command:script p232fogswitch(\"" + fog.fogname + "\")", 0, null, null)
        }

        defaultfog <- fogs[0].fogname

        local p = null
        while (p = Entities.FindByClassname(p, "player")) {
            EntFireByHandle(p, "setfogcontroller", defaultfog, 0, null, null)
        }
    }

    // Attempt to display chapter title
    foreach (index, level in CHAPTER_TITLES)
	{
		if (level.map == GetMapName() && level.displayOnSpawn )
		{
            foreach (index, level in CHAPTER_TITLES)
            {
                if (level.map == GetMapName() )
                {
                    EntFire( "@chapter_title_text", "SetTextColor", "210 210 210 128", 0.0 )
                    EntFire( "@chapter_title_text", "SetTextColor2", "50 90 116 128", 0.0 )
                    EntFire( "@chapter_title_text", "SetPosY", "0.32", 0.0 )
                    EntFire( "@chapter_title_text", "SetText", level.title_text, 0.0 )
                    EntFire( "@chapter_title_text", "display", "", level.displaydelay )

                    EntFire( "@chapter_subtitle_text", "SetTextColor", "210 210 210 128", 0.0 )
                    EntFire( "@chapter_subtitle_text", "SetTextColor2", "50 90 116 128", 0.0 )
                    EntFire( "@chapter_subtitle_text", "SetPosY", "0.35", 0.0 )
                    EntFire( "@chapter_subtitle_text", "settext", level.subtitle_text, 0.0 )
                    EntFire( "@chapter_subtitle_text", "display", "", level.displaydelay )
                }
            }
		}
	}

    // Clear all cached models from our temp cache as they are already cached
    // CanClearCache <- true

    // Set a varible to tell the map loaded
    HasSpawned <- true

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
        if (GetDeveloperLevel() == 1) {
            printl("(P2:MM): OrangeOldPlayerPos not set (Blue probably moved before Orange could load in) Setting OrangeOldPlayerPos to BlueOldPlayerPos")
        }
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
        if (GetDeveloperLevel() == 1) {
            printl("(P2:MM): Blue dropper not found!")
        }
    }

    // Force open the red player droppers
    printl(OrangeOldPlayerPos)
    printl(OldPlayerPos)

    local radius = 150

    if (OrangeCacheFailed==true) {
        radius = 350
    }

    try {
        local ent = null
        while(ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", Vector(OrangeOldPlayerPos.x, OrangeOldPlayerPos.y, OldPlayerPos.z-300), radius)) {
            if (ent.GetModelName() == "models/props_underground/underground_boxdropper.mdl" || ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                EntFireByHandle(ent, "setanimation", "open", 0, null, null)
                if (ent.GetModelName() == "models/props_backstage/item_dropper.mdl") {
                    EntFireByHandle(ent, "setanimation", "item_dropper_open", 0, null, null)
                }
                ent.__KeyValueFromString("targetname", "RedDropperForcedOpenMPMOD")
            }
        }
    } catch(exeption) {
        if (GetDeveloperLevel() == 1) {
            printl("(P2:MM): Red dropper not found!")
        }
    }
    local radius = null

    //# Attempt to fix some general map issues #//
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

    if (IsOnSingleplayer == false) {
        foreach (DoorType in DoorEntities) {
            try {
                Entities.FindByName(null, DoorType).Destroy()
            } catch(exception) { }
        }
    }

    // Create props after cache
    CreatePropsForLevel(false, true, false)

    MapSupport(false, false, true, false, false, false, false)
}

///////////////////
// CHAT COMMANDS //
///////////////////

function ChatCommands(ccuserid, ccmessage) {
    local p = FindByIndex(ccuserid)
    local pname = GetPlayerName(ccuserid)
    local adminlevel = GetAdminLevel(ccuserid)

}