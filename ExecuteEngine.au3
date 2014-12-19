#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Constansts
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------
#include "UIAWrappers.au3"






;Local $test = __UIGO_Find("Title:=UIA - OneNote")


;Local $strInfo = _UIA_getAllPropertyValues($test)


;ConsoleWrite($strInfo)

Func __UIGO_Find($UIDescription)

	Local $oElement = _UIA_getFirstObjectOfElement($UIA_oDesktop, $UIDescription, $treescope_children)

	If IsObj($oElement) Then
		Return $oElement
	Else
		MsgBox(0, "", "Object not found", 1)
		Return 0
	EndIf

EndFunc

Func __UIGO_Window_Activite($strAction)
	Local $aryAction = StringSplit($strAction, "|")
	Local $strWindowTitle = ""
	Local $strWindow

	If IsArray($aryAction) Then

	EndIf
EndFunc
