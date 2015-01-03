#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Constansts
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------

; tmp

Func _UIGO_Add_Step($strWorkWindow, $strControlType, $strControlAction, $strParameters, $strParameters2)
	$strAction = $strWorkWindow & "|" & $strControlType & "|" & $strControlAction & "|" & $strParameters & "|" & $strParameters2
	ActionRecord($strAction)
EndFunc


Func ActionRecord($strAction)

	;__Control_Common_Action($strAction)

	;If Not FileExists($FP_UIGO_DESC) Then __Err(1, "Test", "UIGO_DESC not found")
	Local $FH_UIGO_DESC = FileOpen($FP_UIGO_DESC, 1)
	FileWrite($FH_UIGO_DESC, $strAction & @CRLF)
	FileClose($FH_UIGO_DESC)
EndFunc