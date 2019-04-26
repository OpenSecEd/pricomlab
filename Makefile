FILES= 		pricomlab.tex abstract.tex contents.tex pricomlab.bib

.PHONY: all
all: pricomlab.pdf


pricomlab.pdf: ${FILES}
pricomlab.pdf: bibsp.sty


.PHONY:
clean:
	${RM} ${DOCUMENTS}


### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
INCLUDE_BIBSP=bibsp
include ${INCLUDE_BIBSP}/bibsp.mk
