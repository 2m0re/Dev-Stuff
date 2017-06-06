/*
	File: fn_BillPrompt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/
private["_mechant","_val","_display","_control","_color","_vehicle"];
if(!isNull (findDisplay 600)) exitwith {}; //Already at the ticket menu, block for abuse?
_mechant = _this select 0;
if(isNull _mechant) exitWith {};
_val = _this select 1;
_color = _this select 2;
_vehicle = _this select 3;
createDialog "life_bill_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 600)};
_display = findDisplay 600;
_control = _display displayCtrl 601;
life_bill_paid = false;
life_bill_val = _val;
life_bill_merchant = _mechant;
life_bill_color = _color;
life_Bill_cName = _vehicle;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +( "Rechnung  gegeben"),_mechant getVariable["realname",name _mechant],_val];

[] spawn
{
	disableSerialization;
	waitUntil {life_bill_paid OR (isNull (findDisplay 600))};
	if(isNull (findDisplay 600) && !life_bill_paid) then
	{
		// [[0,"STR_Cop_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[1,"STR_Cop_Ticket_Refuse",true,[profileName]],"life_fnc_broadcast",life_bill_merchant,false] spawn life_fnc_MP;
	};
};