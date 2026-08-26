**From Lectures**
Comms notes
* level 2 and 3 cet (radio and hydra in loop)
* day in the life test
* 2 onboard radios
	* astro dev li 2 (UHF) - uplink, downlink, crosslink
	* blue cubed blue fin (xband) - downlink only 
		* just to get sci data down
	* UHF (401)
		* gnu radio flowgraph tested and working
		* hydra telem command in progress
			* command dictionary implementation onging
	* X band (8030 MHz)
	* Ground Station
		* X-band ground station
		* gs pc is in ruins...
* flat sat progress
	* all components working
	* coms bs
	* all need to be simaltaneously set up
* PIR - pre integration review, early 2027
	* 5 tests
		* CET - command execution test
		* GNC - gnc verification
		* **SCT - simulated comms test**
			* interested in this one
		* CCCT - complete charge cycle test
		* DITL - day in the life test
* Post PIR plans
	* sat assembly
	* enviromental testing
	* LAUNCH
* COMMs
	* construct uhf gs
	* software
	* test antenna
* todos:
	* ground station
		* contact alex byrnes
		* rotors?
		* ground pass?
		* gs pc is cooked
		* what we still have left to do?
	* on sat
		* gabe put some work into hat stuff
		* still in contact, more hat stuff
		* primary conclusion is: we NEED a uhf hat for swarm ex testing
			* making a hat for a dipole shall be weird
		* lithium is okay?
			* maxwell said they had wierd things with temp
				* to validate that those are okay on that front
		* skye glasner also doing ground station work
		* rick will be around
	* shehan?
		* alive?
		* crosslink
	* dhruva is alive
	* Edin Choi - guy i need
		* army soldier in korea
		* signal management
	* final monday of august is recruiting session
		* try to get debrief
* SWARM EX dipole antenna switch? conflicts with solar arrays
* MAXWELL radio inspection?
* how tf is MAXWELL tracked

Agenda
Intros - also shehan exists

GND status?
* what tests done and what still needs to be done
* can GND track any sat?
* demonstrate downlink and uplink?
MAXWELL status?
* radio inspection following TVAC
* how is maxwell tracked?
* post TVAC steps
SWARMEX status?
* dipole antenna debate
* 5 tests we seek for the year
	* CET - command execution test
	* GNC - gnc verification
	* **SCT - simulated comms test**
		* interested in this one
	* CCCT - complete charge cycle test
	* DITL - day in the life test

What work do we want this semester?

Spring left off
* hardline testing
* then do it over the air
* can we do it furhter away?
	* SCT
	* where summer work starts
	* GND PC
* comms with UHF antenna small wise, can we do with tape measure antenna
	* actual UHF antenna
	* freqs weren't aligning - clarify
	* move to overlook, comms with that
	* with flight bus and lithium radio
* can we run in TVAC
	* building the hat
	* down to TVAC
	* lost more attentuation than expected
		* overwhelming SDR
	* changed GNU radio a lot
		* much more tuneable
	* weird freq shifts when lithium is hot (rx offset can address it)
	* when assembling there was a wrong fastener used
		* surface damage? crack?
		* Boaz needs to evaluate it
	* FFT script edited
		* full functional test
		* did softare read packet sent back
		* can send it, cant quite hear it back
			* hydra issue?
		* new block in gnu 
		* skai to coord with Boaz about drops due to impact
* ongoing
	* to raise antenna, needed approval from boulder
		* OIT
	* issues with part of roof is part of another company
		* real state services
		* intermod analysis was needed
		* random invoice was sent, but antennas can be set up
* GND
	* raise antenna
		* all clear
	* future scts
	* adding in doppler
	* getting azel lined up
	* clestrek
		* TLEs
		* Gpredict
		* 
* GNU radio dev
* MAXWELL Sat work
* GND PC
	* laptop for hydra
		* hydra crashes
		* talk with LASP
	* go back to hydra on pc, gnu on pc, back to IP
* calibrating rotors
* lightning arrestors
* prev talked to building manager
	* arrestor installed inline with RF system
* PRIOS for maxwell
	* mast up
	* doppler working
* Gabe building RF hat for swarm ex?
* both sats fly with 2 radios
	* UHF - all uplink and critical downlink
	* X band - only downlink, most data down an sci telem
* approach Palo after say 30 days after we bring up work
* there is a grafana dashboard now
* MAXWELL
	* no xband at tvac
		* b/c without PLDC (FPGA) cant control the radio
	* Stay up to date with AFRL
	* logisctics of x band dish here?
		* according to Palo
* gs laptop
	* at stig
* immidiate next steps
	* SCT
	* demonstrate tracking for some lasp sat