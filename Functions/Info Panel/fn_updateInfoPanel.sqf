if (!hasInterface) exitWith {};

private _display = uiNamespace getVariable ["BLWK_infoPanel", displayNull];
if (isNull _display) exitWith {};

// Update points
private _pointsText = _display displayCtrl INFO_PANEL_PLAYER_POINTS_IDC;
_pointsText ctrlSetText str (missionNamespace getVariable ["BLWK_playerKillPoints", 0]);

// Update wave number
private _waveNumberText = _display displayCtrl INFO_PANEL_WAVE_NUM_IDC;
_waveNumberText ctrlSetText str (missionNamespace getVariable ["BLWK_currentWaveNumber", 0]);

// Update respawns
private _respawnsText = _display displayCtrl INFO_PANEL_RESPAWNS_NUM_IDC;
_respawnsText ctrlSetText str (missionNamespace getVariable ["BLWK_numRespawnTickets", 0]);

// Update wave status
private _waveStatusText = _display displayCtrl INFO_PANEL_WAVE_STATUS_IDC;
_waveStatusText ctrlSetText (missionNamespace getVariable ["BLWK_waveStatus", ""]);

// Update kills
private _killsText = _display displayCtrl INFO_PANEL_PLAYER_KILLS_IDC;
_killsText ctrlSetText format ["Kills: %1", player getVariable ["BLWK_playerKills", 0]];

// Update FPS
private _fpsText = _display displayCtrl INFO_PANEL_PLAYER_FPS_IDC;
_fpsText ctrlSetText format ["FPS: %1", round diag_fps];

// Update time to next wave
private _nextWaveText = _display displayCtrl INFO_PANEL_NEXT_WAVE_IDC;
private _timeToNextWave = missionNamespace getVariable ["BLWK_timeToNextWave", 0];
_nextWaveText ctrlSetText format ["Next: %1", [_timeToNextWave, "MM:SS"] call BIS_fnc_secondsToString];

// Update total enemies
private _totalEnemiesText = _display displayCtrl INFO_PANEL_TOTAL_ENEMIES_IDC;
private _totalEnemies = {side _x == east} count allUnits;
_totalEnemiesText ctrlSetText format ["Enemies: %1", _totalEnemies];