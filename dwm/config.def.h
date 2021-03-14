/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0; /* border pixel of windows */
static const unsigned int snap      = 32; /* snap pixel */
static const unsigned int gappih    = 6; /* horiz inner gap between windows */
static const unsigned int gappiv    = 6; /* vert inner gap between windows */
static const unsigned int gappoh    = 6; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 14; /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0; /* 1 means no outer gap when there is only one window */
static const int showbar            = 1; /* 0 means no bar */
static const int topbar             = 0; /* 0 means bottom bar */
static const int usealtbar          = 1; /* 1 means use non-dwm status bar */
static const char *altbarclass      = "Polybar"; /* Alternate bar class name */
static const char *alttrayname      = "tray"; /* Polybar tray instance name */
static const char *altbarcmd        = "$HOME/.local/bin/autostart.sh"; /* Alternate bar launch command */
static const int vertpad            = 10; /* vertical padding of bar */
static const int sidepad            = 10; /* horizontal padding of bar */
static const int swallowfloating    = 0; /* 1 means swallow floating windows by default */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static char normbgcolor[]           = "#070e12";
static char normbordercolor[]       = "#070e12";
static char normfgcolor[]           = "#F8F8F2";
static char selfgcolor[]            = "#E6E6E6";
static char selbordercolor[]        = "#282A36";
static char selbgcolor[]            = "#070e12";
static char *colors[][3] = {
/*               fg           bg           border   */
[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
[SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" };

static const Rule rules[] = {
/* xprop(1):
*	WM_CLASS(STRING) = instance, class
*	WM_NAME(STRING) = title
*/
/* 1 floating or 0 no floating */
/* class,			 instance,	title,				tags mask,	isfloating,	isterminal,	noswallow,	monitor */
{ "Alacritty",			 NULL,		NULL,				0,		 0,		1,		0,		-1 },
{ "st-256color",		 NULL,		NULL,				0,		 0,		1,		0,		-1 },
{ "St",				 NULL,		NULL,				0,		 0,		1,		0,		-1 },
{ "URxvt",			 NULL,		NULL,				0,		 0, 		1,		0,		-1 },
{ "Thunar",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Tor Browser",		 NULL,		NULL,				0,		 1, 		0,		-1,		-1 },
{ "Inkscape",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Viewnior",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Video-downloader",		 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Pavucontrol",		 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Et",				 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "BleachBit",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Wps",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Onboard",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Wpp",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Wpspdf",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Peek",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Colorgrab",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "vlc",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Rofi",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Xarchiver",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "xpdf",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "XpdfReader",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Epdfview",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Lxappearance",		 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "burp-StartBurp",		 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "System-config-printer.py",	 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Blueman-manager",		 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Nm-connection-editor",	 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "libreoffice-startcenter",	 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "Gimp",			 NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ "sun-tools-jconsole-JConsole", NULL,		NULL,				0,		 1, 		0,		0,		-1 },
{ NULL,				 "ncmpcpp",	NULL,				0,		 1, 		0,		0,		-1 },
{ NULL,				 "Open Image",	NULL,				0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Connect...",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Progress...",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Armitage",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Confirm",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Save File",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Accessibility",		0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Appearance",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Settings",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Keyboard",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Default Applications",		0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Save As",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Picture in picture",		0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Task Manager - Chromium",	0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Task Manager - Brave",		0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Open Files",			0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"File Operation Progress",	0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Polybar tray window",		0,		 1, 		0,		0,		-1 },
{ NULL,				 NULL,		"Event Tester",			0,		 0, 		0,		1,		-1 },
{ NULL,				 NULL,		"hidden",			SCRATCHPAD_MASK, 1, 		1,		0,		-1 },
};

/* layout(s) */
static const float mfact     = 0.55;	/* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;	/* number of clients in master area */
static const int resizehints = 0;	/* 1 means respect size hints in tiled resizals */

/* mouse scroll resize */
static const int scrollsensetivity = 30; /* 1 means resize window by 1 pixel for each scroll event */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
/* symbol     arrange function */
{ "[]=",      tile },			/* 0 first entry is default */
{ "[M]",      monocle },		/* 1 */
{ "[@]",      spiral },			/* 2 */
{ "[\\]",     dwindle },		/* 3 */
{ "H[]",      deck },			/* 4 */
{ "TTT",      bstack },			/* 5 */
{ "===",      bstackhoriz },		/* 6 */
{ "HHH",      grid },			/* 7 */
{ "###",      nrowgrid },		/* 8 */
{ "---",      horizgrid },		/* 9 */
{ ":::",      gaplessgrid },		/* 10 */
{ "|M|",      centeredmaster },		/* 11 */
{ ">M>",      centeredfloatingmaster },	/* 12 */
{ "><>",      NULL },			/* 13 no layout function means floating behavior */
{ NULL,       NULL },			/* 14 */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvt", NULL };

#include "movestack.c"
#include "shiftview.c"
static Key keys[] = {
/* modifier			key		function		argument */
{ MODKEY,			XK_b,		togglebar,		{0} },
{ MODKEY,			XK_j,		focusstack,		{.i = +1 } },
{ MODKEY,			XK_k,		focusstack,		{.i = -1 } },
{ MODKEY|ShiftMask,		XK_Up,		incnmaster,		{.i = +1 } },
{ MODKEY|ShiftMask,		XK_Down,	incnmaster,		{.i = -1 } },
{ MODKEY|ShiftMask,		XK_Left,	setmfact,		{.f = -0.05} },
{ MODKEY|ShiftMask,		XK_Right,	setmfact,		{.f = +0.05} },
{ MODKEY|ShiftMask,		XK_Return,	zoom,			{0} },
{ MODKEY,			XK_Tab,		view,			{0} },
{ MODKEY,			XK_q,		killclient,		{0} },
{ MODKEY,			XK_x,		setlayout,		{.v = &layouts[0]} },
{ MODKEY|ControlMask,		XK_x,		setlayout,		{.v = &layouts[1]} },
{ MODKEY|ShiftMask,		XK_x,		setlayout,		{.v = &layouts[2]} }, /* @ spiral patch vanitygaps */
{ Mod1Mask,			XK_x,		setlayout,		{.v = &layouts[10]} }, /* ::: gaplessgrid patch vanitygaps */
{ Mod1Mask|ShiftMask,		XK_x,		setlayout,		{.v = &layouts[8]} }, /* ### nrowgrid patch vanitygaps */
{ MODKEY,			XK_space,	setlayout,		{0} },
{ MODKEY|ShiftMask,		XK_space,	togglefloating,		{0} },
{ MODKEY,			XK_0,		view,			{.ui = ~0 } },
{ MODKEY|ShiftMask,		XK_0,		tag,			{.ui = ~0 } },
{ MODKEY,			XK_comma,	focusmon,		{.i = -1 } },
{ MODKEY,			XK_period,	focusmon,		{.i = +1 } },
{ MODKEY|ShiftMask,		XK_comma,	tagmon,			{.i = -1 } },
{ MODKEY|ShiftMask,		XK_period,	tagmon,			{.i = +1 } },
/*{ MODKEY|ShiftMask,		XK_r,		quit,			{0} }, */
{ MODKEY|ControlMask,		XK_r,		spawn,			SHCMD("polybar-msg cmd restart") },
{ MODKEY|ShiftMask,		XK_r,		quit,			{1} }, /* patch restartsig */
{ ControlMask|ShiftMask, 	XK_Left,	movestack,		{.i = +1 } }, /* patch movestack */
{ ControlMask|ShiftMask, 	XK_Right,	movestack,		{.i = -1 } }, /* patch movestack */
{ MODKEY,		 	XK_Right,	shiftview,		{.i = +1 } }, /* patch shiftview */
{ MODKEY,		 	XK_Left,	shiftview,		{.i = -1 } }, /* patch shiftview */
{ MODKEY,		 	XK_n,		scratchpad_show,	{0} }, /* patch scratchpad */
{ MODKEY,		 	XK_m,		scratchpad_hide,	{0} }, /* patch scratchpad */
{ MODKEY|ShiftMask,	 	XK_m,		scratchpad_remove,	{0} }, /* patch scratchpad */
{ MODKEY,		 	XK_s,		togglesticky,		{0} }, /* patch sticky */
{ MODKEY,		 	XK_c,		center,			{0} }, /* patch center floating */
{ MODKEY,		 	XK_f,		togglefullscreen,	{0} }, /* patch togglefullscreen */
{ MODKEY,		 	XK_grave,	xrdb,			{.v = NULL } }, /* patch xrdb */
{ MODKEY,			XK_t,		togglealwaysontop,	{0} }, /* patch alwaysontop */
{ MODKEY|ControlMask,		XK_Up,		incrgaps,		{.i = +1 } }, /* patch vanitygaps gaps all */
{ MODKEY|ControlMask,		XK_Down,	incrgaps,		{.i = -1 } }, /* patch vanitygaps gaps all */
{ MODKEY|ControlMask,		XK_Right,	incrigaps,		{.i = +1 } }, /* patch vanitygaps gaps inner all */
{ MODKEY|ControlMask,		XK_Left,	incrigaps,		{.i = -1 } }, /* patch vanitygaps gaps inner all */
{ MODKEY|ControlMask|ShiftMask,	XK_Up,		incrogaps,		{.i = +1 } }, /* patch vanitygaps gaps outner all */
{ MODKEY|ControlMask|ShiftMask,	XK_Down,	incrogaps,		{.i = -1 } }, /* patch vanitygaps gaps outner all */
{ Mod1Mask|ShiftMask,		XK_Up,		incrihgaps,		{.i = +1 } }, /* patch vanitygaps gaps inner top bottom */
{ Mod1Mask|ShiftMask,		XK_Down,	incrihgaps,		{.i = -1 } }, /* patch vanitygaps gaps inner top bottom */
{ Mod1Mask|ShiftMask,		XK_Right,	incrivgaps,		{.i = +1 } }, /* patch vanitygaps gaps inner left right */
{ Mod1Mask|ShiftMask,		XK_Left,	incrivgaps,		{.i = -1 } }, /* patch vanitygaps gaps inner left right */
{ MODKEY|Mod1Mask,		XK_Up,		incrohgaps,		{.i = +1 } }, /* patch vanitygaps gaps outner top bottom */
{ MODKEY|Mod1Mask,		XK_Down,	incrohgaps,		{.i = -1 } }, /* patch vanitygaps gaps outner top bottom */
{ MODKEY|Mod1Mask,		XK_Right,	incrovgaps,		{.i = +1 } }, /* patch vanitygaps gaps outner left right */
{ MODKEY|Mod1Mask,		XK_Left,	incrovgaps,		{.i = -1 } }, /* patch vanitygaps gaps outner left right */
{ MODKEY|ControlMask|ShiftMask,	XK_0,		togglegaps,		{0} }, /* patch vanitygaps disable gaps */
{ MODKEY|ControlMask|ShiftMask,	XK_equal,	defaultgaps,		{0} }, /* patch vanitygaps default gaps */
TAGKEYS( XK_1, 0)
TAGKEYS( XK_2, 1)
TAGKEYS( XK_3, 2)
TAGKEYS( XK_4, 3)
TAGKEYS( XK_5, 4)
TAGKEYS( XK_6, 5)
TAGKEYS( XK_7, 6)
};

/* resizemousescroll direction argument list */
static const int scrollargs[][2] = {
/* width change, height change */
{ +scrollsensetivity, 0 },
{ -scrollsensetivity, 0 },
{ 0, +scrollsensetivity },
{ 0, -scrollsensetivity },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
/* click                event mask	button          function		argument */
{ ClkLtSymbol,          0,		Button1,        setlayout,		{0} },
{ ClkLtSymbol,          0,		Button3,        setlayout,		{.v = &layouts[2]} },
{ ClkWinTitle,          0,		Button2,        zoom,			{0} },
{ ClkStatusText,	0,		Button2,        spawn,			{.v = termcmd } },
{ ClkClientWin,         MODKEY,		Button1,        movemouse,		{0} },
{ ClkClientWin,         MODKEY,		Button2,        togglefloating,		{0} },
{ ClkClientWin,         MODKEY,		Button3,        resizemouse,		{0} },
{ ClkClientWin,         MODKEY,		Button4,        resizemousescroll,	{.v = &scrollargs[0]} }, /* patch tapresize */
{ ClkClientWin,         MODKEY,		Button5,        resizemousescroll,	{.v = &scrollargs[1]} }, /* patch tapresize */
{ ClkClientWin,         MODKEY,		Button6,        resizemousescroll,	{.v = &scrollargs[2]} }, /* patch tapresize */
{ ClkClientWin,         MODKEY,		Button7,        resizemousescroll,	{.v = &scrollargs[3]} }, /* patch tapresize */
{ ClkTagBar,            0,		Button1,        view,			{0} },
{ ClkTagBar,            0,		Button3,        toggleview,		{0} },
{ ClkTagBar,            MODKEY,		Button1,        tag,			{0} },
{ ClkTagBar,            MODKEY,		Button3,        toggletag,		{0} },
};

static const char *ipcsockpath = "/tmp/dwm.sock";
static IPCCommand ipccommands[] = {
IPCCOMMAND( view,		1, {ARG_TYPE_UINT} ),
IPCCOMMAND( toggleview,		1, {ARG_TYPE_UINT} ),
IPCCOMMAND( tag,		1, {ARG_TYPE_UINT} ),
IPCCOMMAND( toggletag,		1, {ARG_TYPE_UINT} ),
IPCCOMMAND( tagmon,		1, {ARG_TYPE_UINT} ),
IPCCOMMAND( focusmon,		1, {ARG_TYPE_SINT} ),
IPCCOMMAND( focusstack,		1, {ARG_TYPE_SINT} ),
IPCCOMMAND( zoom,		1, {ARG_TYPE_NONE} ),
IPCCOMMAND( incnmaster,		1, {ARG_TYPE_SINT} ),
IPCCOMMAND( killclient,		1, {ARG_TYPE_SINT} ),
IPCCOMMAND( togglefloating,	1, {ARG_TYPE_NONE} ),
IPCCOMMAND( setmfact,		1, {ARG_TYPE_FLOAT} ),
IPCCOMMAND( setlayoutsafe,	1, {ARG_TYPE_PTR} ),
IPCCOMMAND( quit,		1, {ARG_TYPE_NONE} ), /* patch restartsig */
IPCCOMMAND( movestack,		1, {ARG_TYPE_SINT} ), /* patch movestack */
IPCCOMMAND( shiftview,		1, {ARG_TYPE_SINT} ), /* patch shiftview */
IPCCOMMAND( scratchpad_show,	1, {ARG_TYPE_NONE} ), /* patch scratchpad */
IPCCOMMAND( scratchpad_hide,	1, {ARG_TYPE_NONE} ), /* patch scratchpad */
IPCCOMMAND( scratchpad_remove,	1, {ARG_TYPE_NONE} ), /* patch scratchpad */
IPCCOMMAND( togglesticky,	1, {ARG_TYPE_NONE} ), /* patch sticky */
IPCCOMMAND( center,		1, {ARG_TYPE_NONE} ), /* patch center floating */
IPCCOMMAND( togglefullscreen,	1, {ARG_TYPE_NONE} ), /* patch togglefullscreen */
IPCCOMMAND( xrdb,		1, {ARG_TYPE_NONE} ), /* patch xrdb */
IPCCOMMAND( togglealwaysontop,	1, {ARG_TYPE_NONE} ), /* patch alwaysontop */
IPCCOMMAND( incrgaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps all */
IPCCOMMAND( incrigaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps inner all */
IPCCOMMAND( incrogaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps outner all */
IPCCOMMAND( incrihgaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps inner top bottom */
IPCCOMMAND( incrivgaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps inner left right */
IPCCOMMAND( incrohgaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps outner top bottom */
IPCCOMMAND( incrovgaps,		1, {ARG_TYPE_SINT} ), /* patch vanitygaps gaps outner left right */
IPCCOMMAND( togglegaps,		1, {ARG_TYPE_NONE} ), /* patch vanitygaps disable gaps */
IPCCOMMAND( defaultgaps,	1, {ARG_TYPE_NONE} )  /* patch vanitygaps default gaps */
};
