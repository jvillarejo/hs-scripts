Option Strict Off
Option Explicit Off
Imports System
Imports EnvDTE
Imports EnvDTE80
Imports EnvDTE90
Imports EnvDTE90a
Imports EnvDTE100
Imports System.Diagnostics

Public Module Utils
    Declare Sub Sleep Lib "kernel32" Alias "Sleep" (ByVal dwMilliseconds As Long)

    Dim WithEvents t As Timers.Timer
    Sub RebuildAndDeploy()
        If Not DTE.ActiveDocument Is Nothing Then
            DTE.ExecuteCommand("View.Output")
            DTE.Windows.Item(Constants.vsWindowKindOutput).AutoHides = False
            Try
                DTE.ExecuteCommand("Build.RebuildSelection")
            Catch ex As Exception
                DTE.Windows.Item(Constants.vsWindowKindOutput).AutoHides = True
                Exit Sub
            End Try
            t = New Timers.Timer
            t.Interval = 1
            t.Start()
        End If
    End Sub
    Sub t_Elapsed(ByVal ee As Object, ByVal dd As Timers.ElapsedEventArgs) Handles t.Elapsed
        If DTE.Solution.SolutionBuild.BuildState <> vsBuildState.vsBuildStateInProgress Then
            t.Close()
            If t.Interval = 1 Then
                t.Interval = 100
                Call Execute("C:\hs-scripts\updBin.vbs")
                Sleep(5000)
                DTE.Windows.Item(Constants.vsWindowKindOutput).AutoHides = True
            End If
        End If
    End Sub

    Sub Execute(ByVal strApp As String)
        objShell = CreateObject("WScript.Shell")
        objShell.Run(strApp)
        objShell = Nothing
    End Sub

    Sub AttachToW3WP()
        If Not DTE.ActiveDocument Is Nothing Then
            If DTE.Debugger.CurrentMode <> dbgDebugMode.dbgDesignMode Then
                DTE.Debugger.Stop(True)
            End If
            DTE.ExecuteCommand("View.Output")
            DTE.Windows.Item(Constants.vsWindowKindOutput).AutoHides = False
            Try
                Dim dbg2 As EnvDTE80.Debugger2 = DTE.Debugger
                Dim trans As EnvDTE80.Transport = dbg2.Transports.Item("Default")
                Dim dbgeng(1) As EnvDTE80.Engine
                dbgeng(0) = trans.Engines.Item("Managed (v2.0, v1.1, v1.0)")
                Dim proc2 As EnvDTE80.Process2 = dbg2.GetProcesses(trans, ".").Item("w3wp.exe")
                proc2.Attach2(dbgeng)
            Catch ex As System.Exception
                MsgBox("Error encountered while trying to attach to the w3wp.exe process:" & vbCrLf & ex.Message, MsgBoxStyle.Critical, "AttachToW3WP")
                DTE.ExecuteCommand("Tools.AttachtoProcess")
            End Try
            Sleep(2000)
            DTE.Windows.Item(Constants.vsWindowKindOutput).AutoHides = True
        End If
    End Sub

End Module
