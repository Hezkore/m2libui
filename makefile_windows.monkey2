
Namespace m2libui

#Import "<libd2d1.a>"
#Import "<libole32.a>"
#Import "<libgdi32.a>"
#Import "<libuser32.a>"
'#Import "<libkernel32.a>"
#Import "<libuxtheme.a>"
#Import "<libdwrite.a>"
#Import "<libusp10.a>"

#If __ARCH__="x86"
	#Import "manifest/manifest-x86.o"
#Else
	#Import "manifest/manifest-x64.o"
#Endif

#Import "libui-master/windows/alloc.cpp"
#Import "libui-master/windows/area.cpp"
#Import "libui-master/windows/areadraw.cpp"
#Import "libui-master/windows/areaevents.cpp"
#Import "libui-master/windows/areascroll.cpp"
#Import "libui-master/windows/areautil.cpp"
#Import "libui-master/windows/box.cpp"
#Import "libui-master/windows/button.cpp"
#Import "libui-master/windows/checkbox.cpp"
#Import "libui-master/windows/colorbutton.cpp"
#Import "libui-master/windows/colordialog.cpp"
#Import "libui-master/windows/combobox.cpp"
#Import "libui-master/windows/container.cpp"
#Import "libui-master/windows/control.cpp"
#Import "libui-master/windows/d2dscratch.cpp"
#Import "libui-master/windows/datetimepicker.cpp"
#Import "libui-master/windows/debug.cpp"
#Import "libui-master/windows/draw.cpp"
#Import "libui-master/windows/drawmatrix.cpp"
#Import "libui-master/windows/drawpath.cpp"
#Import "libui-master/windows/drawtext.cpp"
#Import "libui-master/windows/dwrite.cpp"
#Import "libui-master/windows/editablecombo.cpp"
#Import "libui-master/windows/entry.cpp"
#Import "libui-master/windows/events.cpp"
#Import "libui-master/windows/fontbutton.cpp"
#Import "libui-master/windows/fontdialog.cpp"
#Import "libui-master/windows/form.cpp"
#Import "libui-master/windows/graphemes.cpp"
#Import "libui-master/windows/grid.cpp"
#Import "libui-master/windows/group.cpp"
#Import "libui-master/windows/init.cpp"
#Import "libui-master/windows/label.cpp"
#Import "libui-master/windows/main.cpp"
#Import "libui-master/windows/menu.cpp"
#Import "libui-master/windows/multilineentry.cpp"
#Import "libui-master/windows/parent.cpp"
#Import "libui-master/windows/progressbar.cpp"
#Import "libui-master/windows/radiobuttons.cpp"
#Import "libui-master/windows/separator.cpp"
#Import "libui-master/windows/sizing.cpp"
#Import "libui-master/windows/slider.cpp"
#Import "libui-master/windows/spinbox.cpp"
#Import "libui-master/windows/stddialogs.cpp"
#Import "libui-master/windows/tab.cpp"
#Import "libui-master/windows/tabpage.cpp"
#Import "libui-master/windows/text.cpp"
#Import "libui-master/windows/utf16.cpp"
#Import "libui-master/windows/utilwin.cpp"
#Import "libui-master/windows/window.cpp"
#Import "libui-master/windows/winpublic.cpp"
#Import "libui-master/windows/winutil.cpp"
#Import "libui-master/windows/winutil.cpp"