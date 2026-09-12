MCT — Minimum Communications Test

The earliest comms milestone, done on the FlatSat before formal flight software existed — basic hardware/software handshake checks between CDH/GNC and every spacecraft interface (Li-2 radio, XACT ADCS, EPS, FIPEX, i-Sense, GSE, UHF AntS temp sensor, SD/RTC/EEPROM), using standalone test scripts rather than the real FSW.
- Defined/discussed in: .../CDH117-Flight_Software_ICD_SWARM-EX.docx (§7.1), CDH108-MAXWELL_Flight_Software_Transition_Plan_SWARM-EX.docx, CDH111_A-PocketBeagle_ICD_SWARM-EX.docx
- The dedicated procedure docs it references — INT101 and INT102 "SWARM-EX Minimum Communications Test Procedures" — aren't present anywhere in this dump, so you'd need to pull those from Drive/GitLab separately.
- Presentation context: 10.0 Command and Data Handling/Presentations/Spring 2022 TIM.../CDH110-...pptx and 7.0 Communications/7.7 Technical Interchange Meetings/.../COM108-Spring_2022_TIM_02252022_SWARM-EX.pptx (PocketBeagle was the first component to complete MCT).

SCT — Simulated Communications Test

The formal 4-tier PIR-gate test verifying the full uplink/downlink comms chain (UHF only — X-Band and crosslink are tested separately). Full procedure at 7.0 Communications/7.13 Simulated Communications Test (SCT)/SYS 105- Simulated Communications Test (SCT) Procedure.docx:
- SCT 1 – hardwired CDH↔Hydra link, no RF (procedure detail also in 7.0 Communications/7.12 UHF COMMs/Maxwell References/SCT-1/Wired CDH to HYDRA Simulated COMMs Test Procedure.docx)
- SCT 2 – full chain minus antenna, Li-2↔SDR hardline
- SCT 3 – antenna integrated, short range (COSGC ground station, parking garage)
- SCT 4 – same as SCT 3, long range
- Success criteria: >90% command success probability, ≥9600 bps up/down, uplink CCSDS encryption verified, link closure both directions.
- SCT 1's full opcode-by-opcode command/response validation table (100% pass as of the doc) is in that same procedure file.
- Related: .../Maxwell References/test procecures/SCT2 Procedure.docx/.pdf, SCT Working Doc.pdf, SCT-1/SCT1_tlm.docx.

Hydra + Lithium (Li-2) radio

- Hydra internals: 7.0 Communications/7.12 UHF COMMs/Maxwell References/Hydra/MAXWELL_HYDRA_for_dummies.docx explains the folder structure — Config/radio.xml (uplink/downlink packetization logic — the key file to edit), Config/keywords.xml (port numbers, e.g. INSTR_SERIAL_PORT), Config/cmd_details.xml/states.xml/tlm_details.xml (opcodes/telemetry), the Encryption_module (AX.25 + fletcher16 checksum), and Rundirs (per-session logs: rawradio/ccsds/payload files).
- Radio mode vs. Hardline mode: toggled in init.prc by commenting/uncommenting setup_radio.prc vs setup_hardline.prc — Radio mode drives the Li-2 over RF/GNU Radio, Hardline mode talks direct serial for bench testing. Walkthroughs: GND206 SWARM-EX Hydra Radio Mode Test.docx and GND204-Olin_Hydra_Hardline_Test_SWARM-EX.docx (both include exact hex byte streams for dump_param(0) and issue_realtime_hk_pkt() request/response verification).
- Hydra versions/installers: 13.0 Ground Station/2.0 Hydra/ (Hydra_1.14, Hydra_1.15, Hydra_Users_Guide.docx, How_to_USE_CET_Automation_Script_in_Hydra.docx); latest working backup per 7.0 Communications/7.14 Hydra Backups/README.docx is the 04252025 build (CDH hardline interface fully implemented; EPS/FIPEX/i-Sense/ADCS interfaces mostly working; known issue: TCP/IP ports not opening for GNU Radio connection in that version).
- Li-2 radio hardware/software setup: 7.0 Communications/7.6 Li-2/Lithium setup instruction/Lithium Setup Instructions.pptx — physical mounting (spring pins), power supply settings (10.0V, 0.80A current limit), attenuator use, then ConfigurationProgram3pt10/4pt01 to open the COM port and read firmware rev (should read "3.21"). Manuals: LithiumII-User_Manual_01122017.pdf, Radio_Interface_Manual_10222021.pdf, Li_2_Verification_Document.pdf. Firmware images in Li-2 Firmware/.
- Acceptance testing: COM103-Li-2_Acceptance_Testing.docx and 7.6 Li-2/Acceptance Testing/Li-2 Acceptance Testing, Rev2, 2021-10-22.xlsx.