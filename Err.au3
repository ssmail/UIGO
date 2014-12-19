#include <file.au3>

; temp
$FP_Log = @ScriptDir & "\UIGO.log"

Func __Err($ErrLevel, $ErrType, $ErrInfo)

	MsgBox(0,"", $ErrInfo)
	_FileWriteLog($FP_Log, $ErrInfo)
EndFunc