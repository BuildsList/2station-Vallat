
/obj/item/clothing/suit/space/recon
	name = "camouflaged light spacesuit"
	desc = "A suit that protects against low pressure environments. Light and looks like a jumpsuit."
	icon_state = "spacerec"
	item_state = "spacerec"
	w_class = 4
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	heat_transfer_coefficient = 0.02
	protective_temperature = 1000
	flags = FPRINT | TABLEPASS | SUITSPACE | BLOCKHAIR
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/device/t_scanner, /obj/item/weapon/rcd, /obj/item/weapon/crowbar, \
	/obj/item/weapon/screwdriver, /obj/item/weapon/weldingtool, /obj/item/weapon/wirecutters, /obj/item/weapon/wrench, /obj/item/device/multitool, \
	/obj/item/device/radio, /obj/item/device/analyzer, /obj/item/weapon/gun/energy/laser, /obj/item/weapon/gun/energy/pulse_rifle, \
	/obj/item/weapon/gun/energy/taser, /obj/item/weapon/melee/baton, /obj/item/weapon/gun/energy/gun)
	slowdown = 1
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 50)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT