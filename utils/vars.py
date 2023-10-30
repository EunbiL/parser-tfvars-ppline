POD = r"(GEP|SMP|WKP|EXP|INP)"
OPCO = r"(AGO|AFA|MUP|SVC|AIT|MGT)"
ENV = r"(PROD|PPRD|DEVS|DEVT|NONPROD|SYNC|HTBT|MGMT)"
EXP = r"(INT|EXT)?"
CLASS = r"(PIC|SEC|SRV|C|S)?"
APPCODE = r"([A-Z0-9]{1,6}(_(PAD|Data|Pres|Application))?|([a-zA-Z]+))?"
ID = r"(01|02)?"
LS = r"LS"
GEP_APPCODE = r"([A-Z0-9]{1,6}(_(PAD|Data|Pres|Application)?))?"
Segment_Pattern = fr"^{POD}_{OPCO}_{ENV}_{EXP}_?{CLASS}_?{APPCODE}_?{ID}_?{LS}$"

EXP = ["EXT","INT"]
CLASS = ["PIC","SEC","SRV","C","S"]
