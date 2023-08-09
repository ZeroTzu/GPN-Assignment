/// @description Insert description here
// You can write your code in this editor

w=display_get_gui_width();
h=display_get_gui_height();
h_half=h*0.5;
h_quarter=h*0.25
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	MOVIE,
	MOVIE_PROGRESS,
	MOVIE_OFF
}

mode=TRANS_MODE.INTRO;
percent=1;
target=room;




