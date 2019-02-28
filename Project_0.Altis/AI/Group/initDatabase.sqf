#include "..\goalRelevance.hpp"

//private _s = WSP_GAR_COUNT;

/*
Initializes costs, effects and preconditions of actions, relevance values of goals.
*/



// ---- Goal relevance values and effects ----
// The actual relevance returned by goal can be different from the one which is set below

["GoalGroupRelax",				1] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupPatrol",				30] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupRegroup",				35] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupGetInVehiclesAsCrew", 40] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupGetInGarrisonVehiclesAsCargo", 40] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupOccupySentryPositions", 50] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupMoveGroundVehicles", 60] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupUnflipVehicles", 70] call AI_misc_fnc_setGoalIntrinsicRelevance;
["GoalGroupClearArea", 80] call AI_misc_fnc_setGoalIntrinsicRelevance;


// ---- Goal effects ----
// The actual effects returned by goal can depend on context and differ from those set below





// ---- Predefined actions of goals ----

["GoalGroupRelax", "ActionGroupRelax"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupPatrol", "ActionGroupPatrol"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupRegroup", "ActionGroupRegroup"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupGetInVehiclesAsCrew", "ActionGroupGetInVehiclesAsCrew"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupGetInGarrisonVehiclesAsCargo", "ActionGroupGetInGarrisonVehiclesAsCargo"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupOccupySentryPositions", "ActionGroupOccupySentryPositions"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupMoveGroundVehicles", "ActionGroupMoveGroundVehicles"] call AI_misc_fnc_setGoalPredefinedAction;
["GoalGroupUnflipVehicles", "ActionGroupUnflipVehicles"] call AI_misc_fnc_setGoalPredefinedAction;



// ---- Action preconditions and effects ----





// ---- Action costs ----