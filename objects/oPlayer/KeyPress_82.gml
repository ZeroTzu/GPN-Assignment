/// @description Insert description here
// You can write your code in this editor



show_debug_message(oTransition.mode)
if (oTransition.mode==TRANS_MODE.MOVIE)
{

	hascontrol=true;
	image_speed=1;
	sprite_index=sPlayer;
	hp=3;
	SlideTransition(TRANS_MODE.MOVIE_OFF);
	SlideTransition(TRANS_MODE.RESTART);
	//IMPORTANT TO SET ISDEAD TO FALSE AFTER RESTART TO AVOID CONFLICT WITH OPERSIST AND OGAMEMANAGER
	
}





//BELOW IS CODE FOR CINEMATIC VIEW
//if(oTransition.mode!=TRANS_MODE.MOVIE){
//	SlideTransition(TRANS_MODE.MOVIE);
//}
//else{
//	SlideTransition(TRANS_MODE.MOVIE_OFF);
//}