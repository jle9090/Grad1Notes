Last updated: 2026-10-23

## How to use this file

- Check a box `[x]` when the item is done.
- Tag `#blocked` on anything stuck, with a short reason after it (e.g. `#blocked waiting on Steven Harrison`).
- Tag `#in-progress` on anything actively being worked.
- Leave unchecked + untagged for anything not yet started.
- Owner in `()` after the item where known. Add one when you pick something up.
- Pull new items in here as they come up in meetings instead of leaving them buried in meeting notes — this file is the single source of truth for open work.

---

## This week (10/19–10/25)

### Done since last update (10/14)
- SCT-1 full run done Thu 10/22 with Saanika — commands acknowledged
	- Bench setup, practice run-through, and troubleshooting done
	- 3 commands missing from Hydra (0x51 schedule, 0x54 read command queue, 0x57 flush command queue) — Saanika says they weren't implemented yet, probably lost with the Hydra git issues — see [[SCT1 Notes]]
	- CDH has since made and implemented the 3 commands, and they've been run — SCT-1 complete
- Met with Rainville about his new program replacing GNU Radio — [[Rainville Notes]]
	- Clean-sheet reimplementation using the GNU libraries, installed through radioconda, opens network ports to connect to
	- Hydra is still the same; we were added to his repo
- SCT-2 hardwiring will be SMA straight with a 40 dB attenuator
- GS PC is working (Palo/Rainville)
- Mid-semester review and peer evaluations submitted
- LNA mounted on the roof; lightning arrestors being installed
- Found the exact location of the ground station
- Heard back from Scott Gennari (Elsa is talking with him) and Rick's LASP contact; contacted Landon/Spencer about antenna raising; Rick sent the safety list

### Focus this week
- [ ] Review SCT-2 procedure (Gantt: 10/23–10/26)
- [x] Implement the 3 missing SCT-1 commands in Hydra — CDH made and implemented them, already run
- [ ] Tag up with Jordan on how CDH and Hydra were updated
- [ ] Poke around Rainville's repo ahead of SCT-2

### Schedule changes
- SCT-2 "Reverify GND station setup" replaced with reverifying Hydra's connection with both GNU Radio (11/6) and Rainville's new program (11/9–11/10) — waterfall and Gantt updated, end date unchanged
- Motor interface still broken, blocked on Palo troubleshooting — motor tests, Gpredict TLE tracking (11/5), Gpredict interface (11/12), sat tracking (11/20), and antenna raising (11/16) pushed 2 weeks
- Verify GS PC in comms chain moved to the week of 11/2 — GS PC works, now waiting on the ground station being up while MAXWELL does vibe testing

---

## Management
- [x] Fixing waterfall chart to incorporate the target dates
- [x] Quad chart + waterfall update (10/9)
- [x] Mid-semester review: PPT + 10 min recording due 10/14, peer evaluations due 10/21 — both submitted
	- [ ] Waterfall marks the review as re-baselined to the week of 10/26 but it is due 10/14 — fix the marker
- [ ] Re-baseline the Ground Station PC Architecture waterfall rows (laptop setup, connecting laptop + 443, planning final architecture) — Palo and Rainville now own GS PC bring-up, my role is verifying it in the comms chain (re-baselining needs Palo's approval)

## Ground Station

### GS PC / lab machines
- [x] Decide GS PC architecture (Rick's 2-PC proposal — static GNU Radio box for MAXWELL+SWARM-EX, dedicated Hydra box — vs. current setup)
	- [x] Professor Palo assessing the state of the lab machines — all GS PC work was on hold 9/23–9/29, resumed 9/30
	- [x] Sit down with Palo (and Rick) on the machine situation
	- [x] Palo and Nicholas Rainville are bringing up the STIG GS PC — route all GS PC needs through them — working as of 10/23
	- [x] Still want a usable machine on the side — use the spare laptop?
- [x] Write ground station doc for Palo
	- [x] Include the ground station PC in STIG
- [x] Get prior GS PC issue list from Adhi and Dhruva, propose to Steven Harrison #blocked Steven Harrison reportedly unwilling to help
- [x] Migrate/port HFSS from small 443 machine to big 443 tower — Palo hold lifted 9/30 (Gantt: 9/30–10/1)
	- [ ] see palo and rainville note
- [x] Stand up interim dev machine from 443 while GS PC situation is sorted — Palo hold lifted 9/30
- [ ] Ground Station PC test — revised 11/2 (planned 9/23) — GS PC is working, date depends on when the ground station is up and running
	- [ ] Verify the GS PC in the comms chain at the ground station once Palo/Rainville have it working (Justin) #blocked waiting on the ground station being up and running — end of October or early November while MAXWELL does vibe testing (Gantt: 11/2–11/6)
	- [ ] ~~Set up laptop for GND station (Gantt: 10/2–10/12)~~ — dropped, GS PC bring-up is Palo/Rainville's
	- [ ] ~~Connect laptop and 443 machine (Gantt: 10/13–10/16)~~ — dropped
	- [ ] ~~Plan final GND station architecture (Gantt: 10/26–10/27)~~ — dropped, Palo leads
	- [ ] Finish STIG ground station PC doc #in-progress
- [ ] ~~Update GNU Radio to latest version, first pass at what state it's in for SCT-2~~ — dropped, Rainville's program replaces GNU Radio

### Antenna raising / rotors
- [ ] Raise the antenna (Edin) — target mid November, Gantt 11/16 (was early November, ~Oct 13, originally ~Sept 29)
	- Delayed — rooftop work (LNA, lightning arrestors, antenna installs) starting much later than expected; may slip further
	- [ ] Rooftop prereqs: LNA install, lightning arrestors, antenna installs (Gantt: 9/23–10/1) #in-progress — LNA mounted, arrestors being installed, antennas not installed yet (10/23)
		- [ ] Verify lightning arrestor install with building manager
			- [x] Never installed — Edin needs to locate them, work with COSGC building manager #blocked arrestors not found yet
			- [ ] arrestors being installed #in-progress
		- [ ] Weatherproofing: better zipties, coax seal, Loctite
	- [ ] Execute motor tests (Gantt: 10/2–10/12)
		- [ ] Fix motor interface — motors power on, but the interface is broken #blocked on Palo troubleshooting — Gantt pushed 2 weeks (~11/4); blocks all sat tracking attempts
			- Edin has made progress on figuring out bring-up needs
			- Asked Scott Gennari (LASP) for help
			- Elsa is talking with Scott Gennari
		- [ ] Safety precautions (Rick)
			- [x] Should we get a list of these? — Rick sent the list
		- [x] Motor test procedure (Edin)
		- [x] Get motor configuration cable
	- [x] Check remaining things needed to raise antenna
	- [x] Reach out to LASP contacts about antenna raising — Landon first, then Spencer (structures), Dr. Palo
	- [x] Reach out to Fedor about RS232 cables for testing
- [ ] Calibrate rotors
- [ ] Get az/el tracking working correctl
- [ ] testing the final ground station setup
- [ ] antenna tests
	- [ ] SCT3 tests functionality
		- [ ] what other things to look into testing?
	- [ ] gs pc test
		- [ ] when will maxwell be free with the GS PC?
			- [ ] vibe in november
			- [ ] meeting wednesday

- [x] Buy cables: RS232A, USB-ethernet converter (Rick to purchase)
- [x] Contact Alex Byrnes re: rotors/ground pass support

- [ ] ~~reach out to systems if we just need hands for ground station PC bring up~~ — dropped, GS PC is working
- [x] email Scott Gennari at LASP for ground station expertise — contacted about antenna raising and motor interfacing
	- [x] Follow up on Scott's response — Elsa is talking with him
### Tracking / end-to-end
- [ ] Set up Doppler correction + TLE tracking (Gpredict, Celestrak) (Elsa) — pushed back behind the motor interface fix (Gantt was 9/24–10/7)
	- [x] Confirm with Elsa whether Doppler correction should live in GPredict instead of GNU Radio
	- [ ] Gpredict tracking with TLEs (Gantt: 11/5–11/11) #blocked motor interface not functioning
	- [ ] Interface Rainville's program (was GNU Radio) with Gpredict (Gantt: 11/12–11/18) — GS PC side goes through Palo/Rainville
		- [ ] With Rainville's program: find how Gpredict exports Doppler (GNU block or another network port) to feed it in — see [[Rainville Notes]]
- [ ] Test satellite tracking (Gantt: 11/20–12/7) #blocked motor interface not functioning
- [ ] Demonstrate GS can track another LASP satellite (proof-of-concept before MAXWELL)
- [ ] Demonstrate full uplink/downlink end-to-end
- [x] talk to palo about the motor interfacing issues 
	- [ ] palo looking into debugging #in-progress
	- [ ] i want motor decision end of the week of oct 19th — no decision as of 10/23, still blocked on Palo
	- [ ] looking into previous proven interfaces
- [x] Rick has lasp contact for GS setup, be sure to look into this for Edin and Elsa
	- [x] waiting on rresponse, i have followed up once — responded
		- [x] poke rick to poke him

### Coordination
- [x] Reach out to Skye Glasner to coordinate GS work, avoid duplicate effort
	- [x] Fri 10/2: check with Skye whether she got a chance to work on it — contacted

## Radio / Comms Chain (Lithium ↔ Hydra) — critical path for SCT & CET

### Hydra / tests
- [x] Get Lithium radio talking to Hydra (Justin) — blocks both SCT and CET tests
	- [x] Hydra hardwired directly to Li-2 — commands working
	- [x] Hydra → CDH → Li-2 (CDH still needs to be in the loop) — working as of 10/8 MCT run
		- [x] Work with CDH to fix how the command byte is read in — root cause was TX/RX swapped on the CDH board FTDI
- [x] Re-run MCT — revised 10/5 (planned 9/21) — ran Thu 10/8 with Saanika, commands acknowledged correctly
	- [x] Saanika review
	- [x] Review MCT test docs
	- [x] Hydra development
	- [x] MCT bench setup
	- [x] Practice run-through
	- [x] Full run-through
	- [x] Troubleshooting (Gantt: 10/7)
	- [x] Update MCT documentation
	- [ ] Return 30dB attenuator (borrowed from ground station for MCT) when done — currently in the comms box at 443 — keeping it for SCT-2
- [x] Re-run SCT-1 — revised 10/20 (planned 9/30) — full run 10/22, missing commands implemented by CDH and run
	- [x] Review SCT-1 test docs (Gantt: 10/8)
	- [x] Practice run-through with CDH to find what's missing
	- [x] Develop Hydra for SCT-1 (Gantt: 10/9–10/15)
	- [x] Bench setup (Gantt: 10/16), practice run (10/19), full run (10/20–10/21), troubleshooting (10/22) — full run 10/22 with Saanika, commands acknowledged
	- [x] 3 commands are missing, see SCT1 notes — CDH made and implemented them
	- [x] re implemented and run the test
	- [ ] Tag up with Jordan on how CDH and Hydra were updated
- [ ] Develop Hydra for SCT-2 (Gantt: 10/27–11/2; SCT-2 full run 11/17–11/20)
- [ ] Reverify Hydra connection with both GNU Radio and Rainville's new program for SCT-2 (Gantt: 11/6, 11/9–11/10) — includes the Hydra ↔ GNU Radio link Dhruva previously demoed
- [ ] Look into the new GNU from MAXWELL side, there is a recording from Rainville apparently?
	- [x] Met with Rainville — [[Rainville Notes]]
	- [ ] possibility of this running locally?
		- Uses radioconda, installs in 1 or 2 commands
- [ ] SCT2 proceudre drafting, setups, adding lithium and b200 setups
	- Hardwired SCT-2 is SMA straight with a 40 dB attenuator
- [x] are we re running commnands from SCT1 — yes, SCT-2 runs them, and so do all later SCT tests
- [ ] ~~Continue Hydra command dictionary implementation~~ — dropped, no longer needed
- [ ] Check what package Hydra receives
- [ ] Clarify "once you define H2S, Lithium no more" note with Dhruva
- [x] Contact Brian Hilten, clarify process
- [ ] palo and rick over at space grant ground station at some point to check things out?
	- [ ] pointing things out
### Lithium / hardware
- [x] Confirm Li-1 supply voltage (marked "?" at 7V) and Li-2 (10V) against absolute max ratings in Li-1 User Manual
- [x] Locate 30dB attenuator and an antenna
	- [x] In Palo's office
- [x] Go through Lithium breakout manual, especially absolute max ratings
- [x] Resolve Safe2Mate pinout mismatch (10 vs 14 vs 6 pin) — ask Alex or Saanika
	-   ] This will require documentation updates
- [x] Find CDH UART connector location / pin layout of CDH board
	- [x] Altium — see Adhi's message
- [x] Get CDH pin diagram from Alex, or ask Saanika
- [ ] ~~Obtain MAXWELL's Hydra and GNU Radio setup for SCT testing~~ — dropped, Rainville's program replaces GNU Radio
- [ ] Start assembling a list of cables needed for the Lithium for Isaac (structures) #in-progress
	- [x] Compile flight cabling from the project dump — [[Li-2_Flight_Cabling_Summary]]
	- [ ] Resolve the open conflicts in the summary (MCX vs MMCX, BP1/H1 vs BP4/H4, 7-pin vs 15-pin, RF cable length)
	- [ ] Send the list to Isaac

### Packet structure / docs
- [ ] Sync with CDH on Lithium/Hydra packet structure
- [ ] Review packet structure doc ("packet structure – SWARM_EX_Dhruva")
- [ ] Locate and link the detailed packet-breakdown doc from the drive
- [ ] Document SWARM-EX-specific AX.25 handling (Hydra strips it, unlike MAXWELL)
- [ ] Pull/organize "07 Communications" docs from the drive
- [ ] Follow up with Dhruva if documentation proves insufficient

### MAXWELL reference
- [ ] ~~Play with MAXWELL GNU Radio setup for reference~~ — dropped, Rainville's program replaces GNU Radio
- [ ] Find MAXWELL pictures (not in SharePoint)

## Antenna

- [ ] Determine where Gabe left off on UHF "hat" antenna work; confirm with Dhruva if manufactured
- [ ] Clarify UHF frequency alignment issues from tape-measure-antenna testing
- [x] Resolve dipole antenna vs. solar array conflict (structures may have a fix avoiding the change)
- [x] Confirm/scope UHF hat requirement vs. dipole
- [x] Follow up with Edin Choi on antenna/signal analysis once design settles

## Systems / Cross-team

- [ ] Check in on Shehan's crosslinks
- [ ] Confirm Shehan's status/availability for crosslink work #blocked only 1 Lithium radio available for crosslink testing
- [ ] Check in on Luke Mathews' requirements review
- [ ] sanskar milestone tracker, SCT needs to get split into their respective stages
- [x] Get Steve Taylor's contact re: permissions
- [x] Contact ISIS about antenna material properties/CAD for Landon

## Team / Process

- [ ] Organize COMMs documentation (flagged as top risk — undocumented institutional knowledge)
- [ ] ~~Set up recurring architecture discussion to settle GS PC decision~~ — dropped, GS PC is working
- [ ] Write end-of-semester transition document (docs index, explanations, member list)
- [ ] Decide whether Atharv takes on on-sat work
- [x] Onboard Edin Choi onto antenna analysis work
	- No longer doing that
- [x] Fix Slack channel/workspace organization for comms team
- [x] Give Atharv the SWARM-EX and ground station block diagrams
- [x] Edin and Elsa fill out when2meet

### New members
- Ian Li — systems
	- Looking into writing SCT and CET procedures
- Atharv — potentially doing on-sat work?
- Muthur - on sat work?

## Dependencies / Risks to Watch

- MAXWELL's February delivery could pull shared resources (GS, radios, personnel) from SWARM-EX
- SCT and CET both depended on the Lithium ↔ Hydra link — hardwired path through CDH now works (MCT 10/8); the over-the-air path for SCT-2 still needs the GS PC
- Grafana dashboard exists — check if it's already tracking comms status/telemetry before building new monitoring
- we may not have liscenses for crosslink broadcasting
	- palo has more details
	- internationa amateur dissaproves of our x band transmitter
	- and crosslink is amateur
- Li-2 antenna max input may be 0.5 W while the Li-2 can output up to 2 W — needs verifying (from [[Li-2_Flight_Cabling_Summary]])
