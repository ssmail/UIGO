#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Constansts
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------

#include "Err.au3"
; tmp
Local  $FP_UIGO_DESC = @ScriptDir & "\UIGO.Script"

Func _UIGO_Add_Step($strControlType, $strControlAction, $strParameters)
	$strAction = $strControlType & "|" & $strControlAction & "|" & $strParameters
	ActionRecord($strAction)
EndFunc


Func ActionRecord($strAction)

	__UIGO_Window_Activite($strAction)

	;If Not FileExists($FP_UIGO_DESC) Then __Err(1, "Test", "UIGO_DESC not found")
	Local $FH_UIGO_DESC = FileOpen($FP_UIGO_DESC, 1)
	FileWrite($FH_UIGO_DESC, $strAction & @CRLF)
	FileClose($FH_UIGO_DESC)
EndFunc