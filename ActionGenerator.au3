#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
UI Description language generator
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------
;Autoit build-in functions
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
; My libs files
;#include "UIGOConstants.au3"
;#include "ScriptGenerator.au3"
;#include "ExecuteEngine.au3"
#include "Inc.au3"
;------------------------------------------------------------------------------
#include-once

__UIGO_Initialization()

#Region ### START Koda GUI section ### Form=d:\git\uigo\git\uigo\userdescriptiongenerator.kxf
$Form1_1 = GUICreate("UI Description Generator", 985, 498, 192, 124)
GUISetFont(10, 400, 0, "Cambria")
$ipt_WorkWindow = GUICtrlCreateInput("", 144, 32, 449, 23)
$lbl_WorkWindow = GUICtrlCreateLabel("Work Window Name: ", 16, 40, 126, 19)
$Steps = GUICtrlCreateGroup("Steps", 16, 96, 577, 177)
$Cmbx_ControlType = GUICtrlCreateCombo($UIGO_Control_Default_Type, 56, 160, 137, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $UIGO_Support_Control_Types)

$lbl_ControlName = GUICtrlCreateLabel("Control Type", 56, 128, 76, 19)
$lbl_Action = GUICtrlCreateLabel("Action", 243, 129, 40, 19)
$Cmbx_ControlAction = GUICtrlCreateCombo($UIGO_Control_Default_Action, 236, 160, 153, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, $UIGO_Control_Support_Actions)

$btn_Insert = GUICtrlCreateButton("Insert Step", 488, 230, 75, 25)
$lbl_Param = GUICtrlCreateLabel("Parameters", 56, 200, 66, 19)
$ipt_Params = GUICtrlCreateInput("", 56, 230, 200, 23)

$lbl_Param2 = GUICtrlCreateLabel("Parameters2", 290, 200, 70, 19)
$ipt_Params2 = GUICtrlCreateInput("", 290, 230, 100, 23)


$lvt_StepList = GUICtrlCreateListView("", 624, 32, 337, 441)

$Configs = GUICtrlCreateGroup("Configuration", 21, 297, 577, 177)
$Button2 = GUICtrlCreateButton("Button1", 493, 425, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

_GUICtrlListView_InsertColumn($lvt_StepList, 0, "Control", 100)
_GUICtrlListView_InsertColumn($lvt_StepList, 1, "Action Description", 250)





#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btn_Insert
			__InsertStep()
	EndSwitch
WEnd


;------------------------------------------------------------------------------
; UI Operation
Func __InsertStep()
	Local $intListViewIndex = 0
	Local $strControlType = GUICtrlRead($Cmbx_ControlType)
	Local $strControlAction = GUICtrlRead($Cmbx_ControlAction)
	Local $strParameters = GUICtrlRead($ipt_Params)
	Local $strWorkWindow = GUICtrlRead($ipt_WorkWindow)
	Local $strParameters2 = GUICtrlRead($ipt_Params2)


	If Not $strWorkWindow Then $strWorkWindow = "NULL"
	If Not $strControlType Then $strControlType = "NULL"
	If Not $strControlAction Then $strControlAction = "NULL"
	If Not $strParameters Then $strParameters = "NULL"
	If Not $strParameters2 Then $strParameters2 = "NULL"


	$intListViewIndex = _GUICtrlListView_GetItemCount($lvt_StepList)

	_GUICtrlListView_AddItem($lvt_StepList, $strControlType, 0)
	_GUICtrlListView_AddSubItem($lvt_StepList, $intListViewIndex, $strControlAction  & _
									" " & $strControlType & " " & $strParameters , 1, 1)

	_UIGO_Add_Step($strWorkWindow, $strControlType, $strControlAction, $strParameters, $strParameters2)
EndFunc


Func __GetParams()

	Local $strControlType = GUICtrlRead($Cmbx_ControlType)
	Local $strControlAction = GUICtrlRead($Cmbx_ControlAction)
	Local $strParameters = GUICtrlRead($ipt_Params)
	Local $strParameters2 = GUICtrlRead($ipt_Params2)
	Local $strWindowName = GUICtrlRead($ipt_WorkWindow)

EndFunc
