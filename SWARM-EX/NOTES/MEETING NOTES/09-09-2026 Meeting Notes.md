Action items

Ground Station

- Fix/replace GS PC 
	- need to come up with tentative deadline to pick an architecture
- Get the prior GS PC issue list from Adhi and Dhruva and propose it to Steven Harrison.
- Migrate/port HFSS from the small computer to the big computer in room 443.
- Stand up a free machine from 443 as interim dev box while the "real" GS PC is being sorted, with intent to migrate later.
- Finish raising the antenna 
	- we have approval now
	- when do we want antenna raised? what is the criteria for that?
		- safety precautions outlined by Rick, motor test procedure (Edin)
- Verify lightning arrestor installation (inline with RF system) — confirm with building manager it's complete.
- Calibrate rotors.
- Get az/el tracking working correctly.
- Set up Doppler correction and TLE-based tracking (Gpredict, Celestrak) — assign/follow up with Elsa.
- Demonstrate the GS can track another LASP satellite (tracking capability proof-of-concept before MAXWELL).

Radio / Comms Chain (Lithium ↔ Hydra)

- Get Lithium radio talking to Hydra — this is the blocking dependency for both SCT and CET tests this semester.
- Brian Hilten is the contact for this...
	- how will this process work
- Continue Hydra telemetry/command work — command dictionary implementation is still in progress.
- 🟢 Re-run/re-verify the Hydra ↔ GNU Radio (VM) link Dhruva previously demonstrated (Hydra decoding a packet transmitted from a separate Lithium radio/laptop) — per Dhruva, "it might have changed now," so treat as unverified until confirmed on current setup.
- 🟢 Document the SWARM-EX-specific packet handling difference: Hydra strips AX.25 itself for SWARM-EX packets (unlike MAXWELL, where this was handled differently) — this needs to be written down so it isn't lost/re-discovered later.
- 🟢 Pull the documentation Dhruva referenced in "07 Communications" on the drive — expect it to be limited/incomplete, so treat as a starting point, not a full spec.
- 🟢 Locate the detailed packet-breakdown doc Dhruva mentioned (in the drive, used for debugging) and link/copy it into comms docs.
- Sync with CDH — per Dhruva, CDH needs the Lithium/Hydra packet structure figured out before they can request use of it; schedule a working session with CDH to nail this down since it's a cross-subsystem dependency.
- Follow up with Dhruva directly if the above documentation is insufficient — his answers were from memory and flagged as possibly outdated.

Antenna

- Resolve the dipole antenna vs. solar array conflict — get design decision finalized.
	- structures may have a change that will allow for no change to ISIS antenna
- Determine where Gabe left off on the UHF "hat" antenna work; get details from Dhruva.
	- does the hat exist/is already manufactured?
- Confirm conclusion that a UHF hat antenna is required for SWARM-EX testing (vs. dipole) and scope that design work.
- Follow up with Edin Choi on antenna/signal-management analysis if antenna design changes.
- Clarify UHF frequency alignment issues noted during tape-measure-antenna testing.

Systems:
- shehan trying to tie in requirments with tests
	- check in on this

Testing Roadmap (SCT / CET)

- Push toward SCT-2 (and stretch goal SCT-3) test completion this semester.
- Get comms ready for CET (command execution test), radio + Hydra in the loop, level 2/3.
- Plan for Day-in-the-Life (DITL) test comms readiness (post-PIR consideration).
- Track flat-sat comms subsystem bring-up — confirm all components are set up and can run simultaneously with the rest of flat-sat.

Team / Process

- Confirm team member status/availability: Shehan (crosslink work), Dhruva, Rick.
- Onboard/assign Edin Choi to antenna analysis work.
- Get documentation started/organized — notes flag "lack of documentation" as a top risk for COMMs since a lot of institutional knowledge is undocumented.
- Fix the Slack (channel/workspace organization for comms team: Skai, Boaz, Alex Byrnes, Rick, etc.).
- Set up recurring architecture discussion with the comms group to align on GS PC architecture decision.
- Attend/host the recruiting session on the final Monday of August; try to get a debrief afterward.
- Track division of labor: Justin (Hydra/Lithium), Elsa (GS tracking/Doppler software), Edin (antenna analysis).

Dependencies / Risks to Watch

- MAXWELL's February delivery could pull shared resources (GS, radios, personnel) away from SWARM-EX — monitor for schedule conflicts.
- SCT/CET both blocked on the same Lithium↔Hydra link — this is your critical path.
- Grafana dashboard exists now — worth checking if it's being used to track comms status/telemetry already, to avoid duplicating monitoring effort.

Brandon
- get update tohim how x band modulates
	- seems to depend on cones

All hands
- couple more things for structures, may not need the antenna change


rick talk
- bad news on the pc end ig 
- what needs to happen for antenna raise?
	- everything we need to do to never take it down again
	- weather proofing, locktite?
	- think of everything that is pain in the ass in the future
	- better zipties
	- connecting coax, coax seal on everything
	- install antennas
		- reverify them
	- rubber things around yaesu controllers are okay?
	- lightning arrestors, mounting LNAs (bracket etc u bolts)
- buying cables
	- rs232a
		- in 443 somewhere???
	- usb ethernet convertor?
	- ideally find on amazon or digikey or mcmastercarr, then rick buy

break down tasks more
- running practice mct
- for these kinds of tests:
	- break down further with day of laying everything on table and veryfying everything
	- come back next day and execute test
- update the gs pc debacle
- incporate thinking and reflecting time?