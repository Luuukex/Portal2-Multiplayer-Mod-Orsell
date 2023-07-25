import os
import logging
from datetime import datetime
from pathlib import Path
import Scripts.GlobalVariables as GVars


def Log(message: str) -> None:
    """Writes a message to the log file and prints it in the console

    Parameters
    ----------
    message : str
        message to be logged

    Raises
    ------
    ValueError
        raises error if log is called with an empty message
    """
    message = message.strip()

    if not len(message) > 0:
        raise ValueError("can't log a message with no content")

    logging.info("(P2:MM): " + message)
    print("(P2:MM): " + message)

def StartLog() -> None:
    """Configures the logger and prints the log header"""

    logsPath = os.path.join(GVars.modPath, "Logs")

    Path(logsPath).mkdir(parents=True, exist_ok=True)

    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    logFile = os.path.join(logsPath, f"Log-({datetime.now().strftime('%Y-%m-%d %H-%M-%S')}).log")
    handler = logging.FileHandler(filename=logFile, mode="w", encoding="utf-8")
    logger.addHandler(handler)

    logBanner = """
    ____________________NEW LAUNCH LOG {timestamp}___________________

    ██████╗░░█████╗░██████╗░████████╗░█████╗░██╗░░░░░░░░░░██████╗░
    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║░░░░░░░░░░╚════██╗
    ██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██║░░░░░░░░░░░░███╔═╝
    ██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║░░░░░░░░░░██╔══╝░░
    ██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║███████╗░░░░░███████╗
    ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░░░░╚══════╝

    ░░░░░░███╗░░░███╗██████╗░░░░░███╗░░░███╗░█████╗░██████╗░░░░░░░
    ░░░░░░████╗░████║██╔══██╗░░░░████╗░████║██╔══██╗██╔══██╗░░░░░░
    ░░░░░░██╔████╔██║██████╔╝░░░░██╔████╔██║██║░░██║██║░░██║░░░░░░
    ░░░░░░██║╚██╔╝██║██╔═══╝░░░░░██║╚██╔╝██║██║░░██║██║░░██║░░░░░░
    ░░░░░░██║░╚═╝░██║██║░░░░░░░░░██║░╚═╝░██║╚█████╔╝██████╔╝░░░░░░
    ░░░░░░╚═╝░░░░░╚═╝╚═╝░░░░░░░░░╚═╝░░░░░╚═╝░╚════╝░╚═════╝░░░░░░░
    """.format(timestamp=datetime.now().strftime('%Y-%m-%d %H-%M-%S'))

    Log(logBanner)

    if GVars.iow:
        Log("Windows OS detected!")
    elif GVars.iol:
        Log("Linux OS: detected!")
    elif GVars.iosd:
        Log("Steam Deck: detected!")
