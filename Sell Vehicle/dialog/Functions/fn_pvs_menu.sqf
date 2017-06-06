#include <macro.h>
/*
	File: fn_pvsMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:	
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/
private["_vehicles","_control"];
disableSerialization;
_vehicles = [[getPlayerUID player,playerSide,"Car",player]call TON_fnc_getVehicles] spawn life_fnc_MP;//3.1.4.8
// _vehicles = [getPlayerUID player,playerSide,"Car",player] remoteExec ["TON_fnc_getVehicles",RSERV];//4.0

ctrlShow[1340,false];
ctrlShow[1339,false];
waitUntil {!isNull (findDisplay 1337)};

if(count _vehicles == 0) exitWith
{
	ctrlSetText[1340,localize "STR_Garage_NoVehicles"];
};

_control = ((findDisplay 1337) displayCtrl 1340);
lbClear _control;

{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;

ctrlShow[1347,false];
ctrlShow[1345,false];
/*
