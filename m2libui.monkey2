' Monkey2 Libui module
' By @Hezkore 2018
' https://github.com/Hezkore/m2libui

Namespace m2libui

#Import "libui-master/ui.h"

' PROBLEM
' This only works on Windows so far
' Please edit/make the makefile_yourOS.monkey2 to complete this module

#Import "makefile.monkey2"

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

Function onClosing:Int( ui:uiWindow, data:Void Ptr )
	Print "BYE!"
	uiQuit()
	Return True 'Allow close
End

Function Main()
	
	Local options:uiInitOptions
	uiInit( Varptr options )
	
	Local menu:= uiNewMenu("File")
	Local item:= uiMenuAppendItem(menu, "Open")
	'uiMenuItemOnClicked(item, openClicked, Null)
	item = uiMenuAppendItem(menu, "Save")
	'uiMenuItemOnClicked(item, saveClicked, Null)
	item = uiMenuAppendQuitItem(menu)
	'uiOnShouldQuit(shouldQuit, Null)

	menu = uiNewMenu("Edit")
	item = uiMenuAppendCheckItem(menu, "Checkable Item")
	uiMenuAppendSeparator(menu)
	item = uiMenuAppendItem(menu, "Disabled Item")
	uiMenuItemDisable(item)
	item = uiMenuAppendPreferencesItem(menu)

	menu = uiNewMenu("Help")
	item = uiMenuAppendItem(menu, "Help")
	item = uiMenuAppendAboutItem(menu)

	Local mainwin:= uiNewWindow("libui Control Gallery", 640, 480, 1)
	uiWindowSetMargined(mainwin, 1)
	uiWindowOnClosing(mainwin, onClosing)
	
	Local box:= uiNewVerticalBox()
	uiBoxSetPadded(box, 1)
	uiWindowSetChild(mainwin, box)
	
	Local hbox:= uiNewHorizontalBox()
	uiBoxSetPadded(hbox, 1)
	uiBoxAppend(box, hbox, 1)
	
	Local group:= uiNewGroup("Basic Controls")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(hbox, group, 0)
	
	Local inner:= uiNewVerticalBox()
	uiBoxSetPadded(inner, 1)
	uiGroupSetChild(group, inner)
	
	uiBoxAppend(inner, uiNewButton("Button"), 0)
	uiBoxAppend(inner, uiNewCheckbox("Checkbox"), 0)
	Local entry:=uiNewEntry()
	uiEntrySetText(entry, "Entry")
	uiBoxAppend(inner, entry, 0)
	uiBoxAppend(inner, uiNewLabel("Label"), 0)
	
	uiBoxAppend(inner, uiNewHorizontalSeparator(), 0)
	
	uiBoxAppend(inner, uiNewDatePicker(), 0)
	uiBoxAppend(inner, uiNewTimePicker(), 0)
	uiBoxAppend(inner, uiNewDateTimePicker(), 0)
	
	' NOT WRAPPED
	'uiBoxAppend(inner, uiNewFontButton(), 0)
	' NOT WRAPPED
	'uiBoxAppend(inner, uiNewColorButton(), 0)
	
	Local inner2:=uiNewVerticalBox()
	uiBoxSetPadded(inner2, 1)
	uiBoxAppend(hbox, inner2, 1)
	
	group=uiNewGroup("Numbers")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(inner2, group, 0)
	
	inner=uiNewVerticalBox()
	uiBoxSetPadded(inner, 1)
	uiGroupSetChild(group, inner)
	
	Local spinbox:=uiNewSpinbox(0, 100)
	'uiSpinboxOnChanged(spinbox, onSpinboxChanged, Null)
	uiBoxAppend(inner, spinbox, 0)
	
	Local slider:=uiNewSlider(0, 100)
	'uiSliderOnChanged(slider, onSliderChanged, Null)
	uiBoxAppend(inner, slider, 0)
	
	Local progressbar:= uiNewProgressBar()
	uiBoxAppend(inner, progressbar, 0)
	
	group=uiNewGroup("Lists")
	uiGroupSetMargined(group, 1)
	uiBoxAppend(inner2, group, 0)
	
	inner=uiNewVerticalBox()
	uiBoxSetPadded(inner, 1)
	uiGroupSetChild(group, inner)
	
	Local cbox:=uiNewCombobox()
	uiComboboxAppend(cbox, "Combobox Item 1")
	uiComboboxAppend(cbox, "Combobox Item 2")
	uiComboboxAppend(cbox, "Combobox Item 3")
	uiBoxAppend(inner, cbox, 0)
	
	Local ecbox:=uiNewEditableCombobox()
	uiEditableComboboxAppend(ecbox, "Editable Item 1")
	uiEditableComboboxAppend(ecbox, "Editable Item 2")
	uiEditableComboboxAppend(ecbox, "Editable Item 3")
	uiBoxAppend(inner, ecbox, 0)
	
	Local rb:=uiNewRadioButtons()
	uiRadioButtonsAppend(rb, "Radio Button 1")
	uiRadioButtonsAppend(rb, "Radio Button 2")
	uiRadioButtonsAppend(rb, "Radio Button 3")
	uiBoxAppend(inner, rb, 1)
	
	Local tab:=uiNewTab()
	
	' PROBLEM
	' Appeding to a tab causes a crash
	
'	uiTabAppend(tab, "Page 1", uiNewButton( "Heya" ))
'	uiTabAppend(tab, "Page 2", uiNewHorizontalBox())
'	uiTabAppend(tab, "Page 3", uiNewHorizontalBox())
	uiBoxAppend(inner2, tab, 1)
	
	uiControlShow( mainwin )
	uiMain()
	
	' PROBLEM
	' Uninit causes a crash?
	
	'uiUninit()
End