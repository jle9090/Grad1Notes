**Scope of work**
* managing tasks that COMMs needs for swarm ex
**Identifying key tasks**
* managing the team
* continuing ground station bringup
* moving towards enabling SCT and CET tests for SWARM EX
	* hydra needs to talk to lithium radio (more me)
* antenna work to enable testing with SWARM EX

why all these^
- team is actually fairly large this time around, 3 on swarm ex, 2 on maxwell, to track work being done
- ground station will need to be up for maxwell eventually, and then swarm ex
- sct and cet for the stage of project moving to validate the project
- 

**Estimating amount of work required**
* with ~10 hours a week potentially ~15 hours a week

**Estimated deadlines**
* we want SWARMEX in a position to be ready SCT and CET by end of semester
* want ground station be in state of minimal operation for MAXWELL launch
**Resources**
* software
	* gnu radio
	* hydra 
	* gpredict
* ground station hardware
	* gnd pc
	* entire tx rx chain
* sat hardware
	* lithium radio
	* antennas


As I move into the positon of COMMs lead on SWARM EX, I will be responsible for outlining and scoping work that will need to be done and tracking it. Key tasks for this semester that COMMs shall seek to work on is the continuation of the ground station bringup and work towards SCT and CET tests for SWARM EX. This involves raising the GS antennas and configuring the station to be able to track other satellites to verify the capabilities for the SWARM EX mission. There will also be work towards satellite testing in SCT and CET, these also have work items such as getting the Lithium radio to communicate with Hydra and work on the antenna where Gabriel Burdan last left off. I will be responsible for tracking these tasks as our team works on them, and monitiring for blockers as well.

* GND Station Bring up
	* The ground station should be operational for MAXWELL launch
	* Antennas are raised, station can track other sats
	* Station can be used for SCT tests
	* using gnuradio, hydra, gpredict
	* before maxwell launch
	* ~ 60 hours
* SCT 2 Test
	* pushing for SCT testing and continue verification of requirements. Potentially aiming for SCT 3 as well this semester.
	* Lithium 2 radio, gnu radio, hydra
	* ~40 hours
	* by end of semester
	* dependent on getting the lithium to talk to hydra
* CET Test, comms side
	* seeking for comms to be ready for CET testing
	* Lithium 2 radio, gnu radio, hydra
	* by end of semester
	* dependent on getting the lithium to talk to hydra
	* ~40 hours

Regarding risks for this, I forsee a lot of risks in lack of documenation. There is a lot of information and knowledge within COMMs that tends to be obscure and not well documented. This can cause delays and blockers when something is not well understood. I also anticipiate risks in regards to MAXWELL's launch, MAXWELL is being hopefully out the door by February and and any resources that it demands could potentially impact SWARM EX for the semester.


**Division of work**

**Justin**
- hydra and lithium
**Elsa**
- gs tracking software side (doppler, tracking)
**Edin**
- antenna analysis.... if it changes 


Also HFSS port from small computer to big computer in 443
One PC was hydra, and does all hydra, seperate PC, gnu does it all 
consolidating gnuradio
tentative
2 PCs
hydra and gnu, gnu is static, 
adhi and drhuva - did you ever have a list of ground station pc issues that should be proposed to steven harrison?
as a whole for the comms chat (skai, boaz, alex burns, rick for funnies)  we need to have a architecture of what we envision the ground station to be. rick initially proposed having 2 pcs, one running a static gnu that will accomodate for maxwell and swarm ex and another dedicated to running hydra. we need some path forward on how this will work. we also want a list of the issues we previously encountered on the ground station pc currently in stig from (adhi and dhruva)

ideally we seek to ship off the ground station pc to do the thing it needs to do, in the meantime use one free machine from 443 to continue developing with the intention that it will be eventualy be put on the final ground station pc setup

**Those who have only hunger**
- making gnu modular enough for maxwell, swarmex, lots of software right now
- hardware in a state to be testing 