Last updated: 2026-09-23

## How to use this file

- Check a box `[x]` when the item is done.
- Tag `#blocked` on anything stuck, with a short reason after it (e.g. `#blocked waiting on Steven Harrison`).
- Tag `#in-progress` on anything actively being worked.
- Leave unchecked + untagged for anything not yet started.
- Owner in `()` after the item where known. Add one when you pick something up.
- Pull new items in here as they come up in meetings instead of leaving them buried in meeting notes — this file is the single source of truth for open work.

---

## Ground Station

- [ ] Decide GS PC architecture (Rick's 2-PC proposal — static GNU Radio box for MAXWELL+SWARM-EX, dedicated Hydra box — vs. current setup)
- [ ] Get prior GS PC issue list from Adhi and Dhruva, propose to Steven Harrison #blocked Steven Harrison reportedly unwilling to help
- [ ] Migrate/port HFSS from small 443 machine to big 443 tower
- [ ] Stand up interim dev machine from 443 while GS PC situation is sorted
- [ ] Any issues with the GS pc and related to are blocked, Professor Palo wants to assess the state of the machines in the lab
- [ ] Raise the antenna (Edin) — target ~Sept 29
	- [ ] we are delayed
  - [x] Motor test procedure (Edin)
  - [ ] Safety precautions (Rick)
	  - [ ] should we get a list of these
  - [ ] Weatherproofing: better zipties, coax seal, Loctite
  - [ ] Verify lightning arrestor install with building manager
  - [ ] Get motor configuration cable (in transit)
- [ ] Calibrate rotors
- [ ] Get az/el tracking working correctly
- [ ] Set up Doppler correction + TLE tracking (Gpredict, Celestrak) (Elsa)
  - [x] Confirm with Elsa whether Doppler correction should live in GPredict instead of GNU Radio
- [ ] Demonstrate GS can track another LASP satellite (proof-of-concept before MAXWELL)
- [ ] Demonstrate full uplink/downlink end-to-end
- [x] Buy cables: RS232A, USB-ethernet converter (Rick to purchase)
- [x] Contact Alex Byrnes re: rotors/ground pass support
- [x] Reach out to Skye Glasner to coordinate GS work, avoid duplicate effort

## Radio / Comms Chain (Lithium ↔ Hydra) — critical path for SCT & CET

- [ ] Get Lithium radio talking to Hydra (Justin) — blocks both SCT and CET tests
- [ ] Contact Brian Hilten, clarify process
- [ ] Continue Hydra command dictionary implementation
- [ ] Re-verify Hydra ↔ GNU Radio link Dhruva previously demoed (flagged as possibly stale)
- [ ] Document SWARM-EX-specific AX.25 handling (Hydra strips it, unlike MAXWELL)
- [ ] Pull/organize "07 Communications" docs from the drive
- [ ] Locate and link the detailed packet-breakdown doc from the drive
- [ ] Sync with CDH on Lithium/Hydra packet structure
- [ ] Review packet structure doc ("packet structure – SWARM_EX_Dhruva")
- [ ] Confirm Li-1 supply voltage (marked "?" at 7V) and Li-2 (10V) against absolute max ratings in Li-1 User Manual
- [x] Resolve Safe2Mate pinout mismatch (10 vs 14 vs 6 pin) — ask Alex or Saanika
	- [ ] This will require documentation updates
- [ ] Find CDH UART connector location / pin layout of CDH board
- [ ] Locate 30dB attenuator and an antenna
	- [ ] in palo's office
- [ ] Follow up with Dhruva if documentation proves insufficient
- [x] Go through Lithium breakout manual, especially absolute max ratings
- [ ] Play with MAXWELL GNU Radio setup for reference
- [ ] Find MAXWELL pictures (not in SharePoint)
- [ ] Check what package Hydra receives
- [ ] Clarify "once you define H2S, Lithium no more" note with Dhruva

## Antenna

- [x] Resolve dipole antenna vs. solar array conflict (structures may have a fix avoiding the change)
- [ ] Determine where Gabe left off on UHF "hat" antenna work; confirm with Dhruva if manufactured
- [x] Confirm/scope UHF hat requirement vs. dipole
- [x] Follow up with Edin Choi on antenna/signal analysis once design settles
- [ ] Clarify UHF frequency alignment issues from tape-measure-antenna testing

## Systems / Cross-team

- [ ] Check in on Shehan tying requirements to tests
- [ ] Confirm Shehan's status/availability for crosslink work #blocked only 1 Lithium radio available for crosslink testing
- [ ] Contact ISIS about antenna material properties/CAD for Landon
- [ ] Get Steve Taylor's contact re: permissions
- [ ] Get CDH pin diagram from Alex, or ask Saanika

## Team / Process

- [x] Onboard Edin Choi onto antenna analysis work
	- [ ] he is no longer doing that
- [ ] Organize COMMs documentation (flagged as top risk — undocumented institutional knowledge)
- [x] Fix Slack channel/workspace organization for comms team
- [ ] Set up recurring architecture discussion to settle GS PC decision
- [ ] Write end-of-semester transition document (docs index, explanations, member list)
- [x] Give Atharv the SWARM-EX and ground station block diagrams
- [x] Edin and Elsa fill out when2meet

## Dependencies / Risks to Watch

- MAXWELL's February delivery could pull shared resources (GS, radios, personnel) from SWARM-EX
- SCT and CET are both blocked on the same Lithium ↔ Hydra link — critical path
- Grafana dashboard exists — check if it's already tracking comms status/telemetry before building new monitoring
