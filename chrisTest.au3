#include "UIAWrappers.au3"



Local $test = __UIGO_Find("Title:=UIA - OneNote")


Local $strInfo = _UIA_getAllPropertyValues($test)


ConsoleWrite($strInfo)

Func __UIGO_Find($UIDescription)

	Local $oElement = _UIA_getFirstObjectOfElement($UIA_oDesktop, $UIDescription, $treescope_children)

	If IsObj($oElement) Then
		Return $oElement
	Else
		MsgBox(0, "", "Object not found", 1)
		Return 0
	EndIf

EndFunc