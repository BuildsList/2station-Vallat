var/const
	MMC	=(1<<0)

	SUPERVISOR		=(1<<1)
	MACHINIST		=(1<<2)
	CARGOTECH		=(1<<3)
	UNIT			=(1<<4)
	BARTENDER		=(1<<5)


	TH		=(1<<1)

	OVERSEER		=(1<<1)
	CMO				=(1<<2)
	RD				=(1<<3)
	HON				=(1<<4)
	CHIEF			=(1<<5)
	HOS				=(1<<6)
	CSO				=(1<<7)
	OFFICER			=(1<<8)
	DETECTIVE		=(1<<9)
	CPSY			=(1<<10)
	PSY				=(1<<11)
	CHEMIST			=(1<<12)
	DOCTOR			=(1<<13)
	GENETICIST		=(1<<14)
	SCIENTIST		=(1<<15)
	ENGINEER		=(1<<16)
	ATMOSTECH		=(1<<17)
	ROBOTICIST		=(1<<18)
	BOTANIST		=(1<<19)
	CHEF			=(1<<20)
	JANITOR			=(1<<21)
	ASSISTANT		=(1<<22)
	AI				=(1<<23)
	CYBORG			=(1<<24)


var/list/assistant_occupations = list(
	"Assistant"
)


var/list/command_positions = list(
	"Shift Supervisor",
	"Transhumanist Overseer",
	"Head of Security",
	"Chief Engineer",
	"Research Director",
	"Chief Medical Officer",
	"Head of Nutrition",
	"Chief Psychiatrist"

)


var/list/engineering_positions = list(
	//"Chief Engineer",
	"Engineer",
	"Atmospheric Technician",
	"Machinist",
	"Cargo Unit",
	"Unit",
	"Roboticist"
)


var/list/medical_positions = list(
	//"Chief Medical Officer",
	//"Chief Psychiatrist",
	"Psychiatrist",
	"Medical Doctor",
	"Geneticist"
)


var/list/science_positions = list(
	//"Research Director",
	"Scientist",
	"Chemist"
)


var/list/civilian_positions = list(
	//"Transhumanist overseer",
	"Detective",
	"Bartender",
	"Botanist",
	"Chef",
	"Janitor",
	"Assistant"
)


var/list/security_positions = list(
	//"Head of Security",
	"Chief Security Officer",
	//"Detective",
	"Security Officer"
)


var/list/nonhuman_positions = list(
	//"AI",
	"Cyborg",
	"pAI"
)


/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))

/proc/GetRank(var/job)
	switch(job)
		if("Bartender","Chef","Janitor","Assistant","Unassigned")
			return 0
		if("Botanist","Hydroponicist","Medical Doctor","Atmospheric Technician","Geneticist", "Virologist", "Surgeon", "Emergency Physician", "Psychiatrist")
			return 1
		if("Cargo Unit","Chemist", "Engineer", "Machinist", "Roboticist", "Security Officer", "Forensic Technician","Detective", "Scientist","Unit", "Xenobiologist", "Plasma Researcher","Chief Medical Officer", "Chief Psychiatrist")
			return 2
		if("Research Director","Head of Security","Chief Engineer","Chief Security Officer")
			return 3
		if("Shift Supervisor","Transhumanist Overseer","Wizard","MODE")
			return 4
		else
			message_admins("\"[job]\" NOT GIVEN RANK, REPORT JOBS.DM ERROR TO A CODER")
			return 2