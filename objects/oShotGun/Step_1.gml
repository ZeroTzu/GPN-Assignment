//ni hau ,


	x=oPlayer.x+10;
	y=oPlayer.y;
	image_angle=point_direction(x,y,mouse_x,mouse_y);
	firingdelay=firingdelay-1;

	recoil=max(0,recoil-1);
	if(mouse_check_button(mb_left))&& (firingdelay<0)
	{
		firingdelay=60;
		if(ammo>0)
		{
			recoil=4;

			ammo-=1;

			
			audio_play_sound(SnShotGunShoot,5,false);
			ScreenShake(2,20);
			
			
			
			bullet1collisionlist=ds_list_create();
			bullet1collisions=collision_line_list(x,y,x+lengthdir_x(range,image_angle),y+lengthdir_y(range,image_angle),bActor,false,true,bullet1collisionlist,true);
			with(instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed=other.projectileSpeed;
				direction=other.image_angle
				image_angle=direction;
			}
						
			bullet2varyangle= random_range(1,10);
			bullet2collisionlist=ds_list_create();
			bullet2collisions=collision_line_list(x,y,x+lengthdir_x(range,image_angle+bullet2varyangle),y+lengthdir_y(range,image_angle+bullet2varyangle),bActor,false,true,bullet2collisionlist,true);
			with(instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed=other.projectileSpeed;
				direction=other.image_angle+other.bullet2varyangle;
				image_angle=direction;

			}
			bullet3varyangle=random_range(1,10);
			bullet3collisionlist=ds_list_create();
			bullet3collisions=collision_line_list(x,y,x+lengthdir_x(range,image_angle-bullet3varyangle),y+lengthdir_y(range,image_angle-bullet3varyangle),bActor,false,true,bullet3collisionlist,true)
			with(instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed=other.projectileSpeed;
				direction=other.image_angle-other.bullet3varyangle;
				image_angle=direction;

			} 
			
			
			//collision 1
			if(bullet1collisions>0 )
			{
				currentPierce=pierce;
				for(var i=0;i<bullet1collisions;i++)
				{
					
					show_debug_message(string(object_get_parent(ds_list_find_value(bullet1collisionlist, i).object_index))+ " hihi " +string(bEnemy))
					if ( ds_list_find_value(bullet1collisionlist,i).object_index == oWall)
					{
						show_debug_message("wall detected");	
						break;
					}

					if (object_get_parent(ds_list_find_value(bullet1collisionlist, i).object_index) == bEnemy) 
					{
						show_debug_message("enemy detected");
						with(ds_list_find_value(bullet1collisionlist,i))	
						{
							hp--;
							flash=3;
							hitfrom=other.direction;
						}
					}
					else show_debug_message("something was detected");
					currentPierce--;
					if(currentPierce<=0)
					{
						show_debug_message("broke")
						break;
					}
				}
				show_debug_message("finished loop")
			}

						//collision 1
			if(bullet2collisions>0 )
			{
				currentPierce=pierce;
				for(var i=0;i<bullet2collisions;i++)
				{
					
					show_debug_message(string(object_get_parent(ds_list_find_value(bullet2collisionlist, i).object_index))+ " hihi " +string(bEnemy))
					if ( ds_list_find_value(bullet2collisionlist,i).object_index == oWall)
					{
						show_debug_message("wall detected");	
						break;
					}

					if (object_get_parent(ds_list_find_value(bullet2collisionlist, i).object_index) == bEnemy) 
					{
						show_debug_message("enemy detected");
						with(ds_list_find_value(bullet2collisionlist,i))	
						{
							hp--;
							flash=3;
							hitfrom=other.direction;
						}
					}
					else show_debug_message("something was detected");
					currentPierce--;
					if(currentPierce<=0)
					{
						show_debug_message("broke")
						break;
					}
				}
				show_debug_message("finished loop")
			}
			//collision 3
			if(bullet1collisions>0 )
			{
				currentPierce=pierce;
				for(var i=0;i<bullet3collisions;i++)
				{
					
					show_debug_message(string(object_get_parent(ds_list_find_value(bullet3collisionlist, i).object_index))+ " hihi " +string(bEnemy))
					if ( ds_list_find_value(bullet3collisionlist,i).object_index == oWall)
					{
						show_debug_message("wall detected");	
						break;
					}

					if (object_get_parent(ds_list_find_value(bullet3collisionlist, i).object_index) == bEnemy) 
					{
						show_debug_message("enemy detected");
						with(ds_list_find_value(bullet3collisionlist,i))	
						{
							hp--;
							flash=3;
							hitfrom=other.direction;
						}
					}
					else show_debug_message("something was detected");
					currentPierce--;
					if(currentPierce<=0)
					{
						show_debug_message("broke")
						break;
					}
				}
				show_debug_message("finished loop")
			}

			ds_list_destroy(bullet1collisionlist)
			ds_list_destroy(bullet2collisionlist)
			ds_list_destroy(bullet3collisionlist)
			
		}
		else
		{
			audio_play_sound(SnShotGunEmpty,5,false)
		}
	}
	x=x-lengthdir_x(recoil,image_speed);
	y=y-lengthdir_x(recoil,image_speed);

	if(image_angle>90)&&(image_angle<270)
	{
		image_yscale=-1;
	}
	else{
		image_yscale=1;
	}

	

