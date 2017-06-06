#include <macro.h>
/*
	File: fn_pvsLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reacts on changing your car
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
p_Bill_cName = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
player_bill_color = _vehicleColor;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

(getControl(1337,1341)) ctrlSetStructuredText parseText format[	
	(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %1 km/h<br/>
	" +(localize "STR_Shop_Veh_UI_HPower")+ " %2<br/>
	" +(localize "STR_Shop_Veh_UI_PSeats")+ " %3<br/>
	" +(localize "STR_Shop_Veh_UI_Trunk")+ " %4<br/>
	" +(localize "STR_Shop_Veh_UI_Fuel")+ " %5
	" +(localize "STR_Shop_Veh_UI_Color")+ " %6<br/>
	",
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor
];

ctrlShow [1341,true];
ctrlShow [1339,true];