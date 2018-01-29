
Namespace m2libui

#Import "<libc>"
Using libc..

#Import "libui-master/ui.h"

#Import "libui-master/common/areaevents.c"
#Import "libui-master/common/control.c"
#Import "libui-master/common/debug.c"
#Import "libui-master/common/matrix.c"
#Import "libui-master/common/shouldquit.c"
#Import "libui-master/common/userbugs.c"

#If __TARGET__="windows"
	#Import "makefile_windows.monkey2"
#ElseIf __TARGET__="macos"
	'#Import "makefile_macos.monkey2"
#ElseIf __TARGET__="linux"
	#Import "makefile_linux.monkey2"
#ElseIf __TARGET__="raspbian"
	'#Import "makefile_raspbian.monkey2"
#ElseIf __TARGET__="emscripten"
	'#Import "makefile_emscripten.monkey2"
#ElseIf __TARGET__="android"
	'#Import "makefile_android.monkey2"
#ElseIf __TARGET__="ios"
	'#Import "makefile_ios.monkey2"
#Endif