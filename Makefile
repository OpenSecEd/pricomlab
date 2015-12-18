CATEGORY= 	security/labs
DOCUMENTS= 	pricomlab.pdf
FILES= 		pricomlab.tex aims.tex literature.tex literature.bib

PACKAGE= 		pricomlab-src
TARBALL_FILES= 	${FILES} Makefile

PUB_FILES= 	${PACKAGE}.tar.gz ${DOCUMENTS}

pricomlab.pdf: ${FILES}

clean:
	${RM} ${DOCUMENTS}


literature.bib: ../infosec.bib
	ln -s $^ $@

TARBALL_FILES= 	${FILES} Makefile

clean:
	${RM} literature.bib ${DOCUMENTS}


### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/package.mk
include ${INCLUDE_MAKEFILES}/miun.course.mk
