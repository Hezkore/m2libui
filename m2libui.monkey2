#Import "<libc>"
#Import "<libd2d1.a>"
#Import "<libole32.a>"
#Import "<libgdi32.a>"
#Import "<libuser32.a>"
#Import "<libkernel32.a>"
#Import "<libuxtheme.a>"
#Import "<libdwrite.a>"
#Import "<libusp10.a>"

Using libc..

#Import "libui-master/ui.h"

#Import "libui-master/common/areaevents.c"
#Import "libui-master/common/control.c"
#Import "libui-master/common/debug.c"
#Import "libui-master/common/matrix.c"
#Import "libui-master/common/shouldquit.c"
#Import "libui-master/common/userbugs.c"

#If __TARGET__="macos"
	#Import "libui-master/darwin/alloc.m"
	'Add every other file from the 'darwin' folder here
#Elseif __TARGET__="linux"
	#Import "libui-master/unix/alloc.c"
	'Add every other file from the 'unix' folder here
#Elseif __TARGET__="windows"
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
#End

Extern
	
	' INIT
	Struct uiInitOptions
		Field Size:size_t
	End
	
	Function uiInit:String( options:uiInitOptions Ptr )
	Function uiUninit:Void()
	Function uiFreeInitError:Void( err:CString )
	
	' MAIN
	Function uiMain:void()
	Function uiMainSteps:void()
	Function uiMainStep:Int( wait:Int )
	Function uiQuit:Void()
	
	Function uiQueueMain:Void( func:Void( data:Void Ptr ), data:Void Ptr )
	
	Function uiOnShouldQuit:Void( func:Int( data:Void Ptr=Null ), data:Void Ptr=Null )
	
	Function uiFreeText:Void( text:CString )
	
	
	' PROBLEM(?)
	' Should be a struct I guess? Is in C source...
	' But classes (like buttons etc.) can't extend structs
	
	' CONTROL
	Class uiControl
		Field Signature:uint32_t
		Field OSSignature:uint32_t
		Field TypeSignature:uint32_t
		Field Control:uiControl
	End
	
	Function uiControlDestroy:Void( ui:uiControl )
	Function uiControlHandle:uintptr_t( ui:uiControl )
	Function uiControlParent:uiControl( ui:uiControl )
	Function uiControlSetParent:Void( ui:uiControl, ui:uiControl )
	Function uiControlToplevel:Int( ui:uiControl )
	Function uiControlVisible:Int( ui:uiControl )
	Function uiControlShow:Void( ui:uiControl )
	Function uiControlHide:Void( ui:uiControl )
	Function uiControlEnabled:Int( ui:uiControl )
	Function uiControlEnable:Void( ui:uiControl )
	Function uiControlDisable:Void( ui:uiControl )
	
	Function uiAllocControl:uiControl( n:size_t, OSsig:uint32_t, typesig:uint32_t, typenamestr:CString )
	Function uiFreeControl:Void( ui:uiControl )
	
	Function uiControlVerifySetParent:Void( ui:uiControl, ui:uiControl )
	Function uiControlEnabledToUser:Int( ui:uiControl )
	
	' WINDOW
	Class uiWindow Extends uiControl
	End
	
	Function uiWindowTitle:String( ui:uiWindow )
	Function uiWindowSetTitle:Void( ui:uiWindow, title:CString )
	Function uiWindowContentSize:Void( ui:uiWindow, width:Int, height:Int )
	Function uiWindowSetContentSize:Void( ui:uiWindow, width:Int, height:Int )
	Function uiWindowFullscreen:Int( ui:uiWindow )
	Function uiWindowSetFullscreen:Void( ui:uiWindow, fullscreen:Int )
	Function uiWindowOnContentSizeChanged:Void( ui:uiWindow, func:Void( ui:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiWindowOnClosing:Void( ui:uiWindow, func:Int( ui:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiWindowBorderless:Int( ui:uiWindow )
	Function uiWindowSetBorderless:Void( ui:uiWindow, borderless:Int )
	Function uiWindowSetChild:Void( ui:uiWindow, child:uiControl )
	Function uiWindowMargined:Int( ui:uiWindow )
	Function uiWindowSetMargined:Void( ui:uiWindow, margined:Int )
	Function uiNewWindow:uiWindow( title:CString, width:Int, height:Int, hasMenubar:Int )
	
	' BUTTON
	Class uiButton Extends uiControl
	End
	
	Function uiButtonText:String( ui:uiButton )
	Function uiButtonSetText:Void( ui:uiButton, text:CString )
	Function uiButtonOnClicked:Void( ui:uiButton, func:Void( ui:uiButton, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewButton:uiButton( char:CString )
	
	' BOX
	Class uiBox Extends uiControl
	End
	
	Function uiBoxAppend:Void( ui:uiBox, child:uiControl, stretchy:Int )
	Function uiBoxDelete( ui:uiBox, index:Int )
	Function uiBoxPadded:Int( ui:uiBox )
	Function uiBoxSetPadded( ui:uiBox, padded:Int )
	Function uiNewHorizontalBox:uiBox()
	Function uiNewVerticalBox:uiBox()
	
	' CHECKBOX
	Class uiCheckbox Extends uiControl
	End
	
	Function uiCheckboxText:String( ui:uiCheckbox )
	Function uiCheckboxSetText:Void( ui:uiCheckbox, text:CString )
	Function uiCheckboxOnToggled:Void( ui:uiCheckbox, func:Void( ui:uiCheckbox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiCheckboxChecked:Int( ui:uiCheckbox )
	Function uiCheckboxSetChecked:Void( ui:uiCheckbox, checked:Int )
	Function uiNewCheckbox:uiCheckbox( text:CString )
	
	' ENTRY
	Class uiEntry Extends uiControl
	End
	
	Function uiEntryText:String( ui:uiEntry )
	Function uiEntrySetText:Void( ui:uiEntry, text:CString )
	Function uiEntryOnChanged:Void( ui:uiEntry, func:Void( ui:uiEntry, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiEntryReadOnly:Int( ui:uiEntry )
	Function uiEntrySetReadOnly:Void( ui:uiEntry, readonly:Int )
	Function uiNewEntry:uiEntry()
	Function uiNewPasswordEntry:uiEntry()
	Function uiNewSearchEntry:uiEntry()
	
	' LABEL
	Class uiLabel Extends uiControl
	End
	
	Function uiLabelText:String( ui:uiLabel )
	Function uiLabelSetText:Void( ui:uiLabel, text:CString )
	Function uiNewLabel:uiLabel( text:CString )
	
	' TAB
	Class uiTab Extends uiControl
	End
	
	Function uiTabAppend:Void( ui:uiTab, name:CString, ui:uiControl )
	Function uiTabInsertAt:Void( ui:uiTab, name:Cstring, before:Int, ui:uiControl )
	Function uiTabDelete:Void( ui:uiTab, index:Int )
	Function uiTabNumPages:Int( ui:uiTab )
	Function uiTabMargined:Int( ui:uiTab, page:Int )
	Function uiTabSetMargined:Void( ui:uiTab, page:Int, margined:Int )
	Function uiNewTab:uiTab()
	
	' GROUP
	Class uiGroup Extends uiControl
	End
	
	Function uiGroupTitle:String( ui:uiGroup )
	Function uiGroupSetTitle:Void( ui:uiGroup, title:CString )
	Function uiGroupSetChild:Void( ui:uiGroup, uiControl)
	Function uiGroupMargined:Int( ui:uiGroup)
	Function uiGroupSetMargined:Void( ui:uiGroup, margined:Int )
	Function uiNewGroup:uiGroup( title:CString )
	
	' SPINBOX
	Class uiSpinbox Extends uiControl
	End
	
	Function uiSpinboxValue:Int( ui:uiSpinbox )
	Function uiSpinboxSetValue:Void( ui:uiSpinbox, value:Int )
	Function uiSpinboxOnChanged:Void( ui:uiSpinbox, func:Void( ui:uiSpinbox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewSpinbox:uiSpinbox( min:Int, max:Int )
	
	' SLIDER
	Class uiSlider Extends uiControl
	End
	
	Function uiSliderValue:Int(uiSlider)
	Function uiSliderSetValue:Void(ui:uiSlider, value:Int)
	Function uiSliderOnChanged:Void(ui:uiSlider, func:Void(ui:uiSlider, data:Void Ptr=Null), data:Void Ptr=Null)
	Function uiNewSlider:uiSlider(min:Int, max:Int)
	
	' PROGRESSBAR
	Class uiProgressBar Extends uiControl
	End
	
	Function uiProgressBarValue:Int(uiProgressBar)
	Function uiProgressBarSetValue(ui:uiProgressBar, n:Int)
	Function uiNewProgressBar:uiProgressBar()
	
	' SEPARATOR
	Class uiSeparator Extends uiControl
	End
	
	Function uiNewHorizontalSeparator:uiSeparator()
	Function uiNewVerticalSeparator:uiSeparator()
	
	' COMBOBOX
	Class uiCombobox Extends uiControl
	End
	
	Function uiComboboxAppend(ui:uiCombobox, text:CString)
	Function uiComboboxSelected:Int( ui:uiCombobox )
	Function uiComboboxSetSelected(ui:uiCombobox, n:Int)
	Function uiComboboxOnSelected(ui:uiCombobox, func:Void(ui:uiCombobox, data:Void Ptr=Null), data:Void Ptr=Null)
	Function uiNewCombobox:uiCombobox()
	
	' EDITABLE COMBOBOX
	Class uiEditableCombobox Extends uiControl
	End
	
	Function uiEditableComboboxAppend(ui:uiEditableCombobox, text:CString)
	Function uiEditableComboboxText:String(uiEditableCombobox)
	Function uiEditableComboboxSetText(ui:uiEditableCombobox, text:CString)
	Function uiEditableComboboxOnChanged(ui:uiEditableCombobox, func:Void(ui:uiEditableCombobox, data:Void Ptr=Null), data:Void Ptr=Null)
	Function uiNewEditableCombobox:uiEditableCombobox()
	
	' RADIO BUTTON
	Class uiRadioButtons Extends uiControl
	End
	
	Function uiRadioButtonsAppend(ui:uiRadioButtons, text:CString)
	Function uiRadioButtonsSelected:int(uiRadioButtons)
	Function uiRadioButtonsSetSelected(ui:uiRadioButtons, n:Int)
	Function uiRadioButtonsOnSelected(ui:uiRadioButtons, func:Void( ui:uiRadioButtons, data:Void Ptr=Null ), data:Void Ptr=Null)
	Function uiNewRadioButtons:uiRadioButtons()
	
	' TIME PICKER
	Class uiDateTimePicker Extends uiControl
	End
	
	Function uiNewDateTimePicker:uiDateTimePicker()
	Function uiNewDatePicker:uiDateTimePicker()
	Function uiNewTimePicker:uiDateTimePicker()

	' MULTI LINE ENTRY
	Class uiMultilineEntry Extends uiControl
	End
	
	Function uiMultilineEntryText:String(uiMultilineEntry)
	Function uiMultilineEntrySetText(ui:uiMultilineEntry, text:CString)
	Function uiMultilineEntryAppend(ui:uiMultilineEntry, text:CString)
	Function uiMultilineEntryOnChanged(ui:uiMultilineEntry, func:Void(ui:uiMultilineEntry, data:Void Ptr=Null), data:Void Ptr=Null)
	Function uiMultilineEntryReadOnly:Int(ui:uiMultilineEntry)
	Function uiMultilineEntrySetReadOnly(ui:uiMultilineEntry, readonly:Int)
	Function uiNewMultilineEntry:uiMultilineEntry()
	Function uiNewNonWrappingMultilineEntry:uiMultilineEntry()
	
	' MENU ITEM
	Class uiMenuItem Extends uiControl
	End
	
	Function uiMenuItemEnable(ui:uiMenuItem)
	Function uiMenuItemDisable(ui:uiMenuItem)
	Function uiMenuItemOnClicked( ui:uiMenuItem, func:Void( sender:uiMenuItem, window:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiMenuItemChecked:Int(ui:uiMenuItem)
	Function uiMenuItemSetChecked(ui:uiMenuItem, checked:Int)
	
	' MENU
	Class uiMenu Extends uiControl
	End
	
	Function uiMenuAppendItem:uiMenuItem(ui:uiMenu, name:CString)
	Function uiMenuAppendCheckItem:uiMenuItem(ui:uiMenu, name:CString)
	Function uiMenuAppendQuitItem:uiMenuItem(ui:uiMenu)
	Function uiMenuAppendPreferencesItem:uiMenuItem(ui:uiMenu)
	Function uiMenuAppendAboutItem:uiMenuItem(ui:uiMenu)
	Function uiMenuAppendSeparator(ui:uiMenu)
	Function uiNewMenu:uiMenu(name:CString)
	
	' DIALOG
	Function uiOpenFile:String( parent:uiWindow )
	Function uiSaveFile:String( parent:uiWindow )
	Function uiMsgBox( parent:uiWindow, title:CString, description:CString)
	Function uiMsgBoxError( parent:uiWindow, title:CString, description:CString)

Internal


' PROBLEM
' Do not press any keys (like Escape) in the example
' You can type in the input
' But any key presses outside of that crashes the window

'==EXAMPLE=========
Function Test:Void( ui:uiButton, data:Void Ptr )
	uiControlDisable( ui )
End

Function ButtonPopup:Void( ui:uiButton, data:Void Ptr )
	' PROBLEM
	' uiMsgBox wants a parent window
	' We could get that via uiControlParent( button pressed )
	' Problem is that parent is returned as "uiControl" and it wants "uiWindow"
	' Casting to "uiWindow" doesn't seem to work either
	
	'uiMsgBox( uiControlParent( ui ), "Yes?", "You clicked..." )
	'uiMsgBox( Cast<uiWindow>(uiControlParent( ui )), "Yes?", "You clicked..." )
End

Function WindowClose:Int( ui:uiWindow, data:Void Ptr )
	Print "BYE!"
	uiQuit()
	Return True 'Allow close
End

Function Main()
	
	Local options:uiInitOptions
	uiInit( Varptr options )
	
	' PROBLEM
	' Local window:uiWindow works fine
	' But a Global window:uiWindow does NOT work for some reason
	
	Local window:=uiNewWindow( "asd",640,64,0 )
	'Global window:=uiNewWindow( "asd",640,64,0 )
	
	uiControlShow( window )
	uiWindowOnClosing( window, WindowClose )
	
	Local box:=uiNewHorizontalBox()
	uiWindowSetChild( window, box )
	
	Local button:=uiNewButton( "Button1" )
	uiBoxAppend( box, button, 0 )
	
	' PROBLEM
	' Passing a "real" function works just fine when pressing the button
	' But doing Lambda doesn't work, only returns "Null Function Error" when pressed
	
	uiButtonOnClicked( button, Test )
	'uiButtonOnClicked( button, Lambda( ui:uiButton, data:Void Ptr )
	'	Print "Hello!"
	'End )
	
	Local button2:=uiNewButton( "Button2" )
	uiBoxAppend( box, button2, 0 )
	uiButtonOnClicked( button2, ButtonPopup )
	
	Local checkbox:=uiNewCheckbox( "Check" )
	uiBoxAppend( box, checkbox, 0 )
	
	Local entry:=uiNewMultilineEntry()
	uiBoxAppend( box, entry, 0 )
	
	Local password:=uiNewPasswordEntry()
	uiBoxAppend( box, password, 0 )
	
	Local search:=uiNewSearchEntry()
	uiBoxAppend( box, search, 0 )
	
	' NOTICE
	' This updates the window for us
	' We can either update it ourselves with uiMainStep
	' Or we can let libui take care of it and use minimal CPU via uiMain
	' Remember that uiMain is blocking
	
	uiMain()
	'Repeat
	'	uiMainStep(0)
	'Forever
End