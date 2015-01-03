#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
UI Descript Execute file
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------

#include "Inc.au3"

If __ExecutionPrepare() Then

	Local $iStep = 0
	Local $strStepString = ""
	Local $aryStepList = __Get_UIGO_Steps()

	If IsArray($aryStepList) Then

		For $iStep = 1 To UBound($aryStepList) - 1

			__Control_Common_Action($aryStepList[$iStep])
			Sleep($EXECUTION_BREAK)
		Next
	EndIf
EndIf

Func __ExecutionPrepare()

	If Not FileExists($FP_UIGO_DESC) Then Return 0
	; Add other checkpoint
	Return 1
EndFunc


Func __Get_UIGO_Steps()

	Local $aryUIGO_DESC_Steps
	If _FileReadToArray($FP_UIGO_DESC, $aryUIGO_DESC_Steps) Then

		Return $aryUIGO_DESC_Steps
	Else
		Return 0
	EndIf
EndFunc