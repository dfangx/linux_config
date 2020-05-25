import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.Scratchpad
import XMonad.Util.NamedScratchpad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen
import Colors

import System.Exit
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M
import qualified XMonad.StackSet as W

myTerminal = "st"
myBrowser = "firefox"
myLauncher = "dmenu_run -fn Inconsolata:size=13 -nb \"" ++ background ++ "\" -nf \"" ++ foreground ++ "\""
myStatusBar = "xmobar ~/.config/xmonad/xmobar.hs"-- -B \"" ++ background ++ "\" -F \"" ++ foreground ++ "\""

volumeUpScript = "~/bin/acpi/actions/vol_u"
volumeDownScript = "~/bin/acpi/actions/vol_d"
volumeMuteScript = "~/bin/acpi/actions/vol_m"

myFocusFollowsMouse = False
myClickJustFocuses = False
myKeys conf@(XConfig {modMask = modKey}) = M.fromList $
    [ 
        ((modKey, xK_b), spawn myBrowser),
        ((modKey, xK_Return), spawn $ XMonad.terminal conf),
        ((modKey .|. shiftMask, xK_b), sendMessage ToggleStruts),
        ((modKey, xK_d), spawn myLauncher),
        ((modKey, xK_w), spawn "wal -i ~/pictures/wallpapers && xmonad --recompile && xmonad --restart"),
        ((modKey, xK_p), spawn "keepassxc"),
        ((modKey .|. shiftMask, xK_q), kill),
        ((modKey, xK_Tab), sendMessage NextLayout),
        ((modKey .|. shiftMask, xK_Tab), setLayout $ XMonad.layoutHook conf),
        ((modKey .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart"),
        ((modKey .|. shiftMask, xK_e), io (exitWith ExitSuccess)),
        ((modKey, xK_j), windows W.focusDown),
        ((modKey, xK_k), windows W.focusUp),
        ((modKey, xK_m), windows W.focusMaster),
        ((modKey .|. shiftMask, xK_m), windows W.swapMaster),
        ((modKey .|. shiftMask, xK_j), windows W.swapDown),
        ((modKey .|. shiftMask, xK_k), windows W.swapUp),
        ((modKey, xK_h), sendMessage Shrink),
        ((modKey, xK_l), sendMessage Expand),
        ((modKey .|. shiftMask, xK_l), spawn "betterlockscreen -l"),
        ((modKey .|. shiftMask, xK_i), sendMessage(IncMasterN(1))),
        ((modKey .|. shiftMask, xK_d), sendMessage(IncMasterN(-1))),
        ((modKey, xK_s), namedScratchpadAction myScratchPads "terminal")
        --((modKey, xK_p), namedScratchpadAction myScratchPads "keepassxc")
        --((0, xF86XK_AudioRaiseVolume), spawn volumeUpScript),
        --((0, xF86XK_AudioLowerVolume), spawn volumeDownScript),
        --((0, xF86XK_AudioMute), spawn volumeMuteScript)
    ]
    ++
    [
        ((m .|. modKey, k), windows $ f i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1..xK_9],
        (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]

myLogHook = dynamicLogWithPP . myPP
myPP h = xmobarPP {
        ppOutput = hPutStrLn h,
        ppLayout = (\layout -> case layout of
            "Tall" -> "[|]"
            "Mirror Tall" -> "[-]"
            "Full" -> "[M]"
        ),
        ppCurrent = xmobarColor foreground color1 . wrap " " " ",
        ppVisible = xmobarColor foreground background . wrap " " " ",
        ppTitle = xmobarColor foreground background . shorten 80,
        ppSep = " "
    }

myStartupHook = do
    spawnOnce "redshift &"
    spawnOnce "picom --config ~/.config/picom/picom.conf -b --experimental-backends"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "wal -R"
myLayoutHook = avoidStruts $ layoutHook def
myHandleEventHook = handleEventHook def
myManageHook = 
    manageHook def 
    <+> namedScratchpadManageHook myScratchPads 
    <+> composeAll [
        resource =? "keepassxc" --> doFloat
    ]

myScratchPads = [ 
        NS "terminal" "st -n terminal" (resource =? "terminal") defaultFloating,
        NS "keepasssxc" "keepassxc" (resource =? "keepassxc") defaultFloating
    ]

myConfig xmproc = def {
        terminal = myTerminal,
        modMask = mod4Mask,
        borderWidth = 0,
        focusFollowsMouse = myFocusFollowsMouse,
        clickJustFocuses = myClickJustFocuses,
        keys = myKeys,
        logHook = myLogHook xmproc,
        layoutHook = myLayoutHook,
        handleEventHook = myHandleEventHook,
        startupHook = myStartupHook
    }

main = do
    xmproc <- spawnPipe myStatusBar
    xmonad $ fullscreenSupport $ ewmh $ docks $ myConfig xmproc
