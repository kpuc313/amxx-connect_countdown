/*****************************************************************
*                            MADE BY
*
*   K   K   RRRRR    U     U     CCCCC    3333333      1   3333333
*   K  K    R    R   U     U    C     C         3     11         3
*   K K     R    R   U     U    C               3    1 1         3
*   KK      RRRRR    U     U    C           33333   1  1     33333
*   K K     R        U     U    C               3      1         3
*   K  K    R        U     U    C     C         3      1         3
*   K   K   R         UUUUU U    CCCCC    3333333      1   3333333
*
******************************************************************
*                       AMX MOD X Script                         *
*     You can modify the code, but DO NOT modify the author!     *
******************************************************************
*
* Description:
* ============
* This plugin countdawn from 1 minute, until more players are connected to the server and then restart it.
*
******************************************************************

#include <amxmodx>

new g_time, g_round
const TASK_ID = 4213;
const TASK_ID2 = 7567;

public plugin_init() {
	register_plugin("Connect Countdown", "1.0", "kpuc313")
	register_event("HLTV", "RoundStart", "a", "1=0", "2=0")
}

public RoundStart() {
	g_round++
	if(g_round == 1) {
		remove_task(TASK_ID);
		remove_task(TASK_ID2);
	
		set_task(60.0, "connect_countdown", TASK_ID)
		set_task(0.0, "connect_countdown2", TASK_ID2)
		g_time = 60
	}
}

public connect_countdown() {
	server_cmd("sv_restart 1")
}  

public connect_countdown2() {
	set_hudmessage(255, 255, 255, 0.02, 0.20, 0, 0.02, 1.0, 0.01, 0.1, -1); 
	show_hudmessage(0, "Waiting for players to connect...^nRestart in: %i second(s)", g_time); 
	--g_time;
        
	if(g_time >= 1)
	{
		set_task(1.0, "connect_countdown2", TASK_ID2)
	} else {
		remove_task(TASK_ID2);
	}
}  
