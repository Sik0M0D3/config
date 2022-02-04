/*---------------------------------------- Header config.h ----------------------------------------*/


/*-------------------------------------- Appearance Settings --------------------------------------*/


static const unsigned int baralpha     = 0xd0;      // Bar Alpha Transparency Patch
static const unsigned int borderalpha  = OPAQUE;    // Border Alpha Transparency Patch
static const unsigned int alphas[][3]  = {          /* Transparency Alphas
                    fg      bg        border        */
   [SchemeNorm] = { OPAQUE, baralpha, borderalpha },//
   [SchemeSel]  = { OPAQUE, baralpha, borderalpha },//
};                                                  //
static const unsigned int borderpx     = 3;         // Border pixel of windows
static const unsigned int gappx        = 7;         // Gaps pixel of windows
static const unsigned int snap         = 16;  //32  // Snap pixel
static const int          topbar       = 1;         // 0 means Bottom Bar
static const int          showbar      = 1;         // 0 means No Bar
static const int          vertpad      = 7;         // Bar Vertical Padding
static const int          sidepad      = 7;         // Bar Horizontal Padding
static const char         col_white[]  = "#ffffff"; // <- Focused Text & Icons
//static const char         col_purpl[]  = "#943bba"; // <- Focused Bar & Window Borders
static const char         col_dpurp[]  = "#6800c4";
static const char         col_black[]  = "#000000"; // <- Unfocused Bar
static const char         col_gray2[]  = "#bbbbbb"; // <- Unfocused Text & Icons
static const char         col_gray1[]  = "#444444"; // <- Unfocused Window Borders
static const char         dmenufont[]  = "JetBrains Mono Nerd Font:size=14";
static const char         *fonts[]     = { "JetBrains Mono Nerd Font:size=14" };
static const char         *colors[][3] = {
	//               fg         bg         border   
	[SchemeNorm] = { col_gray2, col_black, col_gray1 },
	[SchemeSel]  = { col_white, col_dpurp, col_dpurp },
	[SchemeHid]  = { col_dpurp, col_black, col_dpurp },
};


/*-------------------------------------------- Tagging --------------------------------------------*/


static const unsigned int tagalpha[] = { OPAQUE, baralpha };
static const char *tags[] = { "  ", "  ", "  ", "  ", "  " };
static const char *tagsel[][2] = {
    { "#ff0000", "#000000" },
    { "#ff7f00", "#000000" },
    { "#0000ff", "#000000" },
    { "#00ff00", "#000000" },
    { "#ffff00", "#000000" },
};
static const Rule rules[] = {
       /* xprop(1):                                                                     *
     	*                                                                               *
     	*   WM_CLASS(STRING) = instance, class                                          *
     	*   WM_NAME(STRING) = title                                                     *
     	*                                                                               *
     	*  class        instance     title        tags mask    isfloating   monitor     */
	{ "Gimp",       NULL,        NULL,        0,           1,          -1           },
	{ "Librewolf",  NULL,        NULL,        1 << 4,      0,          -1           },
    	{ "Steam",      NULL,        NULL,        0,           1,          -1           },
    	{ "Steam",      NULL,   "Friend List",    0,           1,          -1           },
};


/*-------------------------------------------- Layouts --------------------------------------------*/


#include "layouts.c"
static const float mfact            = 0.5;  //  factor of master area size [0.05..0.95].
static const int   nmaster          = 1;    //  number of clients in master area.
static const int   resizehints      = 1;    //  1 = respect size hints in tiled resizals.
static const int   lockfullscreen   = 0;    //  1 = force focus on the fullscreen window.
static const       Layout layouts[] =
{
//	  symbol    function 
    	{ "[]=",    tile    	},  //  0 is default.
    	{ "[g]",    grid    	},
	{ "<f>",    NULL    	},  //  no layout function means floating behavior.
	{ "[m]",    monocle 	},
};


/*-------------------------------------- Command Definitions --------------------------------------*/


// helper for spawning shell commands in the pre dwm-5.0 fashion
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
static char       dmenumon[2] = "0";
static const char *termcmd[]  = { "alacritty", NULL };
static const char *termcmd2[] = { "st", NULL };
static const char *dmenucmd[] = { "dmenu_run", 
    "-fn", dmenufont, "-m" ,  dmenumon,
    "-nb", col_black, "-nf", col_gray2,
    "-sb", col_dpurp, "-sf", col_white,
    "-x" ,    "7"   ,
    "-y" ,    "7"   ,
    "-z" ,  "1370"  ,
     NULL
};


/*---------------------------------------- Key Definitions ----------------------------------------*/


#include "movestack.c"
#include "selfrestart.c"
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,            view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,            toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,            tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,            toggletag,      {.ui = 1 << TAG} },


static Key keys[] = {
//    modifier                      key             function        argument
	{ MODKEY,                       XK_p,           spawn,          {.v = dmenucmd } },
    	{ MODKEY|ShiftMask,             XK_Return,      spawn,          {.v = termcmd2 } },
	{ MODKEY,                       XK_Return,      spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,           togglebar,      { 0 } },

/*	{ MODKEY,                       XK_Up,          focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Down,        focusstack,     {.i = +1 } },
    	{ MODKEY,                       XK_Right,       focusstack,     {.i = -1 } },
    	{ MODKEY,                       XK_Left,        focusstack,     {.i = +1 } },  */

    	{ MODKEY,                       XK_Up,          focusstackvis,  {.i = -1 } },
    	{ MODKEY,                       XK_Down,        focusstackvis,  {.i = +1 } },
    	{ MODKEY,                       XK_Right,       focusstackvis,  {.i = -1 } },
    	{ MODKEY,                       XK_Left,        focusstackvis,  {.i = +1 } },
    	{ MODKEY|Mod1Mask,              XK_Right,       focusstackhid,  {.i = -1 } },
    	{ MODKEY|Mod1Mask,              XK_Left,        focusstackhid,  {.i = +1 } },

    	{ MODKEY|ControlMask,           XK_Up,          movestack,      {.i = -1 } },
    	{ MODKEY|ControlMask,           XK_Down,        movestack,      {.i = +1 } },
    	{ MODKEY|ControlMask,           XK_Right,       movestack,      {.i = -1 } },
    	{ MODKEY|ControlMask,           XK_Left,        movestack,      {.i = +1 } },
    	{ MODKEY|ShiftMask,             XK_Left,        setmfact,       {.f = -0.025 } },
	{ MODKEY|ShiftMask,             XK_Right,       setmfact,       {.f = +0.025 } },
	
    	{ MODKEY,                       XK_t,           setlayout,      {.v = &layouts[0] } },
	{ MODKEY,                       XK_g,           setlayout,      {.v = &layouts[1] } },
	{ MODKEY,                       XK_f,           setlayout,      {.v = &layouts[2] } },
	{ MODKEY,                       XK_m,           setlayout,      {.v = &layouts[3] } },
	
//	{ MODKEY|ShiftMask,             XK_space,       togglefloating, { 0 } },
	
    	{ MODKEY,                       XK_Tab,         view,           { 0 } },
    	{ MODKEY,                       XK_0,           view,           {.ui = ~0 } },
    	{ MODKEY|ShiftMask,             XK_0,           tag,            {.ui = ~0 } },
	
    	{ MODKEY,                       XK_minus,       setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_plus,        setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,       setgaps,        {.i = 0 } },
	
    	{ MODKEY,                       XK_comma,       focusmon,       {.i = -1 } },
    	{ MODKEY,                       XK_period,      focusmon,       {.i = +1 } },
    	{ MODKEY|ShiftMask,             XK_comma,       tagmon,         {.i = -1 } },
    	{ MODKEY|ShiftMask,             XK_period,      tagmon,         {.i = +1 } },
	
    	{ MODKEY|ShiftMask,             XK_space,       show,           { 0 } },
    	{ MODKEY,                       XK_space,       hide,           { 0 } },
    	{ MODKEY,                       XK_c,           killclient,     { 0 } },
	
    	{ MODKEY|ShiftMask,             XK_r,           self_restart,   { 0 } },
    	{ MODKEY|ShiftMask,             XK_q,           quit,           { 0 } },
	
	TAGKEYS(                      	XK_1,                             0 )
	TAGKEYS(                      	XK_2,                             1 )
	TAGKEYS(                      	XK_3,                             2 )
      	TAGKEYS(                      	XK_4,                             3 )
	TAGKEYS(                      	XK_5,                             4 )
};


/*------------------------------------ Mouse Button Definitions -----------------------------------*/


static Button buttons[] = {
/*                                                                                      *
 *                                                                                      *
 *    Click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin.    *
 *                                                                                      *
 *    	  click             event mask  button          function        argument       	*/
    	{ ClkLtSymbol,      0,          Button1,        setlayout,      { 0 } },
	{ ClkLtSymbol,      0,          Button3,        setlayout,      {.v = &layouts[2] } },
	{ ClkStatusText,    0,          Button2,        spawn,          {.v = termcmd } },
    	{ ClkStatusText,    0,          Button2,        spawn,          {.v = termcmd2 } },
//        MODKEY
	{ ClkWinTitle,      0,          Button1,        movemouse,      { 0 } },
    	{ ClkClientWin,     MODKEY,     Button1,        movemouse,      { 0 } },
	{ ClkClientWin,     MODKEY,     Button2,        togglefloating, { 0 } },
	{ ClkClientWin,     MODKEY,     Button3,        resizemouse,    { 0 } },
    	{ ClkWinTitle,      0,          Button1,        togglewin,      { 0 } },
	{ ClkTagBar,        0,          Button1,        view,           { 0 } },
	{ ClkTagBar,        0,          Button3,        toggleview,     { 0 } },
	{ ClkTagBar,        MODKEY,     Button1,        tag,            { 0 } },
	{ ClkTagBar,        MODKEY,     Button3,        toggletag,      { 0 } },
};
