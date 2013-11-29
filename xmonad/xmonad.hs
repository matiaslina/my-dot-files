import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import System.IO

import XMonad.Layout.Spacing

-- Trying shell
import XMonad.Prompt
import XMonad.Prompt.Shell

myLayout = tiled ||| Mirror tiled ||| Full
    where
        --default tiling algoritm
        tiled = Tall nmaster delta ratio

        -- default number of windows in master pane
        nmaster = 1

        -- Default proportion of screen occupied
        ratio = 6/10

        -- persent of screen to increment by when resizin panes
        delta = 3/100

-- shell prompt config
mySP = defaultXPConfig
       {
           font     = "xft:Fira Mono:pixelsize=10",
           bgColor  = "#000000",
           fgHLight = "#f8f8f8",
           bgHLight = "#125ba6",
           borderColor = "#125ba6",
           promptBorderWidth = 1,
           position = Bottom,
           height = 15,
           -- Supongo que sera algo como el comando por
           -- defecto. 
           defaultText = []
       }

main = do
    xmproc <- spawnPipe "xmobar"
    --spawn trayerScript
    --spawn "nm-applet"
    spawn "nitrogen --restore"
    xmonad $ defaultConfig
        { terminal = "gnome-terminal"
        , modMask = mod4Mask
        , borderWidth = 1
        , normalBorderColor = "#000"
        , focusedBorderColor = "#125ba6"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ myLayout
        --, layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            , ppLayout = const "" 
            }
        } `additionalKeys` [
            -- Faltaria instalarlo :p pero por ahora va bien.
            ((mod4Mask, xK_o), spawn "firefox"),
            ((mod4Mask .|. shiftMask, xK_o), spawn "thunderbird"),
            ((mod4Mask, xK_p), shellPrompt mySP),
            ((mod4Mask, xK_b), sendMessage ToggleStruts)
        ]

trayerScript = "trayer --align right --edge top --widthtype pixel --width 76 --height 8 --SetDockType true --SetPartialStrut true  --transparent true --alpha 0 --tint 0x000000"
