#include "UIAWrappers.au3"


;Local $O = __UIGO_Find("Name:=UIGO")

;_UIA_action($O, "activate")

Func __Inspect2UIAString($InspectString)

	Return StringRegExpReplace($InspectString, '(\s)"(.+)"$','=$2')
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


Func __Search_Object($ObjRootDesc, $ObjDesc)

	Local $oRootWindow = __UIGO_Find($ObjRootDesc)

	If IsObj($oRootWindow) Then

		Local $oTargetControl = __UIA_FindObj($oRootWindow, $ObjDesc)

		If IsObj($oTargetControl) Then

			Return $oTargetControl
		Else
			Return False
		EndIf

	EndIf


EndFunc

Func __UIA_FindObj($UIA_ROOT, $UIA_DESC, $TRY_TIME = 3, $WaitTime = 3000)


	If $TRY_TIME  Then

		$oControl = _UIA_getFirstObjectOfElement($UIA_ROOT, $UIA_DESC, $treescope_subtree)

		If IsObj($oControl) Then

			Return $oControl
		Else
			Sleep($WaitTime)
			$TRY_TIME = $TRY_TIME - 1
			__UIA_FindObj($UIA_ROOT, $UIA_DESC, $TRY_TIME, $WaitTime)
		EndIf
	Else
		Return False
	EndIf

EndFunc