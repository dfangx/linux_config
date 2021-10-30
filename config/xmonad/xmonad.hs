import System.Exit

import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W
import XMonad.Actions.PhysicalScreens
import XMonad.Layout.IndependentScreens

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks
import XMonad.Util.Loggers

myTerminal = "alacritty"
myBrowser = "firefox"
myPswdMgr = "keepassxc"
myLauncher = myTerminal ++ " --class fzf-run --title fzf-run -e fzf-run"
myLockscreen = "betterlockscreen -l"
myModMask = mod4Mask
myXmobarConfig = "~/.config/xmonad/xmobarrc"
myFont = "xft:Inconsolata:size=13,Material Design Icons:size=13"

mySB (S sid) = pure $ statusBarProp ("xmobar -x " ++ show sid ++ " " ++ myXmobarConfig) (pure myXmobarPP)
main :: IO()
main = xmonad 
    . ewmhFullscreen 
    . dynamicSBs mySB
    . ewmh 
    . docks
    $ myConfig
    `additionalKeys` ( myKeys myConfig )

myConfig = def
    { modMask = myModMask
    , terminal = myTerminal
    , layoutHook = myLayout
    , manageHook = myManageHook
    , handleEventHook = myEventHook
    , borderWidth = 0
    , focusFollowsMouse = False
    }
    
myKeys conf = 
    [ ((myModMask, xK_b), spawn myBrowser)
    , ((myModMask, xK_semicolon), spawn $ XMonad.terminal conf)
    , ((myModMask, xK_d), spawn myLauncher)

    , ((myModMask, xK_p), namedScratchpadAction myScratchpads "pswdmgr")
    , ((myModMask, xK_s), namedScratchpadAction myScratchpads "scratch")

    , ((myModMask .|. shiftMask, xK_s), unGrab *> spawn "snip")

    , ((myModMask .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((myModMask .|. shiftMask, xK_h), sendMessage Shrink)
    , ((myModMask .|. shiftMask, xK_l), sendMessage Expand)
    , ((myModMask, xK_i), sendMessage (IncMasterN 1))
    , ((myModMask .|. shiftMask, xK_i), sendMessage (IncMasterN (-1)))

    , ((myModMask .|. shiftMask, xK_b), sendMessage ToggleStruts)

    , ((myModMask .|. shiftMask, xK_q), kill)
    , ((myModMask .|. shiftMask, xK_r), spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
    , ((myModMask .|. shiftMask, xK_e), io (exitWith ExitSuccess))

    , ((myModMask, xK_period), onPrevNeighbour def W.view)
    , ((myModMask, xK_comma), onNextNeighbour def W.view)
    , ((myModMask .|. shiftMask, xK_period), onPrevNeighbour def W.shift)
    , ((myModMask .|. shiftMask, xK_comma), onNextNeighbour def W.shift)
    ]

myScratchpads =
    [ NS "scratch" (myTerminal ++ " --title scratch -o window.dimensions.columns=120 -o window.dimensions.lines=34") (title =? "scratch") doCenterFloat
    , NS "pswdmgr" myPswdMgr (className =? "KeePassXC") doCenterFloat
    ]

myEventHook = docksEventHook

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myManageHook = composeAll
    [ namedScratchpadManageHook myScratchpads
    , insertPosition Master Newer
    , isDialog --> doFloat
    , title =? "fzf-run" --> doCenterFloat
    ]

myXmobarPP = def
    { ppCurrent = xmobarColor "#88c0d0" "#434c5e" . wrap " " " "
    , ppVisible = wrap "(" ")"
    , ppLayout = (\layout -> case layout of
          "Tall" -> "[]="
          "Mirror Tall" -> "TTT"
          "Full" -> "[M]"
      )
    , ppSep = " "
    }
-- import XMonad
-- import XMonad.Hooks.DynamicLog
-- import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.ManageHelpers
-- import XMonad.Util.Run(spawnPipe, hPutStrLn)
-- import XMonad.Util.Scratchpad
-- import XMonad.Util.NamedScratchpad
-- import XMonad.Util.SpawnOnce
-- import XMonad.Hooks.EwmhDesktops
-- import XMonad.Layout.Fullscreen
-- import Colors
-- 
-- import System.Exit
-- import Graphics.X11.ExtraTypes.XF86
-- 
-- import qualified Data.Map as M
-- import qualified XMonad.StackSet as W
-- 
-- myTerminal = "st"
-- myBrowser = "firefox"
-- myLauncher = "dmenu_run -fn Inconsolata:size=13 -nb \"" ++ background ++ "\" -nf \"" ++ foreground ++ "\""
-- myStatusBar = "xmobar ~/.config/xmonad/xmobar.hs"-- -B \"" ++ background ++ "\" -F \"" ++ foreground ++ "\""
-- 
-- volumeUpScript = "~/bin/acpi/actions/vol_u"
-- volumeDownScript = "~/bin/acpi/actions/vol_d"
-- volumeMuteScript = "~/bin/acpi/actions/vol_m"
-- 
-- myFocusFollowsMouse = False
-- myClickJustFocuses = False
-- myKeys conf@(XConfig {modMask = modKey}) = M.fromList $
--     [ 
--         ((modKey, xK_b), spawn myBrowser),
--         ((modKey, xK_Return), spawn $ XMonad.terminal conf),
--         ((modKey .|. shiftMask, xK_b), sendMessage ToggleStruts),
--         ((modKey, xK_d), spawn myLauncher),
--         ((modKey, xK_w), spawn "wal -i ~/pictures/wallpapers && xmonad --recompile && xmonad --restart"),
--         ((modKey, xK_p), spawn "keepassxc"),
--         ((modKey .|. shiftMask, xK_q), kill),
--         ((modKey, xK_Tab), sendMessage NextLayout),
--         ((modKey .|. shiftMask, xK_Tab), setLayout $ XMonad.layoutHook conf),
--         ((modKey .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart"),
--         ((modKey .|. shiftMask, xK_e), io (exitWith ExitSuccess)),
--         ((modKey, xK_j), windows W.focusDown),
--         ((modKey, xK_k), windows W.focusUp),
--         ((modKey, xK_m), windows W.focusMaster),
--         ((modKey .|. shiftMask, xK_m), windows W.swapMaster),
--         ((modKey .|. shiftMask, xK_j), windows W.swapDown),
--         ((modKey .|. shiftMask, xK_k), windows W.swapUp),
--         ((modKey, xK_h), sendMessage Shrink),
--         ((modKey, xK_l), sendMessage Expand),
--         ((modKey .|. shiftMask, xK_l), spawn "betterlockscreen -l"),
--         ((modKey .|. shiftMask, xK_i), sendMessage(IncMasterN(1))),
--         ((modKey .|. shiftMask, xK_d), sendMessage(IncMasterN(-1))),
--         ((modKey, xK_s), namedScratchpadAction myScratchPads "terminal")
--         --((modKey, xK_p), namedScratchpadAction myScratchPads "keepassxc")
--         --((0, xF86XK_AudioRaiseVolume), spawn volumeUpScript),
--         --((0, xF86XK_AudioLowerVolume), spawn volumeDownScript),
--         --((0, xF86XK_AudioMute), spawn volumeMuteScript)
--     ]
--     ++
--     [
--         ((m .|. modKey, k), windows $ f i)
--             | (i, k) <- zip (XMonad.workspaces conf) [xK_1..xK_9],
--         (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
--     ]
-- 
-- myLogHook = dynamicLogWithPP . myPP
-- myPP h = xmobarPP {
--         ppOutput = hPutStrLn h,
--         ppLayout = (\layout -> case layout of
--             "Tall" -> "[|]"
--             "Mirror Tall" -> "[-]"
--             "Full" -> "[M]"
--         ),
--         ppCurrent = xmobarColor foreground color1 . wrap " " " ",
--         ppVisible = xmobarColor foreground background . wrap " " " ",
--         ppTitle = xmobarColor foreground background . shorten 80,
--         ppSep = " "
--     }
-- 
-- myStartupHook = do
--     spawnOnce "redshift &"
--     spawnOnce "picom --config ~/.config/picom/picom.conf -b --experimental-backends"
--     spawnOnce "xsetroot -cursor_name left_ptr"
--     spawnOnce "wal -R"
-- myLayoutHook = avoidStruts $ layoutHook def
-- myHandleEventHook = handleEventHook def
-- myManageHook = 
--     manageHook def 
--     <+> namedScratchpadManageHook myScratchPads 
--     <+> composeAll [
--         resource =? "keepassxc" --> doFloat
--     ]
-- 
-- myScratchPads = [ 
--         NS "terminal" "st -n terminal" (resource =? "terminal") defaultFloating,
--         NS "keepasssxc" "keepassxc" (resource =? "keepassxc") defaultFloating
--     ]
-- 
-- myConfig xmproc = def {
--         terminal = myTerminal,
--         modMask = mod4Mask,
--         borderWidth = 0,
--         focusFollowsMouse = myFocusFollowsMouse,
--         clickJustFocuses = myClickJustFocuses,
--         keys = myKeys,
--         logHook = myLogHook xmproc,
--         layoutHook = myLayoutHook,
--         handleEventHook = myHandleEventHook,
--         startupHook = myStartupHook
--     }
-- 
-- main = do
--     xmproc <- spawnPipe myStatusBar
--     xmonad $ fullscreenSupport $ ewmh $ docks $ myConfig xmproc
