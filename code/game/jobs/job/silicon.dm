/datum/job/ai
	title = "AI"
	flag = AI
	department_flag = TH
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	selection_colour = "#ccffcc"
	supervisors = "your laws"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		return 1



/datum/job/cyborg
	title = "Cyborg"
	flag = CYBORG
	department_flag = TH
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	supervisors = "your laws and the AI"	//Nodrak
	selection_colour = "#ddffdd"

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		return 1