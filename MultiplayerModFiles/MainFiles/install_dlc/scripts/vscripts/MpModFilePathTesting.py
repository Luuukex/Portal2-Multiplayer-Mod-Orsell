import os

iow = False
if os.name == 'nt':
    print("(System should be running Windows)")
    iow = True
else:
    print("(System should be running Linux)")

CheckingPath = ""

if (iow):
    print("(System is running Windows)")
    owd = "C:\Program Files(x86)\Steam\steamapps"

    # open libraryfolders.vdf
    with open(owd + "\libraryfolders.vdf", "r") as f:
        s = f.readlines()
        s = s.replace(" ", "")

        # ittarate through the lines
        for line in s:
            print(line)
            if line.startswith('"path"'):
                CheckingPath = line[6:]
                CheckingPath = CheckingPath.replace('"', "")
                print("VAR SET" + CheckingPath)
            if (line == '"620""13432591147"'):
                print("FOUND GAME")
                FinalPath = CheckingPath + "\\steamapps\\common\\Portal 2"
                print(FinalPath)
                break

print("DONE")