#include <array.au3>

$test = Dict()



Func Dict()

	$obj_Map = ObjCreate('Scripting.Dictionary')
	If IsObj($obj_Map) Then
		Return $obj_Map
	Else
		MsgBox(0, "", "Create Ojbect failed")
		Exit
	EndIf
EndFunc