SPHINXBUILD = sphinx-build
SOURCEDIR   = src
BUILDDIR    = build

# Put it first so that "make" without argument is like "make help"

help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Generate HTML

ROOTDIR = $(shell pwd)

html:
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@python "$(ROOTDIR)/scripts/appendfile.py" \
	        "$(ROOTDIR)/$(BUILDDIR)/html/_static/pygments.css" \
	        "$(ROOTDIR)/styles/cellmlText.css"

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option
# Note: $(O) is meant as a shortcut for $(SPHINXOPTS)...

%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
