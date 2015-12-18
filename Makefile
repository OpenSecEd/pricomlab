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


# Yes, we thought that you might find this here ...
# - "Did they place this here on purpose?"
# - "Is this the real thing, or is this intended to mislead?"

key.jpg: key.png
	convert $^ -resize 500% -background white -alpha remove $@

hiddenkey.jpg: key.jpg private.key
	outguess -F - -p 100 \
		-d private.key \
		key.jpg $@

WWWROOT= 		/var/www/natsak
CHALLENGE1= 	$(shell sha256 < panopticon.txt)
CHALLENGE2= 	$(shell ./challenge1.py < challenge1.txt)

publish-secret: ${WWWROOT}/index.html

clean: clean-secret
clean-secret:
	${RM} panoptisteg.jpg panopticon.txt.asc
	${RM} hiddenkey.jpg key.jpg
	${RM} ${CHALLENGE1}
	${RM} ${CHALLENGE2}

${WWWROOT}/index.html: panopticon.html ${WWWROOT}/panopticon.jpg
${WWWROOT}/panopticon.jpg: panoptisteg.jpg ${WWWROOT}/${CHALLENGE1}
${WWWROOT}/${CHALLENGE1}: ${CHALLENGE1} ${WWWROOT}/${CHALLENGE2}
${WWWROOT}/${CHALLENGE2}: ${CHALLENGE2}

WWWFILES= 	${WWWROOT}/index.html
WWWFILES+= 	${WWWROOT}/panopticon.jpg
WWWFILES+= 	${WWWROOT}/${CHALLENGE1}
WWWFILES+= 	${WWWROOT}/${CHALLENGE2}

${WWWFILES}:
	${CP} $< $@

panoptisteg.jpg: panopticon.jpg panopticon.txt.asc
	outguess -F - -p 100 \
		-d panopticon.txt.asc \
		panopticon.jpg $@

panopticon.txt.asc: panopticon.txt
	gpg -ase \
		-r nobody@trmavqq7pf46h4xe.onion \
		-u nobody@trmavqq7pf46h4xe.onion \
		$<

${CHALLENGE1}: challenge1.txt
	gpg -ase -u nobody@trmavqq7pf46h4xe.onion \
		-r nobody@trmavqq7pf46h4xe.onion \
		$<
	mv $<.asc $@

${CHALLENGE2}: challenge2.txt
	gpg -ase -u nobody@trmavqq7pf46h4xe.onion \
		-r nobody@trmavqq7pf46h4xe.onion \
		$<
	mv $<.asc $@


### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/package.mk
include ${INCLUDE_MAKEFILES}/miun.course.mk
