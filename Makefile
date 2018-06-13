PKG := BeginR
VERSION := $(shell grep Version DESCRIPTION | cut -d " " -f 2)
PKGFILE := $(PKG)_$(VERSION).tar.gz

build: clean
	mkdir -p inst/doc
	mkdir vignettes
	cp sources_vignettes/introduction/*.pdf* sources_vignettes/usingdata/*.pdf* sources_vignettes/plotting/*.pdf* sources_vignettes/programming/*.pdf* sources_vignettes/fittingmodels/*.pdf* sources_vignettes/cheatsheets/*.pdf* vignettes ## for linux add -u after cp
	cp sources_vignettes/introduction/*.Rnw sources_vignettes/usingdata/*.Rnw sources_vignettes/plotting/*.Rnw sources_vignettes/programming/*.Rnw sources_vignettes/fittingmodels/*.Rnw inst/doc ## for linux add -u after cp
	(cd inst/doc/; for f in *.Rnw; do mv "$$f" "$${f%.Rnw}_source.txt"; done;)
	Rscript -e "tools::compactPDF(paths = 'vignettes', gs_quality = 'printer')"
	Rscript -e "devtools::build()"

checkcode: install
	(cd ..; Rscript -e "if(require(BeginR) & require(codetools)) codetools::checkUsagePackage('BeginR', skipWith=TRUE)")

quickcheck:
	(cd ..; R CMD check $(PKGFILE))

check: install
	(cd ..; R CMD check --as-cran $(PKGFILE))

clean:
	-rm -r inst
	-rm -r vignettes
	-rm -r sources_vignettes/**/*.{nav,snm,tex,toc,vrb,log,gz} *.Rout .RData
	-rm -r sources_vignettes/**/figure
	-(cd ..; rm -r $(PKG)_*.tar.gz $(PKG).Rcheck)

drat: install
	Rscript -e "drat::insertPackage('../$(PKGFILE)', '~/Boulot/Mes_projets_de_recherche/R_packages/drat', commit = TRUE)"
	(cd ~/Boulot/Mes_projets_de_recherche/R_packages/drat; git push)

install: $(PKGFILE)
	(cd ..; R CMD INSTALL $(PKGFILE))

remove:
	(cd ..; R CMD REMOVE $(PKG))

reinstall: remove install

$(PKGFILE): build
