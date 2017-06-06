#include <macro.h>
/*
	File: fn_pvs_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	selling another player your car
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/
private["_vehicle","_vid","_pid","_unit"];
disableSerialization;
if(lbCurSel 1340 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[1340,(lbCurSel 1340)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[1340,(lbCurSel 1340)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
life_pInact_sellprice = parseNumber(ctrlText 1346);
[[player,(parseNumber life_pInact_sellprice),player_bill_color,p_Bill_cName],"life_fnc_BillPrompt",life_pInact_curTarget,false] spawn life_fnc_MP;




// closeDialog 0;