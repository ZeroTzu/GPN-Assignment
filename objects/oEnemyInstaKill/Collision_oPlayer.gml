if(attackcdCurrent==0)
{
	with(oPlayer)
		{	
			if (oPlayer.isdead==false)
			{
				show_debug_message(hp)
				hp = hp-3;
				flash=3;
				hitfromdirection= -other.hsp;
				ishit=true;
				show_debug_message(string(hp))
			}
		}
		attackcdCurrent=attackcd
}