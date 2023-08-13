if(attackcdCurrent==0)
{
	with(oPlayer)
		{	
			if (oPlayer.isdead==false)
			{
				show_debug_message(hp)
				audio_play_sound(soundsZombie, 0, false);
				hp--;
				flash=3;
				hitfromdirection= -other.hsp;
				ishit=true;
				show_debug_message(string(hp))
			}
		}
		attackcdCurrent=attackcd
}

			