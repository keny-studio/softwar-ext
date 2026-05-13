; Windows 11 proper Light/Dark toggle
; AutoHotkey v2
; Hotkey: Ctrl + Alt + D

^!d::
{
    personalize := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

    current := RegRead(personalize, "AppsUseLightTheme", 1)

    if (current = 1)
    {
        ; DARK MODE
        RegWrite(0, "REG_DWORD", personalize, "AppsUseLightTheme")
        RegWrite(0, "REG_DWORD", personalize, "SystemUsesLightTheme")
    }
    else
    {
        ; LIGHT MODE
        RegWrite(1, "REG_DWORD", personalize, "AppsUseLightTheme")
        RegWrite(1, "REG_DWORD", personalize, "SystemUsesLightTheme")
    }

    ; Refresh Windows theme instantly
    DllCall("user32\SendMessageTimeout"
        , "Ptr", 0xFFFF
        , "UInt", 0x1A
        , "Ptr", 0
        , "Str", "ImmersiveColorSet"
        , "UInt", 0x0002
        , "UInt", 100
        , "Ptr", 0)

 }
