'#Import "<m2libui>"
#Import "../m2libui"
Using m2libui..

Function onClosing:Int( w:uiWindow, data:Void Ptr )
	Print "Closing window"
	uiQuit()
	Return True 'Allow close
End

Function shouldQuit:Int( data:Void Ptr )
	Print "Quitting"
	Return True 'Allow quit
End

Function colorButtonOnChanged( b:uiColorButton, data:Void Ptr=Null )
	
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
	uiOnShouldQuit(shouldQuit, Null)
	
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
	
	' PROBLEM
	' Clicking any of these two buttons crashes the app
	
	Local fButton:=uiNewFontButton()
	uiBoxAppend(inner, fButton, 0)
	
	Local cButton:=uiNewColorButton()
	uiColorButtonSetColor( cButton, 1.0, 0.0, 0.0 )
	uiBoxAppend(inner, cButton, 0)
	
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
	' Appending to a tab causes a crash
	
	'uiTabAppend( tab, "", Null )
	'uiTabAppend( tab, "Page 2", uiNewHorizontalBox() )
	'uiTabAppend( tab, "Page 3", uiNewHorizontalBox() )
	'uiBoxAppend( inner2, tab, 1 )
	
	uiControlShow( mainwin )
	uiMain() 'Main loop
	
	' PROBLEM
	' Uninit causes a crash?
	
	'uiUninit()
End