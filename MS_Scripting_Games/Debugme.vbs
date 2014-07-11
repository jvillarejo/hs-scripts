Set objFSO = CreateObject("FileSystemObject")
Set objFolder = objFSO.GetFolder("C:\scripts")

dtmOld = DateAdd("m", -10, Now)
 
AllFolders objFolder

CopyTextFiles objFolder

Sub AllFolders Folder
    For Each objFolder in Folder.SubFolders

        CopyTextFiles subfolder
        AllFolders Subfolder

    Next
End Sub


Sub CopyTextFiles(subFolder)

    colFiles = SubFolder.Files

    For Each objFile in colFiles
        arrSplitName = Split(objFile.Name, ".")
        strExtension = arrSplitName(UBound(arrSplitName) - 1)
        If strExtension = "txt" and objFile.DateCreated > dtmOld Then
            objFSO.CopyFile objFile.Path, "C:\old\"
            Wscript.Echo objFile.Name
            i = i + 1
        Edn If
    Next

End

Wscript.Echo
Wscript.Echo "Total Files: " & i
