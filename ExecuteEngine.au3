#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Execution Engine
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------
#include "UIAWrappers.au3"
#include-once


;Local $test = __UIGO_Find("Title:=UIA - OneNote")
;Local $strInfo = _UIA_getAllPropertyValues($test)
;ConsoleWrite($strInfo)


; Load all the function map relationship
Global $UIGO_ActionMap = Dict()

$UIGO_ActionMap.add("DIRECTION", "__UIGO_KB_DIRECTION")
$UIGO_ActionMap.add("MOVE", "__UIGO_Window_Action_Move")
$UIGO_ActionMap.add("Activite", "__UIGO_Window_Action_Activite")

$UIGO_ActionMap.add("MOVE", "__UIGO_Window_Action_Move")
$UIGO_ActionMap.add("Activite", "__UIGO_Window_Action_Activite")
$UIGO_ActionMap.add("MOVE", "__UIGO_Window_Action_Move")
$UIGO_ActionMap.add("Activite", "__UIGO_Window_Action_Activite")


;ShowActionMap()

Func ShowActionMap()

	Local $aryDict[2][2]
	Local $Keys = $UIGO_ActionMap.keys()
	Local $items = $UIGO_ActionMap.items()
	Local $intCount = $UIGO_ActionMap.count()
	ReDim $aryDict[$intCount][2]

	For $intItem = 0 To $intCount - 1

		$aryDict[$intItem][0] = $Keys[$intItem]
		$aryDict[$intItem][1] =$UIGO_ActionMap.item($Keys[$intItem])
	Next

	_ArrayDisplay($aryDict)
EndFunc

Func __UIGO_Find($UIDescription)

	Local $oElement = _UIA_getFirstObjectOfElement($UIA_oDesktop, $UIDescription, $treescope_children)

	If IsObj($oElement) Then
		Return $oElement
	Else
		MsgBox(0, "", "Object not found", 1)
		Return 0
	EndIf

EndFunc

;----------------------------------------------------------------------------
;		This is the Windows Action Functions
Func __UIGO_Window_Action($strAction)
	Local $Control, $Action, $Params, $WINDOW
	__UIGO_CLUTCH($strAction, $WINDOW, $Control, $Action, $Params)
	__UIGO_ENGINE($Action, $Control, "", "", $Params)
EndFunc

Func __UIGO_Window_Action_Move($WINDOW, $CONTROL, $ACTION, $strParam)
	Local $aryPos = StringSplit($strParam, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		WinActivate($WINDOW)
		WinWaitActive($WINDOW, "", 2)
		WinMove($WINDOW, "", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Error parameters")
	EndIf
EndFunc

Func __UIGO_Window_Action_Activite($WINDOW, $CONTROL, $ACTION, $strParam)
	WinActivate($WINDOW)
EndFunc



;----------------------------------------------------------------------------
;		This is the Mouse Action function
;
Func __UIGO_Mouse_Action($strAction)
	Local $Control, $Action, $Params, $WINDOW
	__UIGO_CLUTCH($strAction,$WINDOW,  $Control, $Action, $Params)
	__UIGO_ENGINE($Action, $Control, "", "", $Params)
EndFunc

Func __UIGO_Mouse_Click($WINDOW, $CONTROL, $ACTION, $strParam)

	Local $aryPos = StringSplit($strParam, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		MouseClick("Left", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Param error")
	EndIf
EndFunc

Func __UIGO_Mouse_Move($WINDOW, $CONTROL, $ACTION, $strParam)

	Local $aryPos = StringSplit($strParam, $UIGO_PARAM_SPERATOR)

	If IsArray($aryPos) Then
		MouseMove($aryPos[1], $aryPos[2])
	Else
		__Err(0, "", "Param error")
	EndIf
EndFunc

Func __UIGO_MouseRightClick($WINDOW, $CONTROL, $ACTION, $strParam)

	Local $aryPos = StringSplit($strParam, $UIGO_PARAM_SPERATOR)
	If IsArray($aryPos) Then
		MouseClick("Right", $aryPos[1], $aryPos[2])
	Else
		__Err(1, "", "Param error")
	EndIf
EndFunc


;----------------------------------------------------------------------------
; 		This is the Keyboard functions
;

Func __UIGO_KB_Action($strAction)
	Local $Control, $Action, $Params,$WINDOW
	__UIGO_CLUTCH($strAction,$WINDOW,  $Control, $Action, $Params)
	__UIGO_ENGINE($Action, "", "", "", $Params)
EndFunc


Func __UIGO_KB_DIRECTION($strAction)
	Switch $strAction
		Case "UP"
			Send("{UP}")
		Case "DOWN"
			Send("{DOWN}")
		Case "LEFT"
			Send("{LEFT}")
		Case "RIGHT"
			Send("{RIGHT}")
		Case Else
			MsgBox(0, "", "ERROR, ERROR KEY CODE")
	EndSwitch

EndFunc


Func __UIGO_ENGINE($ACTION_NAME, $WINDOW = "", $CONTROL = "", $ACTION = "", $PARAMS = "")

	; Map the action string to Real Execute Function
	$strFuncName = $UIGO_ActionMap.item($ACTION_NAME)

	If $strFuncName Then
		Call($strFuncName, $WINDOW, $CONTROL, $ACTION, $PARAMS)
	Else
		MsgBox(0, "", "unknown action map")
	EndIf
EndFunc



Func Dict()
	$obj_Map = ObjCreate('Scripting.Dictionary')
	$obj_Map.CompareMode = 1

	If IsObj($obj_Map) Then
		Return $obj_Map
	Else
		MsgBox(0, "", "Create Ojbect failed")
		Exit
	EndIf
EndFunc


Func __UIGO_CLUTCH($strAction, ByRef $WINDOW, ByRef $Control, ByRef $Action, ByRef $Params)

	Local $aryAction = StringSplit($strAction, "|")

	If IsArray($aryAction) Then
		$Control = $aryAction[1]
		$WINDOW = $aryAction[2]
		$Action = $aryAction[3]
		$Params = $aryAction[4]
	Else
		MsgBox(1, "test", "Error action string")
	EndIf
EndFunc