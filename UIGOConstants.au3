#cs ----------------------------------------------------------------------------
AutoIt Version: 3.3.10.2
Author:         Chris Hong
Script Function:
	UIGO Project Constansts
Chris Hong  Chrishong@outlook.com
2014/12/19
#ce ----------------------------------------------------------------------------

Enum $Window, $Button, $Edit, $Checkbox, $Radio, $Listbox, $ComboBox, $KB, $Mouse
Enum $Activite, $Check, $Select, $GetText, $Move, $RClick, $LClick, $DIRECTION, $SetText

Global  $UIGO_Support_Control_Types = ""
Global  $UIGO_Control_Support_Actions = ""

Global $UIGO_CONTROL_TYPES[9]
Global $UIGO_CONTROL_ACTIONS[9]

Global Const $UIGO_Control_Default_Type = "Window"
Global Const $UIGO_Control_Default_Action = "Activite"
Global Const $UIGO_PARAM_SPERATOR = ","


$UIGO_CONTROL_TYPES[$Window] = "Window"
$UIGO_CONTROL_TYPES[$Button] = "Button"
$UIGO_CONTROL_TYPES[$Edit] = "Edit"
$UIGO_CONTROL_TYPES[$Checkbox] = "Checkbox"
$UIGO_CONTROL_TYPES[$Radio] = "Radio"
$UIGO_CONTROL_TYPES[$Listbox] = "Listbox"
$UIGO_CONTROL_TYPES[$ComboBox] = "ComboBox"
$UIGO_CONTROL_TYPES[$KB] = "KB"
$UIGO_CONTROL_TYPES[$Mouse] = "Mouse"

$UIGO_CONTROL_ACTIONS[$Activite] = "Activite"
$UIGO_CONTROL_ACTIONS[$Check] = "Check"
$UIGO_CONTROL_ACTIONS[$Select] = "Select"
$UIGO_CONTROL_ACTIONS[$GetText] = "GetText"
$UIGO_CONTROL_ACTIONS[$SetText] = "SetText"
$UIGO_CONTROL_ACTIONS[$Move] = "Move"
$UIGO_CONTROL_ACTIONS[$RClick] = "RClick"
$UIGO_CONTROL_ACTIONS[$LClick] = "LCLICK"
$UIGO_CONTROL_ACTIONS[$DIRECTION] = "DIRECTION"



Func __UIGO_Initialization()

	$UIGO_Support_Control_Types = _ArrayToString($UIGO_CONTROL_TYPES, "|", 1, UBound($UIGO_CONTROL_TYPES))
	$UIGO_Control_Support_Actions = _ArrayToString($UIGO_CONTROL_ACTIONS, "|", 1, UBound($UIGO_CONTROL_ACTIONS))

EndFunc
