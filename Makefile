PKG := BeginR
VERSION := $(shell grep Version DESCRIPTION | cut -d " " -f 2)
PKGFILE := $(PKG)_$(VERSION).tar.gz

build: clean
	mkdir -p inst/doc
	mkdir vignettes
	cp sources_vignettes/introduction/*.pdf* sources_vignettes/usingdata/*.pdf* sources_vignettes/plotting/*.pdf* sources_vignettes/programming/*.pdf* vignettes ## for linux add -u after cp
	cp sources_vignettes/introduction/*.Rnw sources_vignettes/usingdata/*.Rnw sources_vignettes/plotting/*.Rnw sources_vignettes/programming/*.Rnw inst/doc ## for linux add -u after cp
	(cd inst/doc; rename .Rnw .txt *.Rnw)
	Rscript -e "devtools::build()"

checkcode:
	(cd ..; Rscript -e "if(require(BeginR)) codetools::checkUsagePackage('BeginR', skipWith=TRUE)")

quickcheck:
	(cd ..; R CMD check $(PKGFILE))

check:
	(cd ..; R CMD check --as-cran $(PKGFILE))

clean:
	-rm -r inst
	-rm -r vignettes
	-rm -r sources_vignettes/**/*.{nav,snm,tex,toc,vrb,log,gz} *.Rout .RData
	-rm -r sources_vignettes/**/figure
	-(cd ..; rm -r $(PKG)_*.tar.gz $(PKG).Rcheck)


install: $(PKGFILE)
	(cd ..; R CMD INSTALL $(PKGFILE))

$(PKGFILE): build

remove:
	(cd ..; R CMD REMOVE $(PKG))

reinstall: remove install
