//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
//   ______      _
//   |  _  \    | |
//   | | | |__ _| |_ __ _
//   | | | / _` | __/ _` |
//   | |/ / (_| | || (_| |
//   |___/ \__,_|\__\__,_|
//    _____           _
//   /  ___|         | |                _
//   \ `--. _   _ ___| |_ ___ _ __ ___ (_)
//    `--. \ | | / __| __/ _ \ '_ ` _ \
//   /\__/ / |_| \__ \ ||  __/ | | | | |_
//   \____/ \__, |___/\__\___|_| |_| |_(_)
//           __/ |
//          |___/
//---------------------------------------------------
// Purpose:
// Creates the functionality of our custom data
// system for maps that support it.
// Will not be avaliable for maps that don't use it.
// THIS SCRIPT IS STILL A WIP, ISSUES MIGHT OCCUR!
//---------------------------------------------------
//
// Data Systen Terminology:
// Enabled: The data system has started successfully on the python scripts end
// Disabled: The data system didn't start successfully on the python scripts end
// Running: By default the data system is set to run with every play session
// Not Running: The user has defined they do not want the data system to run next play session or the system is disabled

/* Process steps:
 Init:

*/

dataFileIndicators = [
    "datasystem-kick-succeed.nut",
    "datasystem-kick-failed.nut", "datasystem-ban-succeed.nut",
    "datasystem-ban-failed.nut", "datasystem-mapevent-succeed.nut",
    "datasystem-mapevent-failed.nut"]

function dataLoad(event, eventdata) {
    printl("Loading data retrieved from masterData...")
    local grabbedData = false
    try {
        IncludeScript("datasystemsaves/datasystem-" + event + "-" + eventdata + ".nut")
        grabbedData = true
    } catch (e) {
        printl("Loading the nut indicator failed... We are gonna try again one more time...")
        try {
            IncludeScript("datasystemsaves/datasystem-" + event + "-" + eventdata + ".nut")
        } catch (e) {
            printl("Failed to grab data!")
            grabbedData = false
        }
    }
    if (grabbedData = true) {
        dataSaveCheck()
    }
}

function dataSaveCreate(event, eventdata) {
    try {
        SendToConsoleP2MM("screenshot datasystem-" + event + "-" + eventdata)
        printl("datasystem-" + event + "-" + eventdata + " file created...")
    } catch (e) {
        printl("datasystem-" + event + "-" + eventdata + " failed to be created...")
        printl(e)
    }
}

function dataNutCheck() {
    local checkFile = false
    try {
        IncludeScript("datasystemsaves/datasystem-datacheck.nut")
        checkFile = true
    } catch (e) {
        return
    }
    if (checkFile = true) {
        foreach (selectedDataFile in dataFileIndicators) {
            try {
                IncludeScript(selectedDataFile)
                dataFileFound = true
            } catch (e) {
                continue
            }
        }
        if (dataFileFound = true) {
            switch (selectedDataFile) {
                case "datasystem-kick-succeed.nut": return dataSystemKick(returnstate=true); break;
                case "datasystem-kick-fail.nut": return dataSystemKick(returnstate=false); break;
                case "datasystem-ban-succeed.nut": return dataSystemBan(returnstate=true); break;
                case "datasystem-ban-fail.nut": return dataSystemBan(returnstate=false); break;
                case "datasystem-mapevent-succeed.nut": return dataSystemBan(returnstate=true); break;
                case "datasystem-mapevent-fail.nut": return dataSystemBan(returnstate=false); break;
            }
        } else {
            printl("Data System Check called but no file found...")
        }
    }
}

/*
    Init for our data system
    We must check to make sure the python data system script is active or it won't work
    If it fails we'll tell mapspawn.nut that datas aren't currently supported
*/
function init() {
    printl("Starting the data system!")
    //Makes a temporary screenshot file for our python data system to check
    SendToConsoleP2MM("screenshot SAVE/datasystemcheck-test")
    try {
        IncludeScript("multiplayermod/datasystem/datasystemcheck-pythonsuccess.nut")
        printlP2MM("Data Systen works! Will be avaliable for the map...")
        dataCheck <- true
        SendToConsoleP2MM("screenshot datasystemcheck-nutsuccess")
    } catch (e){
        printlP2MM("First check detection failed, trying again...")
        printlP2MM(e)
        local datasystemcheckerrors = 0
        while (datasystemcheckerrors != 3) {
            try {
                IncludeScript("multiplayermod/datasystem/datasystem-pythonsuccess.nut")
                break
            } catch (e){
                printlP2MM("Check detection failed, will try again...")
                printlP2MM(e)
                datasystemcheckerrors += 1
            }
        }

        if (datasystemcheckerrors = 3) {
            printlP2MM("Data Systen check detection failed after checking three times!")
            printlP2MM("The data system will not be avaliable for this map...")
            dataCheck <- false
            SendToConsoleP2MM("screenshot datasystemcheck-nutfail")
            datasystemcheckerrors = 0
        } else {
            printlP2MM("Data System works! Will be avaliable for the map...")
            dataCheck <- true
            SendToConsoleP2MM("screenshot datasystemcheck-nutsuccess")
            datasystemcheckerrors = 0
        }
    }
}