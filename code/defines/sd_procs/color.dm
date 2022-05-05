//This file was auto-corrected by findeclaration.exe on 29/05/2012 15:03:04

/* sd_colour and procs
	sd_colour is a special datum that contains colour data in various
	formats. Sample colours are available in samplecolours.dm.

sd_colour
	var/name		// the name of the colour
	var/red			// red componant of the colour
	var/green		// green componant of the colour
	var/blue		// red componant of the colour
	var/html		// html string for the colour
	var/icon/Icon	// contains the icon produced by the rgb2icon() proc

	PROCS
		brightness()
			Returns the grayscale brightness of the RGB colour set.

		html2rgb()
			Calculates the rgb colours from the html colours.

		rgb2html()
			Calculates the html colour from the rbg colours.

		rgb2icon()
			Converts the rgb value to a solid icon stored as src.Icon

*/

/*********************************************
*  Implimentation: No need to read further.  *
*********************************************/
sd_colour
	var/name		// the name of the colour
	var/red = 0		// red componant of the colour
	var/green = 0	// green componant of the colour
	var/blue = 0	// red componant of the colour
	var/html		// html string for the colour
	var/icon/Icon	// contains the icon produced by the rgb2icon() proc

	proc
		brightness()
		/* returns the grayscale brightness of the RGB colours. */
			return round((red*30 + green*59 + blue*11)/100,1)

		html2rgb()
		/* Calculates the rgb colours from the html colours */
			red = sd_base2dec(copytext(html,1,3))
			green = sd_base2dec(copytext(html,3,5))
			blue = sd_base2dec(copytext(html,5,7))

		rgb2html()
		/* Calculates the html colour from the rbg colours */
			html = sd_dec2base(red,,2) + sd_dec2base(green,,2) + sd_dec2base(blue,,2)
			return html

		rgb2icon()
		/* Converts the rgb value to a solid icon stored as src.Icon */
			Icon = 'Black.dmi' + rgb(red,green,blue)
			return Icon

	New()
		..()
		// if this is an unnamed subtype, name it according to it's type
		if(!name)
			name = "[type]"
			var/slash = sd_findlast(name,"/")
			if(slash)
				name = copytext(name,slash+1)
			name = sd_replacetext(name,"_"," ")

		if(html)	// if there is an html string
			html2rgb()	// convert the html to red, green, & blue values
		else
			rgb2html()	// convert the red, green, & blue values to html
