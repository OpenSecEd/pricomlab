<<<<<<< HEAD
.PHONY: all
all: pricomlab.pdf

FILES= 		pricomlab.tex aims.tex literature.tex pricomlab.bib

pricomlab.pdf: ${FILES}
pricomlab.pdf: llncs biblatex-lncs

.PHONY:
clean:
	${RM} pricomlab.pdf


# Yes, we thought that you might find this here ...
# - "Did they place this here on purpose?"
# - "Is this the real thing, or is this intended to mislead?"

key.jpg: key.png
	convert $^ -resize 500% -background white -alpha remove $@

hiddenkey.jpg: key.jpg private.key
	outguess -F - -p 100 \
		-d private.key \
		key.jpg $@

STUDENTS= 		$(shell cat students.txt)
WWWROOT= 		/var/www/natsak
CHALLENGE1= 	$(shell sha256 < panopticon.txt)
CHALLENGE2= 	$(shell ./challenge1.py < challenge1.txt)

.PHONY: publish-secret
publish-secret: ${WWWROOT}/index.html

.PHONY: clean clean-secret
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


### Final level
${FINAL}: final.txt
	gpg -ase -u nobody@trmavqq7pf46h4xe.onion \
		-r nobody@trmavqq7pf46h4xe.onion \
		$<
	mv $<.asc $@

### Create the tickets to the passing grade

${STUDENTS}: pass.txt
	sed "s/|username|/$@/" $< | \
		gpg -as > $@

define passticket
$${WWWROOT}/$(shell echo -n $1 | sha256): $1
	${CP} $$< $$@
endef
$(foreach username,${STUDENTS},$(eval $(call passticket,${username})))


### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
