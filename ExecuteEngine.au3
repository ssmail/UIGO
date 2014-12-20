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
		$strParam = $aryAction[4]
	Else
		__Err(1, "test", "Error action string")
	EndIf

	Switch $strWindowAction

		Case $ACTION_WINDOW_MOVE
			__UIGO_Window_Action_Move($strWindowTitle, $strParam)
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

	Local $aryPos = StringSplit($strTargetPos, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		WinActivate($strWindow)
		WinWaitActive($strWindow, "", 2)
		WinMove($strWindow, "", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Error parameters")
	EndIf
EndFunc


Func __UIGO_Mouse_Action($strAction)
	Local $aryAction = StringSplit($strAction, "|")
	Local $strWindowTitle = ""
	Local $strWindowAction = ""
	Local $strParam = ""

	If IsArray($aryAction) Then
		$strWindowTitle = $aryAction[1]
		$strWindowAction = $aryAction[3]
		$strParam = $aryAction[4]
	Else
		__Err(1, "", "Param format error")
	EndIf

	Switch $strWindowAction
		Case $ACTION_MOUSE_RCLICK
			__UIGO_MouseRightClick($strParam)
		Case $ACTION_MOUSE_LCLICK
			__UIGO_Mouse_Click($strParam)
		Case $ACTION_MOUSE_MOVE
			__UIGO_Mouse_Move($strParam)
		Case Else
		 __Err(1, "", "Mouse operation param error")
	EndSwitch

EndFunc

Func __UIGO_Mouse_Click($strTargetPos)

	Local $aryPos = StringSplit($strTargetPos, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		MouseClick("Left", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Param error")
	EndIf
EndFunc

Func __UIGO_Mouse_Move($strTargetPos)

	Local $aryPos = StringSplit($strTargetPos, $UIGO_PARAM_SPERATOR)

	If IsArray($aryPos) Then
		MouseMove($aryPos[1], $aryPos[2])
	Else
		__Err(0, "", "Param error")
	EndIf
EndFunc

Func __UIGO_MouseRightClick($strTargetPos)

	Local $aryPos = StringSplit($strTargetPos, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		MouseClick("Right", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Param error")
	EndIf
EndFunc