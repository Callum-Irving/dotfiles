--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import System.IO
import System.Exit
import qualified Data.Map        as M

myManageHook = composeAll
    [ className =? "Shutter" --> doFloat
    , manageDocks
    ]

myLayout = avoidStruts $ spacing 4 ( tiled ||| Mirror tiled ||| Full ) ||| Full
    where
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio
        
        -- The default number of windows in the master pane
        nmaster = 1
        
        -- Default proportion of screen occupied by master pane
        ratio   = 1/2
        
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100

myStartupHook = do
    spawnOnce "lxsession &"
    spawnOnce "picom &"
    spawnOnce "xidlehook --not-when-fullscreen --not-when-audio --timer 240 'slock' '' --timer 60 'systemctl suspend' '' &"
    spawnOnce "feh --bg-fill ~/Pictures/landscape_mountains_art.jpg"

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ ewmh $ docks defaultConfig
        { modMask = mod4Mask, -- Use Super instead of Alt
          terminal = "kitty",
          borderWidth = 0,
          focusFollowsMouse = False,
          manageHook = myManageHook,
          layoutHook = myLayout,
          startupHook = myStartupHook,
          handleEventHook = handleEventHook def <+> fullscreenEventHook,
          logHook = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc,
                  ppTitle = xmobarColor "green" "" . shorten 50
                    }
        } `additionalKeys`
        [
            ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 5%- unmute"),
            ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 5%+ unmute"),
            ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle"),
            ((mod4Mask .|. shiftMask, xK_b ), spawn "brave"),
            ((mod4Mask, xK_s               ), spawn "systemctl suspend"),
            ((mod4Mask .|. shiftMask, xK_s ), spawn "systemctl poweroff"),
            ((0, xK_Print                  ), spawn "shutter")
        ]


