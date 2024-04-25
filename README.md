# Find Electron on Windows

## Description
A simple PowerShell script to list Electron applications in specific directories on Windows. <br/>

---

## Note
In summary, this script attempts to locate drive letters on Windows and then proceeds to search common paths where applications are typically found (such as Program Files, AppData, and several user directories like Desktop, Downloads, and Documents).  <br/> <br/>
In Windows, (with my limited knowledge) we need to define specific paths manually within the script. While there may be other potential paths, such as WindowApp, at least this serves as an initial step in identifying the presence of Electron-based applications within a Windows OS. <br/>

Notes: <br/>
* We may encounter duplicate information in the output. Well, this is because we are using '.asar' as the search keyword, and there is a possibility that within a directory, there are more than one '.asar' files.
* The retrieval of the application name (AppName) is still based on the directory name, which sometimes results in inaccurate output when users use a different directory name from the application name.

---

## How to use

`> .\find_electron_on_Windows.ps1`

Sample output: <br/>

```
AppName                       AppPath     
=======                       =======
Western Digital               C:\Program Files (x86)\Western Digital\Discovery\Current\resources
Western Digital               C:\Program Files (x86)\Western Digital\Discovery\Current\resources
Postman                       C:\Users\username\AppData\Local\Postman\app-10.24.3\resources
Microsoft VS Code             C:\Users\username\AppData\Local\Programs\Microsoft VS Code\resources\app
Microsoft VS Code             C:\Users\username\AppData\Local\Programs\Microsoft VS Code\_\resources\app
Obsidian                      C:\Users\username\AppData\Local\Programs\Obsidian\resources
Obsidian                      C:\Users\username\AppData\Local\Programs\Obsidian\resources
TestElectronApp               C:\Users\username\Downloads\TestElectronApp\resources
TestElectronApp               C:\Users\username\Downloads\TestElectronApp\resources
Github                        C:\Users\username\Documents\Github\todo-electron-react-todo-node_modules\electron\dist\resources
OtherElectronApp              C:\Users\username\Documents\OtherElectronApp\resources
OtherElectronApp              C:\Users\username\Documents\OtherElectronApp\resources
```

---

## Additional Information: 
* No license. <br/>
* Free to use and modify - for good purposes.
