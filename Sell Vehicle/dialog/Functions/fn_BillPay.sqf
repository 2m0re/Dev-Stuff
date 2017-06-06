/*
	File: fn_BillPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the Bill.
	Modded for Private Vehicle Selling by Rayer von der Lampe
*/

if(isnil {life_bill_val} OR isNil {life_bill_merchant}) exitWith {};
if(life_cash < life_bill_val) exitWith
{
	if(life_cash < life_bill_val) exitWith 
	{
		hint localize "Zu wenig Geld";
		[[1,"Kunde hat zu wenig Geld",true,[profileName]],"life_fnc_broadcast",life_bill_merchant,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format[localize "Rechnung Bezahlt",[life_bill_val] call life_fnc_numberText];
	life_cash = life_cash - life_bill_val;
	life_bill_paid = true;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_bill_merchant,false] spawn life_fnc_MP;
	[[life_bill_val,player,life_bill_merchant],"life_fnc_BillPaid",life_bill_merchant,false] spawn life_fnc_MP;
	closeDialog 0;
};

//adding vehice to data base

[[(getPlayerUID player),playerSide,life_Bill_cName,life_bill_color],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;

//Done

closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_bill_merchant,false] spawn life_fnc_MP;
[[life_bill_val,player,life_bill_merchant],"life_fnc_billPaid",life_bill_merchant,false] spawn life_fnc_MP;