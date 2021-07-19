/***************************************************
* MAPSPAWN.nut is called on newgame or transitions *
***************************************************/
CheatsOff <- 0
ReadyCheatsOff <- 0
PlayerJoined <- 0
PlayerID <- 0
GBIsMultiplayer <- 0
DedicatedServerOneTimeRun <- 1
TryGelocity <- 1
TryGelocity2 <- 1
TryGelocity3 <- 1
copp <- 0
WFPDisplayDisabled <- 0

// is dedicated server
DedicatedServer <- 0

function init(){
    // enable fast download
    SendToConsole("sv_downloadurl https://github.com/kyleraykbs/gilbert/raw/main/portal2")    
    SendToConsole("sv_allowdownload 1") 
    SendToConsole("sv_allowupload 1")
    // create an on screen text message entity
    onscreendisplay <- Entities.CreateByClassname("game_text")
    onscreendisplay.__KeyValueFromString("targetname", "onscreendisplaympmod");
    onscreendisplay.__KeyValueFromString("message", "Waiting For Players...");
    onscreendisplay.__KeyValueFromString("holdtime", "0.2");
    onscreendisplay.__KeyValueFromString("fadeout", "0.2");
    onscreendisplay.__KeyValueFromString("fadein", "0.2");
    onscreendisplay.__KeyValueFromString("spawnflags", "1");
    onscreendisplay.__KeyValueFromString("color", "60 200 60");
    onscreendisplay.__KeyValueFromString("channel", "1");
    //onscreendisplay.__KeyValueFromString("x", "-1.1");
    //onscreendisplay.__KeyValueFromString("y", "-1.1");
    // create a join message entity
    jmessage <- Entities.CreateByClassname("env_instructor_hint")
    jmessage.__KeyValueFromString("targetname", "jmessagetarget");
    jmessage.__KeyValueFromString("hint_icon_onscreen", "icon_caution");
    jmessage.__KeyValueFromString("hint_color", "255 200 0");
    jmessage.__KeyValueFromString("hint_timeout", "3");
    // create entity to run loop() every 0.1 seconds
    timer <- Entities.CreateByClassname("logic_timer");
    timer.__KeyValueFromString("targetname", "timer");
    EntFireByHandle(timer, "AddOutput", "RefireTime 0.1", 0, null, null);
    EntFireByHandle(timer, "AddOutput", "classname move_rope", 0, null, null);
    EntFireByHandle(timer, "AddOutput", "OnTimer worldspawn:RunScriptCode:loop():0:-1", 0, null, null);
    EntFireByHandle(timer, "Enable", "", 0.1, null, null);
    // create an entity that sends a client command
    clientcommand <- Entities.CreateByClassname("point_clientcommand");

    /***********************
    * run map support code *
    ***********************/

    // run lobby code
    if (GetMapName()=="mp_coop_lobby_3") {
        LobbyOneTimeRun()
    }

    // run mp_coop_tripleaxis code
    if (GetMapName()=="mp_coop_tripleaxis") {
        mp_coop_tripleaxisFIX()
    }

    // run mp_coop_separation_1 code
    if (GetMapName()=="mp_coop_separation_1") {
            mp_coop_separation_1FIX()
    }

    // run mp_coop_paint_conversion code
    if (GetMapName()=="mp_coop_paint_conversion") {
        mp_coop_paint_conversionFIX()
    }

    // run gelocity code
    if (TryGelocity==1) {
        try {
            if (GetMapName().slice(28,50)=="mp_coop_gelocity_1_v02") {
                Gelocity()
            }
        } catch(exception) {
            print("")
            TryGelocity<-0
        }
    }
    // run gelocity 3 code
        if (TryGelocity3==1) {
        try {
            if (GetMapName().slice(28,50)=="mp_coop_gelocity_3_v02") {
                Gelocity3()
            }
        } catch(exception) {
            print("")
            TryGelocity3<-0
        }
    }
    // run gelocity 2 code
        if (TryGelocity2==1) {
        try {
            if (GetMapName().slice(28,50)=="mp_coop_gelocity_2_v01") {
                Gelocity2()
            }
        } catch(exception) {
            print("")
            TryGelocity2<-0
        }
    }
}

// make sure game is multiplayer
try {
    if ( ::IsMultiplayer() ){
        GBIsMultiplayer <- 1
    }
} catch(exception) {
    GBIsMultiplayer <- 0
}

/*******************
* Multiplayer Code *
*******************/
if (GBIsMultiplayer==1) {
SetColor <- function(){
    local p = null;
    while (p = Entities.FindByClassname(p, "player")){
        if (p.ValidateScriptScope()){
            local script_scope = p.GetScriptScope();
            if (!("Colored" in script_scope)){
                // get player's index and store it
                PlayerID <- p.GetRootMoveParent()
                PlayerID <- PlayerID.entindex()
                // enable cvars on client
                SendToConsole("gameinstructor_enable 1")
                EntFireByHandle(clientcommand, "Command", "bind tab +score", 0, p, p)
                EntFireByHandle(clientcommand, "Command", "stopvideos", 0, p, p)
                EntFireByHandle(clientcommand, "Command", "r_portal_fastpath 0", 0, p, p)
                EntFireByHandle(clientcommand, "Command", "gameinstructor_enable 1", 0, p, p)
                EntFireByHandle(clientcommand, "Command", "mat_motion_blur_enabled 1", 0, p, p)
                // say join message
                local coj = "Player " + PlayerID + " Joined The Game"
                coj = coj.tostring()
                jmessage.__KeyValueFromString("hint_caption", coj);

                DoEntFire("jmessagetarget", "showhint", "", 0.0, null, p)
                printl("Player " + PlayerID + " Joined The Game")
                // assign player targetname
                if (PlayerID >= 3) {
                p.__KeyValueFromString("targetname", "player" + PlayerID);
                }
                // set random color if over 16
                if (PlayerID != 1) {
                    R <- RandomInt(0, 255), G <- RandomInt(0, 255), B <- RandomInt(0, 255);
                    ReadyCheatsOff <- 1
                }
                // set preset colors up to 16
                if (PlayerID == 1) {
                    R <- 255, G <- 255,  B <- 255;
                    p.SetModel("models/player/ballbot/ballbot_skin_moon.mdl")
                }
                if (PlayerID == 2) {
                    R <- 180, G <- 255,  B <- 180;
                }
                if (PlayerID == 3) {
                    R <- 120, G <- 140,  B <- 255;
                }
                if (PlayerID == 4) {
                    R <- 255, G <- 170,  B <- 120;
                }
                if (PlayerID == 5) {
                    R <- 255, G <- 100,  B <- 100;
                }
                if (PlayerID == 6) {
                    R <- 255, G <- 180,  B <- 255;
                }
                if (PlayerID == 7) {
                    R <- 255, G <- 255,  B <- 180;
                }
                if (PlayerID == 8) {
                    R <- 0, G <- 255,  B <- 240;
                }
                if (PlayerID == 9) {
                    R <- 75, G <- 75,  B <- 75;
                }
                if (PlayerID == 10) {
                    R <- 120, G <- 155,  B <- 25;
                }
                if (PlayerID == 11) {
                    R <- 0, G <- 80,  B <- 100;
                }
                if (PlayerID == 12) {
                    R <- 100, G <- 80,  B <- 0;
                }
                if (PlayerID == 13) {
                    R <- 0, G <- 0,  B <- 100;
                }
                if (PlayerID == 14) {
                    R <- 80, G <- 0,  B <- 0;
                }
                if (PlayerID == 15) {
                    R <- 0, G <- 75,  B <- 0;
                }
                if (PlayerID == 16) {
                    R <- 0, G <- 75,  B <- 75;
                }
                script_scope.Colored <- true;
                EntFireByHandle(p, "Color", (R+" "+G+" "+B), 0, null, null);
                return
            }
        }
    }
}


function loop() {
// set all player colors
    SetColor()
    // cache old player position
    try {
    if (copp==0) {
        OldPlayerPos <- Entities.FindByName(null, "blue").GetOrigin()
        copp <- 1
    }
    } catch(exception) {
        print("")
    }
    // run general code
    General()
    // display waiting for players and run nessacary code after spawn
    if (WFPDisplayDisabled==0) {
        // general map code
        try {
        // see if player is in spawn zone
        if (Entities.FindByNameWithin(null, "blue", OldPlayerPos, 20)) {
                DoEntFire("onscreendisplaympmod", "display", "", 0.0, null, null)
        } else {
            WFPDisplayDisabled <- 1
            GeneralOneTime()
        }
        } catch(exception) {
            print("")
        }
    }
    // run all required loops
    if (GetMapName()=="mp_coop_lobby_3") {
        ArtTherapyLobby()
    }
    // run credits code
    if (GetMapName()=="mp_coop_credits") {
        CreditsLoop()
    }
    // run dedicated server code
    if (DedicatedServer==1) {
        DedicatedServerFunc()
    }
    // disable collision
    //local j = "solid ";
	local k = "CollisionGroup ";
	//EntFire("player", "addoutput", j+4);
	EntFire("player", "addoutput", k+2);
    // turn cheats off if ready (sv_cheats 0)
    if (ReadyCheatsOff==1) {
        if (CheatsOff==0) {
            if (GetMapName()=="mp_coop_lobby_3") {
            SendToConsole("sv_cheats 0")
            }
            CheatsOff <- 1
        }
    }
    // TPG
    local PLent = null;
    while(PLent = Entities.FindByClassnameWithin(PLent, "player", Vector(2367, -8126, -54), 30)) {
        local APLent = null;
        while(APLent = Entities.FindByClassname(APLent, "player")) {
            APLent.SetOrigin(Vector(2495, -7451, 410))
        }
    }
}

// lobby setup code
function LobbyOneTimeRun() {
    // remove entities
    // fix edicts error
    local ent = null;
    while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
    {
        ent.Destroy() // 165 entities removed
    }
    
    // fix art therapy tube glitches
    Entities.FindByName(null,"dlc_room_fall_push_right").Destroy()
    Entities.FindByName(null,"dlc_room_fall_push_left").Destroy()

    // fix track 5
    // entry door fix
    Entities.FindByName(null,"track5-door_paint-trigger_hurt_door").Destroy()
    Entities.FindByName(null,"track5-door_paint-collide_door").Destroy()
    // light fix
    Entities.FindByName(null,"@light_shadowed_paintroom").Destroy()
    // remove orange exit door
    local ent = null;
    while(ent = Entities.FindByName(ent, "track5-orangeiris_door_elevator_pit"))
    {
        ent.Destroy()
    }
    Entities.FindByName(null,"track5-orangeescape_elevator_clip").Destroy()
    // remove blue exit door
    local ent = null;
    while(ent = Entities.FindByName(ent, "track5-iris_door_elevator_pit"))
    {
        ent.Destroy()
    }
    Entities.FindByName(null,"track5-escape_elevator_clip").Destroy()

}

/*******************
* map support code *
*******************/

// general fixes for all maps
function General() {
    // remove dropper bottom
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        local ent = null;
        while (ent = Entities.FindByClassnameWithin(ent, "prop_dynamic", OldPlayerPos, 500)) {
            if (ent.GetModelName()=="models/props_underground/underground_boxdropper.mdl") {
                EntFireByHandle(ent, "SetAnimation", "open_idle", 0.0, null, null)
            }
            if (ent.GetModelName()=="models/props_backstage/item_dropper.mdl") {
                EntFireByHandle(ent, "SetAnimation", "item_dropper_idle", 0.0, null, null)
            }
        }
    }
}

// general one time run
function GeneralOneTime() {
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
        "airlock_0-door1-airlock_entry_door_close_rl"
    ]
    foreach (DoorType in DoorEntities) {
        try {
        Entities.FindByName(null, DoorType).Destroy()
        } catch(exception) {
            printl("")
        }
    }
    // map support
    if (GetMapName()=="mp_coop_separation_1") {
        mp_coop_separation_1FIXONETIME()
    }
    /*
    if (GetMapName()=="mp_coop_2paints_1bridge") {
        mp_coop_2paints_1bridgeFIX()
    }
    */
}

// art therapy lobby
function ArtTherapyLobby() {
    // art therapy left chute enabler
    local vectorEEL;
    vectorEEL = Vector(5727, 3336, -441);
    local EELent = null;
    while(EELent = Entities.FindByClassnameWithin(EELent, "player", vectorEEL, 12)) 
    {
        printl("Enabled Left Chute")
        local LCatEn = null;
        while(LCatEn = Entities.FindByName(LCatEn, "left-enable_cats")) {
            DoEntFire("!self", "enable", "", 0.0, null, LCatEn) 
            DoEntFire("!self", "trigger", "", 0.0, null, LCatEn) 
        }
    } 
    // art therapy left chute teleporter
    local vectorLCT;
    vectorLCT = Vector(5729, 3336, 1005);
    local LCTent = null;
    while(LCTent = Entities.FindByClassnameWithin(LCTent, "player", vectorLCT, 30)) {
        printl("Teleported Player To Art Therapy")
        LCTent.SetOrigin(Vector(3194, -1069, 1676))
        LCTent.SetAngles(0, 0, 0)
    }
    // art therapy right chute enabler
    local vectorEER;
    vectorEER = Vector(5727, 3192, -441);
    local EERent = null;
    while(EERent = Entities.FindByClassnameWithin(EERent, "player", vectorEER, 12)) 
    {
        printl("Enabled Left Chute")
        local RCatEn = null;
        while(RCatEn = Entities.FindByName(RCatEn, "right-enable_cats")) {
            DoEntFire("!self", "enable", "", 0.0, null, RCatEn) 
            DoEntFire("!self", "trigger", "", 0.0, null, RCatEn) 
        }
    } 
    // art therapy right chute teleporter
    local vectorRCT;
    vectorRCT = Vector(5727, 3180, 1005);
    local RCTent = null;
    while(RCTent = Entities.FindByClassnameWithin(RCTent, "player", vectorRCT, 30)) {
        printl("Teleported Player To Art Therapy")
        RCTent.SetOrigin(Vector(3191, -1228, 1682))
        RCTent.SetAngles(0, 0, 0)
    }
    // disable art therapy chutes
    local vectorE;
    vectorE = Vector(3201, -1152, 1272);
    local Aent = null;
    while(Aent = Entities.FindByClassnameWithin(Aent, "player", vectorE, 150)) 
    {
        local LCatDis = null;
        while(LCatDis = Entities.FindByName(LCatDis, "left-disable_cats")) {
        printl("Disabled Right Chute")
            DoEntFire("!self", "enable", "", 0.0, null, LCatDis) 
            DoEntFire("!self", "trigger", "", 0.0, null, LCatDis)
        }
        local RCatDis = null;
        while(RCatDis = Entities.FindByName(RCatDis, "right-disable_cats")) {
            printl("Disabled Right Chute")
            DoEntFire("!self", "enable", "", 0.0, null, RCatDis) 
            DoEntFire("!self", "trigger", "", 0.0, null, RCatDis)
        }
    }   
    // teleport exiting player out of art therapy
    local vectorEx;
    vectorEx = Vector(3584, -1669, 466);
    local AEent = null;
    while(AEent = Entities.FindByClassnameWithin(AEent, "player", vectorEx, 30)) 
    {
        AEent.SetOrigin(Vector(3919, 3352, 158))
    } 
}

/*
// fix mp_coop_2paints_1bridge
function mp_coop_2paints_1bridgeFIX() {
    local ent = null;
    while(ent = Entities.FindByClassnameWithin(null, "trigger_once", Vector(1472, 1392, 68), 10)) 
    {
        ent.Destroy()
    } 
    EntFireByHandle(Entities.FindByName(null, "bridge_2"), "enable", "", 0, null, null)
}
*/

// mp_coop_separation_1 fix
function mp_coop_tripleaxisFIX() {
    Entities.FindByName(null, "outro_math_counter").Destroy()
}

// mp_coop_separation_1 fix
function mp_coop_separation_1FIX() {
    EntFireByHandle(Entities.FindByName(null, "left_1st_room_spawn-initial_blue_spawn"), "SetAsActiveSpawn", "", 0, null, null)
    EntFireByHandle(Entities.FindByName(null, "right_1st_room_spawn-initial_orange_spawn"), "SetAsActiveSpawn", "", 0, null, null)
    Entities.FindByName(null, "split_counter").Destroy()
}

// mp_coop_separation_1 fix onetime
function mp_coop_separation_1FIXONETIME() {
    EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
    EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
    EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

    local ent = null;
    while(ent = Entities.FindByName(ent, "split_exit_arms")) {
        EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
    }
    local ent = null;
    while(ent = Entities.FindByName(ent, "split_entrance_arms")) {
        EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
    }

    local ent = null;
    while (ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000)) {
        EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
    }

    local loopTimes = 0;
    while (loopTimes <= 0) {
        Entities.FindByName(null, "split_exit_fake_collision").Destroy()
    local loopTimes = loopTimes + 1
    }
}

// mp_coop_paint_conversion fix
function mp_coop_paint_conversionFIX() {
    Entities.FindByName(null,"disassembler_1_door_blocker").Destroy()
    Entities.FindByName(null,"disassembler_2_door_blocker").Destroy()

    Entities.FindByName(null,"disassembler_1_door_2").Destroy()
    Entities.FindByName(null,"disassembler_1_door_1").Destroy()

    Entities.FindByName(null,"disassembler_2_door_2").Destroy()
    Entities.FindByName(null,"disassembler_2_door_1").Destroy()
}

// gelocity 1 code
function Gelocity() {
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door2_player2"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door2_player1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"start_clip_1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"start_clip_2"))
    local ent = null;
    // remove entities
    while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
    {
        ent.Destroy() // 20 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "beam_spotlight"))
    {
        ent.Destroy() // 85 entities removed
    }
    printl("Portal 2 Multiplayer Mod: Removed 20 Portal Bumpers")
}

// gelocity 2 code
function Gelocity2() {
    local ent = null;
    // remove entities
    while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
    {
        ent.Destroy() // 20 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "beam_spotlight"))
    {
        ent.Destroy() // 85 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "env_glow"))
    {
        ent.Destroy() // 85 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "light_spot"))
    {
        ent.Destroy() // 85 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "keyframe_rope"))
    {
        ent.Destroy() // 85 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "move_rope"))
    {
        ent.Destroy() // 85 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "info_overlay"))
    {
        ent.Destroy() // 85 entities removed
    }
    printl("Portal 2 Multiplayer Mod: Removed 20 Portal Bumpers")
}

// gelocity 3 code
function Gelocity3() {
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door_start_2_2"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door_start_2_1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door_start_1_2"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door_start_1_1"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"door_start"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"red_dropper-door_eixt"))
    DoEntFire("!self", "kill", "", 0.0, null, Entities.FindByName(null,"blue_dropper-item_door"))
    local ent = null;
    // remove entities
    while(ent = Entities.FindByClassname(ent, "func_portal_bumper"))
    {
        ent.Destroy() // 20 entities removed
    }
    while(ent = Entities.FindByClassname(ent, "beam_spotlight"))
    {
        ent.Destroy() // 85 entities removed
    }
    printl("Portal 2 Multiplayer Mod: Removed 20 Portal Bumpers")
}

// dedicated server code
function DedicatedServerFunc() {
    if (DedicatedServerOneTimeRun==1) {
        if (GetMapName() == "mp_coop_lobby_3") {
            Entities.FindByName(null,"brush_spawn_blocker_red").Destroy()
            Entities.FindByName(null,"brush_spawn_blocker_blue").Destroy()
            // enable team building course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_teambuilding"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_teambuilding"))
            // enable tbeam course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_tbeam"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_tbeam"))
            // enable paint course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_paint"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_paint"))
            // enable fling course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_fling"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_fling"))
            // enable extra course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_extra"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_extra"))
            // enable all finished course
            DoEntFire("!self", "enable", "", 0.0, null, Entities.FindByName(null,"relay_reveal_all_finished"))
            DoEntFire("!self", "trigger", "", 0.0, null, Entities.FindByName(null,"relay_reveal_all_finished"))
            // enable music
            DoEntFire("!self", "invalue", "7", 0.0, null, Entities.FindByName(null,"@music_lobby_7"))
        }
        DedicatedServerOneTimeRun <- 0
    }

    local p = null;
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.entindex()==1) {
            SendToConsole("exec DedicatedServerCommands")
            // set size to 0
            EntFireByHandle(p, "AddOutput", "ModelScale 0", 0, null, null);
        }
    }
}

/**********
* credits *
**********/

// remove selected pods
function CreditsRemovePod() {
    local ent = null;
    while (ent = Entities.FindByNameNearest("chamber*", Vector(-64, 217, 72), 100)) {
        ent.Destroy()
    }
    local ent2 = null;
    while (ent2 = Entities.FindByNameNearest("bubbles*", Vector(-64, 217, 72), 100)) {
        ent2.Destroy()
    }
}

// fix void camera glitch
function FixCreditsCameras() {
    // disable useless cameras
    EntFireByHandle(Entities.FindByName(null, "camera_SP"), "disable", "", 0, null, null)
    EntFireByHandle(Entities.FindByName(null, "camera_O"), "disable", "", 0, null, null)
    // reload main camera with new params
    Entities.FindByName(null, "camera").__KeyValueFromString("target_team", "-1");
    EntFireByHandle(Entities.FindByName(null, "camera"), "disable", "", 0, null, null)
    EntFireByHandle(Entities.FindByName(null, "camera"), "enable", "", 0, null, null)
}

// replace females with pbodys
function CreditsSetModelPB(ent) {
    FixCreditsCameras()
    // count how many credits come on screen to change to humans
    MPMCredits <- MPMCredits + 1
    // preset animation
    local RandomAnimation = RandomInt(0, CRAnimationTypesPB)
    // remove pod if needed
    HasRemovedPod <- 0
    foreach (anim in NOTubeAnimsPB) {
        if (AnimationsPB[RandomAnimation] == anim && HasRemovedPod==0) {
            HasRemovedPod <- 1
            CreditsRemovePod()
        }
    }
    // set model
    ent.SetModel("models/player/eggbot/eggbot.mdl")
    // set color
    EntFireByHandle(ent, "Color", (RandomInt(0, 255)+" "+RandomInt(0, 255)+" "+RandomInt(0, 255)), 0, null, null);
    // set position
    ent.SetOrigin(Vector(0, 0, 7.5))
    // set animation
    EntFireByHandle(ent, "setanimation", AnimationsPB[RandomAnimation], 0, null, null)
}

// replace males with atlases
function CreditsSetModelAL(ent) {
    FixCreditsCameras()
    // count how many credits come on screen to change to humans
    MPMCredits <- MPMCredits + 1
    // preset animation
    local RandomAnimation = RandomInt(0, CRAnimationTypesAL)
    // set model
    ent.SetModel("models/player/ballbot/ballbot.mdl")
    // set color
    EntFireByHandle(ent, "Color", (RandomInt(0, 255)+" "+RandomInt(0, 255)+" "+RandomInt(0, 255)), 0, null, null);
    // set position
    ent.SetOrigin(Vector(-10, 0, 25.5))
    // set animation
    EntFireByHandle(ent, "setanimation", AnimationsAL[RandomAnimation], 0, null, null)
    // remove pod if needed
    HasRemovedPod <- 0
    foreach (anim in NOTubeAnimsAL) {
        if (AnimationsAL[RandomAnimation] == anim && HasRemovedPod==0) {
            HasRemovedPod <- 1
            CreditsRemovePod()
            ent.SetOrigin(Vector(0, 0, 7.5))
        }
    }
}

function CreditsLoop() {
// if mod credits aren't finished change humans to robots
if (MPMCredits<=MPModCreditNumber) {
    // change males to atlases
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male.mdl")) {
        CreditsSetModelAL(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male01.mdl")) {
        CreditsSetModelAL(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male_02.mdl")) {
        CreditsSetModelAL(ent)
    }
    // change females to pbodys
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_01.mdl")) {
        CreditsSetModelPB(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_02.mdl")) {
        CreditsSetModelPB(ent)
    }
    local ent = null;
    while (ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_03.mdl")) {
        CreditsSetModelPB(ent)
    }
    }
}

//Credits One Time Run Code
if (GetMapName() == "mp_coop_credits") {

    // set credits animations
    // pbody animations
    AnimationsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "noGun_airwalk", "noGun_airwalk", "portalgun_drowning", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]
    // atlas animations
    AnimationsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "portalgun_jump_spring", "portalgun_thrash_fall", "noGun_crouch_idle", "noGun_airwalk", "noGun_airwalk"]
    // pbody animations out of tube
    NOTubeAnimsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]
    // atlas animations out of tube
    NOTubeAnimsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "noGun_crouch_idle"]
    // credit run counter
    MPMCredits <- 0
    // set the amount of pbody animations
    CRAnimationTypesPB <- -1
    foreach (value in AnimationsPB) {
        CRAnimationTypesPB <- CRAnimationTypesPB + 1
    }
    // set the amount of atlas animations
    CRAnimationTypesAL <- -1
    foreach (value in AnimationsAL) {
        CRAnimationTypesAL <- CRAnimationTypesAL + 1
    }
    // add team names to credits
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
    "kyleraykbs | Scripting + Team Lead",
    "Bumpy | Scripting + Script Theory",
    "Vista | Reverse Engineering",
    "Wolfe Strider Shooter | Scripting",
    "Nanoman2525 | Mapping + Entity Help",
    "--------------------------",
    "Multiplayer Mod: Contributers",
    "--------------------------",
    "Darnias | Jumpstarter Code",
    "The Pineapple | Hamachi support",
    "SlingEXE | Optimisations",
    "actu | Remote File Downloads",
    "Blub/Vecc | Code Cleanup + Commenting",
    "AngelPuzzle | Translations",
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
    "NintenDude",
    "SuperSpeed",
    "portalboy",
    "charity",
    "Souper Marilogi",
    "fluffys",
    "JDWMGB",
    "ALIEN GOD",
    "mono",
    "Funky Kong",
    "MicrosoftWindows",
    "dactam",
    "wol",
    "kitsune",
    "charzar",
    "--------------------------",
    "And my supportive group of friends!",
    "--------------------------",
    "Nick/KingKong",
    "Latte/Luna",
    "Craig is love Craig is life | WOLF BATTLER ",
    "Bunger from Bugsnax | Ayden",
    "Bananabread | KaiserInfinitus",
    "Jazzy/jasmine",
    "David/Mr. E"
    "--------------------------",
    "Thank you all so so much!!!",
    "--------------------------"
    "",
    "",
    "--------------------------",
    "Valve: Credits",
    "--------------------------",
    ];
    // set the amount of credits
    MPModCreditNumber <- -1
    foreach (value in MPMCoopCreditNames) {
        MPModCreditNumber <- MPModCreditNumber + 1
    }
    // mount list of credits to credits
    foreach (Name in MPMCoopCreditNames) {
        AddCoopCreditsName(Name)
    }
}

// run init code
Entities.First().ConnectOutput("OnUser1", "init");
DoEntFire("worldspawn", "FireUser1", "", 0.0, null, null);

// singleplayer code
} else {
GlobalRunSingleplayer <- 1

SetColor <- function(){
    local p = null;
    while (p = Entities.FindByClassname(p, "player")){
        if (p.ValidateScriptScope()){
            local script_scope = p.GetScriptScope();
            if (GlobalRunSingleplayer==1){
                SendToConsole("script_execute singleplayer")
                printl("Playing Map In Single Player [Multiplayer Mod Disabled]")
                GlobalRunSingleplayer <- 0
                return
            }
        }
    }
}
}