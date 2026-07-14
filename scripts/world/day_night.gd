extends AnimationPlayer

func changeTime(time_of_day: String):
	var last_played_animation:String
	#Time can be Morning, Midday, Sunset, Night
	#plays corresponding animation between transitions
	#redundancy with the last_played_animation var, can probably be removed with no consequence
	if time_of_day == "Morning" and last_played_animation != "Morning":
		play("Night to Sunrise")
		print("changing to morning")
	elif time_of_day == "Midday" and last_played_animation != "Midday":
		play("Sunrise to Midday")
		print("changing to Midday")
	elif time_of_day == "Sunset" and last_played_animation != "Sunset":
		play("Midday to Sunset")
		print("changing to Sunset")
	elif time_of_day == "Night" and last_played_animation != "Night":
		play("Sunset to Night")
		print("changing to Night")
	last_played_animation = time_of_day
	pass
