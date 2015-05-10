# output directory
OUTPUT_DIR = ./output

# files
THESIS_LYX = tesi.lyx
README_MD = LEGGIMI.md
SINGLE_SIDED_FOLDER = $(OUTPUT_DIR)/singola-facciata
DOUBLE_SIDED_FOLDER = $(OUTPUT_DIR)/doppia-facciata
SINGLE_SIDED_PATCH = single-sided.patch
TEMP_REPO_TAR = temp-repo.tar
TEMPLATE_FILES = $(shell git ls-tree -r --name-only master)
FILES_TO_EXCLUDE = exclude-files.txt

all: $(TEMPLATE_FILES)
	tar cf $(TEMP_REPO_TAR) $(TEMPLATE_FILES) -X $(FILES_TO_EXCLUDE)

	mkdir -p $(SINGLE_SIDED_FOLDER)
	tar xf $(TEMP_REPO_TAR) -C $(SINGLE_SIDED_FOLDER)
	patch -p1 $(SINGLE_SIDED_FOLDER)/$(THESIS_LYX) < $(SINGLE_SIDED_PATCH)
	# FIXME patch should not generate the orig file
	rm $(SINGLE_SIDED_FOLDER)/$(THESIS_LYX).orig
	lyx --export pdf2 $(SINGLE_SIDED_FOLDER)/$(THESIS_LYX)

	mkdir -p $(DOUBLE_SIDED_FOLDER)
	tar xf $(TEMP_REPO_TAR) -C $(DOUBLE_SIDED_FOLDER)
	lyx --export pdf2 $(DOUBLE_SIDED_FOLDER)/$(THESIS_LYX)

	cp $(README_MD) $(OUTPUT_DIR)

	rm -rf $(TEMP_REPO_TAR)

clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: all clean
