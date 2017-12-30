/* 
   Configuration file for DWM. 
*/
/*Appearance*/
#include "push.c"
#define NUMCOLORS 5
static const char colors[NUMCOLORS][ColLast][20] = {
	// border     fg         bg
	{ "#999999", "#aaaaaa", "#121212" },  // grey
	//{ "#e0e0e0", "#121212", "#aaaaaa" },  // grey
	{ "#eeeeee", "#4C4C4C", "#020202" },  // 0D - gray
	//{ "#20b2e7", "#20b2e7", "#3c3c3c" },  // 05 - Light Blue
	//{ "#3995BF", "#3995BF", "#020202" },  // 11 - light blue
	//{ "#f9f2d2", "#f9f2d2", "#212310" },  // Yellowish
	//{ "#1C679C", "#3995BF", "#1c1c1c" },  // 08 - blue
	//{ "#808080", "#cccccc", "#121212" },  // 0C - light gray
	//{ "#121212", "#828282", "#020202" },  // 01 - normal
	//{ "#acacac", "#020202", "#dedede" },  // 02 - selected
	{ "#B3354C", "#B3354C", "#020202" },  // 03 - urgent
	{ "#acacac", "#000000", "#303030" },  // 04 - orange (Occupied Color)
	{ "#20b2e7", "#20b2e7", "#3c3c3c" },  // 05 - Light Blue
	//    { "#608040", "#608040", "#020202" },  // 06 - green
	//    { "#877C43", "#877C43", "#020202" },  // 07 - yellow
	//    { "#1C678C", "#1C678C", "#020202" },  // 08 - blue
	//    { "#E300FF", "#E300FF", "#020202" },  // 09 - magenta
	//    { "#000000", "#000000", "#000000" },  // unusable
	//    { "#337373", "#337373", "#020202" },  // 0B - cyan
	//    { "#808080", "#808080", "#020202" },  // 0C - light gray
	//    { "#4C4C4C", "#4C4C4C", "#020202" },  // 0D - gray
	//    { "#FFEE00", "#FFEE00", "#020202" },  // 0E - yellow2
	//    { "#B1D354", "#B1D354", "#020202" },  // 0F - light green 
	//    { "#BF9F5F", "#BF9F5F", "#020202" },  // 10 - light yellow
	//    { "#3995BF", "#3995BF", "#020202" },  // 11 - light blue
	//    { "#A64286", "#A64286", "#020202" },  // 12 - light magenta
	//    { "#6C98A6", "#6C98A6", "#020202" },  // 13 - light cyan
	//    { "#FFA500", "#FFA500", "#020202" },  // 14 - orange
	//
	//    { "#0300ff", "#0300ff", "#802635" },  // 15 - warning
};

static const char font[]			= "Inconsolata 9";
static const char dmenu_font[]			= "Xft:Inconsolata:size=9";
static const unsigned int borderpx  		= 1;        	// border pixel of windows 
static const unsigned int snap         		= 2;     	// snap pixel
static const unsigned int gappx			= 0;
static const Bool showbar               	= True;  	// False means no bar
static const Bool topbar                	= True;  	// False means bottom bar
static const unsigned int systrayspacing 	= 2;   		// systray spacing 
static const Bool showsystray       		= True;     	// False means no systray 

/* Layout(s) */
static const float mfact      			= 0.63;  	// factor of master area size [0.05..0.95]
static const int nmaster      			= 1;     	// number of clients in master area
static const Bool resizehints 			= True; 	// True means respect size hints in tiled resizals
static const Layout layouts[] = {
	/* symbol	function */
	{ "[]=",	tile }, 		/* first entry is default */
	{ "==",	bstack },
	{ "[m]",	monocle },
	{ "<><",	NULL },    		/* no layout function means floating behavior */
	{ .symbol = NULL,   .arrange = NULL    },
};

/* Tagging */
static const char *tags[] = { "1", "2", "3", "q", "w", "e" };
//static const Tag tags[] = {
//    /* name    	layout       	mfact  	nmaster*/
//    { "¹",   	&layouts[0], 	-1,    	-1 },
//    { "B",	&layouts[0], 	-1,	-1 },
//    { "C",  	&layouts[0], 	-1,    	-1 },
//    { "D", 	&layouts[0], 	-1,    	-1 },
//    { "E",  	&layouts[0], 	-1,    	-1 },
//};

static const Rule rules[] = {
	/* class      		instance	title		tags mask	isfloating 	monitor */
	{ "Gimp",     		NULL,       	NULL,       	1 << 4,         True,		-1 },
	{ "Firefox",		NULL,		NULL,    	2,		False,		2 },
	{ "VirtualBox",		NULL,		NULL,		1 << 4,		False,		-1 },
	{ "Google-chrome",	NULL,		NULL,		1 << 0,		False,		-1 },
	{ "Qpaeq",		NULL,		NULL,		0,		True,		-1 },
	{ "Pavucontrol",	NULL,		NULL,		0,		True,		-1 },
	{ "Wxcam",		NULL,		NULL,		0,		True,		-1 },
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },


/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenurun[] 		= 	{ "dmenu_run", "-fn", dmenu_font, "-nb", colors[0][2], "-nf", colors[0][1], 
	"-sf", colors[1][1], "-sb", colors[1][2], NULL };
static const char *killdwm[]		=	{ "killall", "dwm", NULL };
static const char *fileman[]		=	{ "thunar", NULL };
static const char *terminal[]		=	{ "urxvt", NULL };
static const char *tmuxsplit[]  	=	{ "tmux", "split", NULL };
static const char *tmuxhsplit[]  	=	{ "tmux", "split", "-h", NULL };
static const char *tmuxnew[]		=	{ "tmux", "new-window", NULL };
static const char *passdmenu[]		=	{ "/home/gabriel/bin/passdmenu.py", NULL };
static const char *surfrawcmd[]		=	{ "/home/gabriel/bin/dmenu-surfraw", dmenu_font, colors[0][2], colors[0][1], colors[1][2], colors[1][1], NULL };
//static const char *thunarterm[]		=	{ "/home/garry/.scripts/thunarterm", NULL };
//static const char *composite[]		=	{ "/home/garry/.scripts/composite", NULL };

static Key keys[] = {
	/* modifier                     	key        		function        	argument */
	{ MODKEY,				XK_t,			spawn,			{.v = terminal } },
	{ MODKEY,				XK_p,			spawn,			{.v = passdmenu } },
	{ MODKEY,	 			XK_f,	   		spawn,	   		{.v = fileman} },
	{ MODKEY,				XK_r,      		spawn,	   		{.v = dmenurun } },
	{ MODKEY,				XK_4,      		spawn,	   		{.v = surfrawcmd }, },
	{ MODKEY,				XK_s,      		spawn,	   		{.v = tmuxsplit }, },
	{ MODKEY,				XK_v,      		spawn,	   		{.v = tmuxhsplit }, },
	{ MODKEY,				XK_c,      		spawn,	   		{.v = tmuxnew }, },
	{ MODKEY|ControlMask,			XK_Delete,		spawn,			{.v = killdwm } },
	{ MODKEY,                       	XK_b,      		togglebar,     	        {0} },
	{ MODKEY,                       	XK_j,      		focusstack,     	{.i = +1 } },
	{ MODKEY,                       	XK_k,      		focusstack,     	{.i = -1 } },
	{ MODKEY,				XK_i,      		incnmaster,     	{.i = +1 } },
	{ MODKEY,				XK_d,      		incnmaster,     	{.i = -1 } },
	{ MODKEY,                       	XK_h,      		setmfact,       	{.f = -0.05} },
	{ MODKEY,                       	XK_l,      		setmfact,       	{.f = +0.05} },
	{ MODKEY,                       	XK_Return, 		zoom,           	{0} },
	{ MODKEY|ShiftMask,             	XK_c,      		killclient,    		{0} },
	{ MODKEY,                       	XK_space,  		nextlayout,      	{0} },
	{ MODKEY|ShiftMask,             	XK_space,  		togglefloating, 	{0} },
	{ MODKEY,                       	XK_0,      		view,           	{.ui = ~0 } },
	{ MODKEY|ShiftMask,             	XK_0,      		tag,            	{.ui = ~0 } },
	{ MODKEY,                       	XK_comma,  		focusmon,       	{.i = -1 } },
	{ MODKEY|ShiftMask,             	XK_comma,  		tagmon,         	{.i = -1 } },
	{ MODKEY|ShiftMask,			XK_x,			quit,			{0} },
	{ MODKEY|ShiftMask,			XK_r,			reload,			{0} },
	{ MODKEY|ShiftMask,			XK_Tab,   		cycleprev,  		{.ui = -1} },
	{ MODKEY|ShiftMask,			XK_Tab,  		cyclenext,  		{.ui = +1} },
	{ MODKEY,                       	XK_Down,  		moveresize,     	{.v = (int []){ 0, 25, 0, 0 }}},
	{ MODKEY,                       	XK_Up,    		moveresize,     	{.v = (int []){ 0, -25, 0, 0 }}},
	{ MODKEY,                       	XK_Right, 		moveresize,     	{.v = (int []){ 25, 0, 0, 0 }}},
	{ MODKEY,                       	XK_Left,  		moveresize,     	{.v = (int []){ -25, 0, 0, 0 }}},
	{ MODKEY|ShiftMask,             	XK_j,      		pushup,      		{.i = +1 } },
	{ MODKEY|ShiftMask,             	XK_k,     		pushdown,      		{.i = -1 } },
	TAGKEYS(                        	XK_1,                      0)
		TAGKEYS(                        	XK_2,                      1)
		TAGKEYS(                        	XK_3,                      2)
		TAGKEYS(                        	XK_q,                      3)
		TAGKEYS(                        	XK_w,                      4)
		TAGKEYS(                        	XK_e,                      5)
		//	{ MODKEY|ShiftMask,  		        XK_q,      		spawn,         		 {.v = composite}},
		//	{ MODKEY,             			XK_q,      		quit,          		 {0} },
		//	{ 0,					XK_F4,			spawn,			{.v = thunarterm}},

};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	/*	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } }, */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
