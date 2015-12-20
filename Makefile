DOCUMENTS= 	pricomlab.pdf
FILES= 		pricomlab.tex aims.tex literature.tex pricomlab.bib

pricomlab.pdf: ${FILES}
pricomlab.pdf: llncs biblatex-lncs

.PHONY:
clean:
	${RM} ${DOCUMENTS}


### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
