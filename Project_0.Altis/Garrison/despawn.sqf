#include "common.hpp"

// Class: Garrison
/*
Method: spawn
Despawns all groups and units in this garrison.

Threading: should be called through postMethod (see <MessageReceiverEx>)

Returns: nil
*/

#define pr private

params [P_THISOBJECT];

OOP_INFO_0("DESPAWN");

ASSERT_THREAD(_thisObject);

if(T_CALLM("isDestroyed", [])) exitWith {
	OOP_WARNING_MSG("Attempted to call function on destroyed garrison %1", [_thisObject]);
};

private _spawned = GET_VAR(_thisObject, "spawned");
if (!_spawned) exitWith {
	OOP_ERROR_0("Already despawned");
	DUMP_CALLSTACK;
};

// Reset spawned flag
SET_VAR(_thisObject, "spawned", false);

private _units = GET_VAR(_thisObject, "units");
private _groups = (GET_VAR(_thisObject, "groups"));
private _groupsCopy = +_groups;

// Despawn groups, delete empty groups
OOP_INFO_1("Despawning groups: %1", _groups);
private _i = 0;
while {_i < count _groups} do
{
	private _group = _groups select _i;
	CALLM(_group, "despawn", []);
	
	pr _units = CALLM0(_group, "getUnits");
	if (count _units == 0) then {
		_groups deleteAt _i;
		DELETE(_group);
	} else {
		_i = _i + 1;
	};
};


// Despawn single units
{
	private _unit = _x;
	if (CALL_METHOD(_x, "getGroup", []) == "") then {
		CALL_METHOD(_unit, "despawn", []);
	};
} forEach _units;

// Call onGarrisonDespawned
pr _AI = T_GETV("AI");
pr _action = CALLM0(_AI, "getCurrentAction");
if (_action != "") then {
	_action = CALLM0(_action, "getFrontSubaction");
	if (_action != "") then {
		OOP_INFO_1("Calling %1.onGarrisonDespawned", _action);
		CALLM0(_action, "onGarrisonDespawned");
	} else {
		OOP_INFO_0("DESPAWN: no current action");
	};
};

// Update process interval of AI
//CALLM1(_AI, "setProcessInterval", AI_GARRISON_PROCESS_INTERVAL_DESPAWNED);

// Change process category
pr _msgLoop = CALLM0(_thisObject, "getMessageLoop");
CALLM1(_msgLoop, "deleteProcessCategoryObject", _thisObject);
CALLM2(_msgLoop, "addProcessCategoryObject", "AIGarrisonDespawned", _thisObject);