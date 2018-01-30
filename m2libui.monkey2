' Monkey2 libui library wrapper
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
	Function uiMain:Void()
	Function uiMainSteps:Void()
	Function uiMainStep:Int( wait:Int )
	Function uiQuit:Void()
	
	Function uiQueueMain:Void( func:Void( data:Void Ptr ), data:Void Ptr )
	
	Function uiOnShouldQuit:Void( func:Int( data:Void Ptr=Null ), data:Void Ptr=Null )
	
	Function uiFreeText:Void( text:CString )
	
	' CONTROL
	Class uiControl Extends Void="uiControl"
		Field Signature:uint32_t
		Field OSSignature:uint32_t
		Field TypeSignature:uint32_t
		Field Control:uiControl
	End
	
	Function uiControlDestroy:Void( c:uiControl )
	Function uiControlHandle:uintptr_t( c:uiControl )
	Function uiControlParent:uiControl( c:uiControl )
	Function uiControlSetParent:Void( c:uiControl, parent:uiControl )
	Function uiControlToplevel:Int( c:uiControl )
	Function uiControlVisible:Int( c:uiControl )
	Function uiControlShow:Void( c:uiControl )
	Function uiControlHide:Void( c:uiControl )
	Function uiControlEnabled:Int( c:uiControl )
	Function uiControlEnable:Void( c:uiControl )
	Function uiControlDisable:Void( c:uiControl )
	
	Function uiAllocControl:uiControl( n:size_t, OSsig:uint32_t, typesig:uint32_t, typenamestr:CString )
	Function uiFreeControl:Void( c:uiControl )
	
	Function uiControlVerifySetParent:Void( c:uiControl, c:uiControl )
	Function uiControlEnabledToUser:Int( c:uiControl )
	
	' WINDOW
	Class uiWindow Extends uiControl
	End
	
	Function uiWindowTitle:String( w:uiWindow )
	Function uiWindowSetTitle:Void( w:uiWindow, title:CString )
	Function uiWindowContentSize:Void( w:uiWindow, width:Int Ptr, height:Int Ptr )
	Function uiWindowSetContentSize:Void( w:uiWindow, width:Int, height:Int )
	Function uiWindowFullscreen:Int( w:uiWindow )
	Function uiWindowSetFullscreen:Void( w:uiWindow, fullscreen:Int )
	Function uiWindowOnContentSizeChanged:Void( w:uiWindow, func:Void( w:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiWindowOnClosing:Void( w:uiWindow, func:Int( w:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiWindowBorderless:Int( w:uiWindow )
	Function uiWindowSetBorderless:Void( w:uiWindow, borderless:Int )
	Function uiWindowSetChild:Void( w:uiWindow, child:uiControl )
	Function uiWindowMargined:Int( w:uiWindow )
	Function uiWindowSetMargined:Void( w:uiWindow, margined:Int=1 )
	Function uiNewWindow:uiWindow( title:CString, width:Int, height:Int, hasMenubar:Int=0 )
	
	' BUTTON
	Class uiButton Extends uiControl
	End
	
	Function uiButtonText:String( b:uiButton )
	Function uiButtonSetText:Void( b:uiButton, text:CString )
	Function uiButtonOnClicked:Void( b:uiButton, func:Void( b:uiButton, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewButton:uiButton( char:CString )
	
	' BOX
	Class uiBox Extends uiControl
	End
	
	Function uiBoxAppend:Void( b:uiBox, child:uiControl, stretchy:Int=0 )
	Function uiBoxDelete( b:uiBox, index:Int )
	Function uiBoxPadded:Int( b:uiBox )
	Function uiBoxSetPadded( b:uiBox, padded:Int=1 )
	Function uiNewHorizontalBox:uiBox()
	Function uiNewVerticalBox:uiBox()
	
	' CHECKBOX
	Class uiCheckbox Extends uiControl
	End
	
	Function uiCheckboxText:String( c:uiCheckbox )
	Function uiCheckboxSetText:Void( c:uiCheckbox, text:CString )
	Function uiCheckboxOnToggled:Void( c:uiCheckbox, func:Void( c:uiCheckbox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiCheckboxChecked:Int( c:uiCheckbox )
	Function uiCheckboxSetChecked:Void( c:uiCheckbox, checked:Int=1 )
	Function uiNewCheckbox:uiCheckbox( text:CString )
	
	' ENTRY
	Class uiEntry Extends uiControl
	End
	
	Function uiEntryText:String( e:uiEntry )
	Function uiEntrySetText:Void( e:uiEntry, text:CString )
	Function uiEntryOnChanged:Void( e:uiEntry, func:Void( e:uiEntry, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiEntryReadOnly:Int( e:uiEntry )
	Function uiEntrySetReadOnly:Void( e:uiEntry, readonly:Int=1 )
	Function uiNewEntry:uiEntry()
	Function uiNewPasswordEntry:uiEntry()
	Function uiNewSearchEntry:uiEntry()
	
	' LABEL
	Class uiLabel Extends uiControl
	End
	
	Function uiLabelText:String( l:uiLabel )
	Function uiLabelSetText:Void( l:uiLabel, text:CString )
	Function uiNewLabel:uiLabel( text:CString )
	
	' TAB
	Class uiTab Extends uiControl
	End
	
	Function uiTabAppend:Void( t:uiTab, name:CString, c:uiControl )
	Function uiTabInsertAt:Void( t:uiTab, name:CString, before:Int, c:uiControl )
	Function uiTabDelete:Void( t:uiTab, index:Int )
	Function uiTabNumPages:Int( t:uiTab )
	Function uiTabMargined:Int( t:uiTab, page:Int )
	Function uiTabSetMargined:Void( t:uiTab, page:Int, margined:Int=1 )
	Function uiNewTab:uiTab()
	
	' GROUP
	Class uiGroup Extends uiControl
	End
	
	Function uiGroupTitle:String( g:uiGroup )
	Function uiGroupSetTitle:Void( g:uiGroup, title:CString )
	Function uiGroupSetChild:Void( g:uiGroup, c:uiControl )
	Function uiGroupMargined:Int( g:uiGroup)
	Function uiGroupSetMargined:Void( g:uiGroup, margined:Int=1 )
	Function uiNewGroup:uiGroup( title:CString )
	
	' SPINBOX
	Class uiSpinbox Extends uiControl
	End
	
	Function uiSpinboxValue:Int( s:uiSpinbox )
	Function uiSpinboxSetValue:Void( s:uiSpinbox, value:Int )
	Function uiSpinboxOnChanged:Void( s:uiSpinbox, func:Void( s:uiSpinbox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewSpinbox:uiSpinbox( min:Int, max:Int )
	
	' SLIDER
	Class uiSlider Extends uiControl
	End
	
	Function uiSliderValue:Int( s:uiSlider )
	Function uiSliderSetValue:Void( s:uiSlider, value:Int )
	Function uiSliderOnChanged:Void( s:uiSlider, func:Void( s:uiSlider, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewSlider:uiSlider( min:Int, max:Int )
	
	' PROGRESSBAR
	Class uiProgressBar Extends uiControl
	End
	
	Function uiProgressBarValue:Int( p:uiProgressBar )
	Function uiProgressBarSetValue( p:uiProgressBar, n:Int )
	Function uiNewProgressBar:uiProgressBar()
	
	' SEPARATOR
	Class uiSeparator Extends uiControl
	End
	
	Function uiNewHorizontalSeparator:uiSeparator()
	Function uiNewVerticalSeparator:uiSeparator()
	
	' COMBOBOX
	Class uiCombobox Extends uiControl
	End
	
	Function uiComboboxAppend( c:uiCombobox, text:CString )
	Function uiComboboxSelected:Int( c:uiCombobox )
	Function uiComboboxSetSelected( c:uiCombobox, n:Int )
	Function uiComboboxOnSelected( c:uiCombobox, func:Void( c:uiCombobox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewCombobox:uiCombobox()
	
	' EDITABLE COMBOBOX
	Class uiEditableCombobox Extends uiControl
	End
	
	Function uiEditableComboboxAppend( e:uiEditableCombobox, text:CString )
	Function uiEditableComboboxText:String( e:uiEditableCombobox )
	Function uiEditableComboboxSetText( e:uiEditableCombobox, text:CString )
	Function uiEditableComboboxOnChanged( e:uiEditableCombobox, func:Void( e:uiEditableCombobox, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewEditableCombobox:uiEditableCombobox()
	
	' RADIO BUTTON
	Class uiRadioButtons Extends uiControl
	End
	
	Function uiRadioButtonsAppend( r:uiRadioButtons, text:CString )
	Function uiRadioButtonsSelected:Int( r:uiRadioButtons )
	Function uiRadioButtonsSetSelected( r:uiRadioButtons, n:Int )
	Function uiRadioButtonsOnSelected( r:uiRadioButtons, func:Void( r:uiRadioButtons, data:Void Ptr=Null ), data:Void Ptr=Null )
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
	
	Function uiMultilineEntryText:String( m:uiMultilineEntry )
	Function uiMultilineEntrySetText( m:uiMultilineEntry, text:CString )
	Function uiMultilineEntryAppend( m:uiMultilineEntry, text:CString )
	Function uiMultilineEntryOnChanged( m:uiMultilineEntry, func:Void( m:uiMultilineEntry, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiMultilineEntryReadOnly:Int( m:uiMultilineEntry )
	Function uiMultilineEntrySetReadOnly( m:uiMultilineEntry, readonly:Int=1 )
	Function uiNewMultilineEntry:uiMultilineEntry()
	Function uiNewNonWrappingMultilineEntry:uiMultilineEntry()
	
	' MENU ITEM
	Class uiMenuItem Extends uiControl
	End
	
	Function uiMenuItemEnable( m:uiMenuItem )
	Function uiMenuItemDisable( m:uiMenuItem )
	Function uiMenuItemOnClicked( m:uiMenuItem, func:Void( sender:uiMenuItem, window:uiWindow, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiMenuItemChecked:Int( m:uiMenuItem )
	Function uiMenuItemSetChecked( m:uiMenuItem, checked:Int )
	
	' MENU
	Class uiMenu Extends uiControl
	End
	
	Function uiMenuAppendItem:uiMenuItem( m:uiMenu, name:CString )
	Function uiMenuAppendCheckItem:uiMenuItem( m:uiMenu, name:CString ) 
	Function uiMenuAppendQuitItem:uiMenuItem( m:uiMenu )
	Function uiMenuAppendPreferencesItem:uiMenuItem( m:uiMenu )
	Function uiMenuAppendAboutItem:uiMenuItem( m:uiMenu )
	Function uiMenuAppendSeparator( m:uiMenu )
	Function uiNewMenu:uiMenu( name:CString )
	
	' DIALOG
	Function uiOpenFile:String( parent:uiWindow )
	Function uiSaveFile:String( parent:uiWindow )
	Function uiMsgBox( parent:uiWindow, title:CString, description:CString )
	Function uiMsgBoxError( parent:uiWindow, title:CString, description:CString )
	
	' FONT BUTTON
	Class uiFontButton Extends uiControl
	End
	
	'Function uiFontButtonFont:uiDrawTextFont( b:uiFontButton )
	Function uiFontButtonOnChanged( b:uiFontButton, func:Void( b:uiFontButton, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewFontButton:uiFontButton()
	
	' COLOR BUTTON
	Class uiColorButton Extends uiControl
	End
	
	Function uiColorButtonColor( b:uiColorButton, r:Double Ptr, g:Double Ptr, bl:Double Ptr, a:Double Ptr)
	Function uiColorButtonSetColor( b:uiColorButton, r:Double, g:Double, b:Double, a:Double=1.0 )
	Function uiColorButtonOnChanged( b:uiColorButton, func:Void( b:uiColorButton, data:Void Ptr=Null ), data:Void Ptr=Null )
	Function uiNewColorButton:uiColorButton()
	
	' FORM
	Class uiForm Extends uiControl
	End
	
	Function uiFormAppend( f:uiForm , label:String, c:uiControl, stretchy:Int=0 )
	Function uiFormDelete( f:uiForm, index:Int )
	Function uiFormPadded:Int( f:uiForm )
	Function uiFormSetPadded( f:uiForm, padded:Int=1 )
	Function uiNewForm:uiForm()
	
	' GRID
	Class uiGrid Extends uiControl
	End
	
	Function uiGridAppend( g:uiGrid, c:uiControl, left:Int, top:Int, xspan:Int, yspan:Int, hexpand:Int, halign:uiAlign, vexpand:Int, valign:uiAlign )
	Function uiGridInsertAt( g:uiGrid, c:uiControl, existing:uiControl, at:uiAt, xspan:Int, yspan:Int, hexpand:Int, halign:uiAlign, vexpand:Int, valign:uiAlign)
	Function uiGridPadded:Int( g:uiGrid )
	Function uiGridSetPadded( g:uiGrid, padded:Int=1 )
	Function uiNewGrid:uiGrid()
	
	Enum uiAlign
		uiAlignFill
		uiAlignStart
		uiAlignCenter
		uiAlignEnd
	End
	
	Enum uiAt
		uiAtLeading
		uiAtTop
		uiAtTrailing
		uiAtBottom
	End
	
	' AREA
	Class uiArea Extends uiControl
	End
	
	Class uiAreaHandler Extends Void="uiAreaHandler"
		Field Draw:Void( h:uiAreaHandler, a:uiArea, d:uiAreaDrawParams )
		Field MouseEvent:Void( h:uiAreaHandler, a:uiArea, m:uiAreaMouseEvent )
		Field MouseCrossed:Void( h:uiAreaHandler, a:uiArea, left:Int )
		Field DragBroken:Void( h:uiAreaHandler, a:uiArea )
		Field KeyEvent:Int( h:uiAreaHandler, a:uiArea, k:uiAreaKeyEvent )
	End
	
	Class uiAreaDrawParams Extends Void="uiAreaDrawParams"
	End
	
	Class uiAreaMouseEvent Extends Void="uiAreaMouseEvent"
		Field X:Double
		Field Y:Double
		Field AreaWidth:Double
		Field AreaHeight:Double
		Field Down:Int
		Field Up:Int
		Field Count:Int
		Field Held1To64:uint64_t
		
		'Field Modifiers:uiModifiers
	End
	
	Class uiAreaKeyEvent Extends Void="uiAreaKeyEvent"
		Field Key:Int
		Field Up:Int
		
		'Field ExtKey:uiExtKey
		'Field Modifier:uiModifiers
		'Field Modifiers:uiModifiers
	End
	
	
	Function uiAreaSetSize( a:uiArea, width:Int, height:Int )
	
	Function uiAreaQueueRedrawAll( a:uiArea )
	Function uiAreaScrollTo( a:uiArea, x:Double, y:Double, width:Double, height:Double )
	Function uiAreaBeginUserWindowMove( a:uiArea )
	Function uiAreaBeginUserWindowResize( a:uiArea, edge:uiWindowResizeEdge )
	Function uiNewArea:uiArea( ah:uiAreaHandler )
	Function uiNewScrollingArea:uiArea( ah:uiAreaHandler, width:Int, height:Int )
	
	Enum uiWindowResizeEdge
		uiWindowResizeEdgeLeft
		uiWindowResizeEdgeTop
		uiWindowResizeEdgeRight
		uiWindowResizeEdgeBottom
		uiWindowResizeEdgeTopLeft
		uiWindowResizeEdgeTopRight
		uiWindowResizeEdgeBottomLeft
		uiWindowResizeEdgeBottomRight
	End