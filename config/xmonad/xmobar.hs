------------------------------------------------------------------------------
-- |
-- Copyright: (c) 2018, 2019 Jose Antonio Ortega Ruiz
-- License: BSD3-style (see LICENSE)
--
-- Maintainer: jao@gnu.org
-- Stability: unstable
-- Portability: portable
-- Created: Sat Nov 24, 2018 21:03
--
--
-- An example of a Haskell-based xmobar. Compile it with
--   ghc --make -- xmobar.hs
-- with the xmobar library installed or simply call:
--   xmobar /path/to/xmobar.hs
-- and xmobar will compile and launch it for you and
------------------------------------------------------------------------------

import Xmobar
import Colors

--weatherList :: IO [([Char], [Char])]
--weatherList = do
--    time <- fmap (formatTime defaultTimeLocale "%H") getZonedTime
--    let time' = read time
--    if time' < 19 && time' > 7 --daytime
--        then return [
--            ("clear", "\xf0599"),
--            ("sunny", "\xf0599"),
--            ("mostly clear", "\xf0595"),
--            ("mostly sunny", "\xf0595"),
--            ("partly sunny", "\xf0595"),
--            ("fair", "\xf0595"),
--            ("partly cloudy", "\xf0595"),
--            ("mostly cloudy", "\xf0595"),
--                ("cloudy", "\xf0590"),
--                ("overcast", "\xf0590"),
--                ("considerable cloudiness", "\xf067e")
--        ] 
--        else return [
--            ("clear", "\xf0594"),
--            ("sunny", "\xf0594"),
--            ("mostly clear", "\xf0f31"),
--            ("mostly sunny", "\xf0f31"),
--            ("partly sunny", "\xf0f31"),
--            ("fair", "\xf0f31"),
--            ("partly cloudy", "\xf0f31"),
--            ("mostly cloudy", "\xf0596"),
--                ("cloudy", "\xf0590"),
--                ("overcast", "\xf0590"),
--                ("considerable cloudiness", "\xf067e")
--        ]

config :: Config
config = defaultConfig {
    font = "xft:Inconsolata:size=13,Material Design Icons:size=13",
    alignSep = "}{",
    bgColor = background,
    fgColor = foreground,
    commands = [
        --Run $ WeatherX "CYKZ" [
        --    ("clear", "\xf0599"),
        --    ("sunny", "\xf0599"),
        --    ("mostly clear", "\xf0595"),
        --    ("mostly sunny", "\xf0595"),
        --    ("partly sunny", "\xf0595"),
        --    ("fair", "\xf0595"),
        --    ("partly cloudy", "\xf0595"),
        --    ("mostly cloudy", "\xf0595"),
        --    ("cloudy", "\xf0590"),
        --    ("overcast", "\xf0590"),
        --    ("considerable cloudiness", "\xf067e")
        --]
        --[
        --    "-t", "<skyConditionS> <tempC>C",
        --    "--",
        --    "-w", "NA"
        --] 12000,
        Run StdinReader,
        Run $ Date "%x %T %Z" "date" 10,
        Run $ BatteryP ["BAT0"] [
            "-t", "<acstatus> <left>",
            "--",
            "-P",
            "-O", "\xf0084",
            "-o", "",
            "-i", "\xf12a3",
            "--lows", "\xf12a1",
            "--mediums", "\xf12a2",
            "--highs", "\xf12a3"
        ] 50,
        Run $ Com "/home/cyrusng/bin/dwm/status_scripts/network" ["wlan0"] "wifi" 10,
        Run $ Alsa "default" "Master" [
            "-t", "<status> <volume>%",
            "--",
            "-h", "\xf057e",
            "-m", "\xf0580",
            "-l", "\xf057f",
            "-o", "\xf075f",
            "-O", "",
            "-H", "66",
            "-L", "33",
            "-c", foreground,
            "-C", foreground
        ],
        Run $ Brightness [
            "-t", "\xf00e0 <percent>%",
            "--",
            "-D", "intel_backlight"
        ] 10
        --Run $ Com "/home/cyrusng/bin/dwm/status_scripts/battery" [] "battery" 10,
        --Run Com "/home/cyrusng/bin/dwm/status_scripts/backlight" [] "bright" 10,
    ],
    template = "%StdinReader%}{ %bright% | %alsa:default:Master% |  %wifi% | %battery% | %date%"
}

main :: IO ()
main = xmobar config
