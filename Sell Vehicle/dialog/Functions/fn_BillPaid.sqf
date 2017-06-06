/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the bill was paid.
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/
private["_value","_costumer","_merchant","_vehicle","_vid","_pid","_unit"];
disableSerialization;
_value = [_this,0,5,[0]] call BIS_fnc_param;
_costumer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_merchant = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _costumer OR {_costumer != life_bill_unit}) exitWith {}; //NO
if(isNull _merchant OR {_merchant != player}) exitWith {}; //Double NO


if(lbCurSel 1340 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[1340,(lbCurSel 1340)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[1340,(lbCurSel 1340)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
life_atmcash = life_atmcash + _value;
closeDialog 0;
