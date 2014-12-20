#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Constansts
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------
#include "UIAWrappers.au3"
#include-once




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

Func __UIGO_Window_Action($strAction)
	Local $aryAction = StringSplit($strAction, "|")
	Local $strWindowTitle = ""
	Local $strWindowAction = ""
	Local $strParam = ""

	If IsArray($aryAction) Then
		$strWindowTitle = $aryAction[1]
		$strWindowAction = $aryAction[3]
	Else
		__Err(1, "test", "Error action string")
	EndIf

	Switch $strWindowAction

		Case $ACTION_WINDOW_MOVE
			__UIGO_Window_Action_Move($strWindowTitle, $strWindowTitle)
			ConsoleWrite("Move : " & $strWindowTitle)
		Case $ACTION_WINDOW_ACTIVITE
			ConsoleWrite("active : " & $strWindowTitle)
			__UIGO_Window_Action_Activite($strWindowTitle)
		Case Else
			MsgBox(0, "", "Error action: " & $strWindowAction)
	EndSwitch

EndFunc

Func __UIGO_Window_Action_Activite($strWindowTitle)

	WinActivate($strWindowTitle)
EndFunc

Func __UIGO_Window_Action_Move($strWindow, $strTargetPos)

	Local $aryPos = StringSplit($strTargetPos, "|")
	If IsArray($aryPos) Then
		WinActivate($strWindow)
		WinWaitActive($strWindow)
		WinMove($strWindow, "", $aryPos[0], $aryPos[1])
	Else
		__Err(1, "", "Window move post param error")
	EndIf
EndFunc