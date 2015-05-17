module Main where
import Graphics.X11.Xlib
import Graphics.X11.Xft
import System.Exit (exitWith, ExitCode(..))
import Control.Concurrent (threadDelay)
 
main :: IO ()
main =
 do dpy <- openDisplay ""
    let dflt = defaultScreen dpy
	border = blackPixel dpy dflt
	background = whitePixel dpy dflt
    rootw <- rootWindow dpy dflt
    win <- createSimpleWindow dpy rootw 0 0 100 100 1 border background
    setTextProperty dpy win "Hello World" wM_NAME
    mapWindow dpy win
    let screen = defaultScreenOfDisplay dpy;
	colormap = defaultColormapOfScreen screen;
	visual = defaultVisualOfScreen screen;
    draw <- xftDrawCreate dpy win visual colormap
    font <- xftFontOpen dpy screen "Sans-10"
    putStrLn "ARGARGHÄLLL所x有y网z"
    withXftColorName dpy visual colormap "red" (\color -> xftDrawString draw color font 20 20 "ARGARGHÄLLLzѼÅาป")
    sync dpy False
    threadDelay (10 * 1000000)
    xftDrawDestroy draw
    exitWith ExitSuccess

