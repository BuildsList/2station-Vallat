
/obj/item/clothing/head/helmet/space/maroon
	name = "glass space helmet"
	icon_state = "helm_sci"
	desc = "A glass and thick spherical helmet for low-pressure environments."
	flags = FPRINT | TABLEPASS | HEADSPACE | HEADCOVERSEYES | BLOCKHAIR
	see_face = 0.0
	item_state = "helm_sci"
	permeability_coefficient = 0.01
	armor = list(melee = 30, bullet = 25, laser = 0,energy = 0, bomb = 20, bio = 100, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES


/obj/item/clothing/suit/space/maroon
	name = "maroon space suit"
	desc = "A thick red suit with some iron and brass details"
	icon_state = "space_sci"
	item_state = "space_sci"
	w_class = 4//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	heat_transfer_coefficient = 0.02
	protective_temperature = 1500
	flags = FPRINT | TABLEPASS | SUITSPACE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/emergency_oxygen)
	slowdown = 2
	armor = list(melee = 15, bullet = 5, laser = 20,energy = 20, bomb = 20, bio = 100, rad = 50)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

