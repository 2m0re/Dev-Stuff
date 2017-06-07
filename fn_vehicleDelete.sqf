/*
	File: fn_vehicleDelete.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't actually delete since we don't give our DB user that type of
	access so instead we set it to alive=0 so it never shows again.
*/
private["_vid","_sp","_pid","_query","_sql","_type","_thread"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,2500,[0]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,4,"",[""]] call BIS_fnc_param;
_case = _this select 5;

switch (_case) do
{
	case 0:
	{
		if(_vid == -1 OR _pid == "" OR _sp == 0 OR isNull _unit OR _type == "") exitWith {};
		_unit = owner _unit;

		_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_pid,_vid];

		waitUntil {!DB_Async_Active};
		_thread = [_query,1] call DB_fnc_asyncCall;	
	};
	case 1:
	{	
		if(_vid == -1 OR _pid == "") exitWith {};
		_query = format["DELETE FROM vehicles WHERE pid='%1' AND id='%2'",_pid,_vid];
		waitUntil {!DB_Async_Active};
		_thread = [_query,1] call DB_fnc_asyncCall;
	};
}:


