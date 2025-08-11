## Makefile (fuori da ./Grammatica)

# Toolchain
GHC        = ghc -package array
HAPPY      = happy
HAPPY_OPTS = --array --info --ghc --coerce
ALEX       = alex
ALEX_OPTS  = --ghc

# Cartelle / nomi
DIR   = Grammatica
BIN   = Test              # nome eseguibile (cambialo se vuoi)
MAIN  = $(DIR)/Test.hs

# Sorgenti
GEN_HS    = $(DIR)/Lex.hs $(DIR)/Par.hs
STATIC_HS = $(DIR)/Abs.hs $(DIR)/Print.hs $(DIR)/Skel.hs
SOURCES   = $(STATIC_HS) $(GEN_HS) $(MAIN)

.PHONY: all clean distclean demo

# Obiettivo di default
all: $(BIN)

# Alex / Happy (file dentro ./Grammatica)
$(DIR)/Lex.hs: $(DIR)/Lex.x
	$(ALEX) $(ALEX_OPTS) -o $@ $<

$(DIR)/Par.hs: $(DIR)/Par.y
	$(HAPPY) $(HAPPY_OPTS) -o $@ $<

# Link finale: metto .o/.hi in ./Grammatica e cerco moduli lì
$(BIN): $(SOURCES)
	$(GHC) $(GHC_OPTS) -i$(DIR) -odir $(DIR) -hidir $(DIR) -o $(BIN) $(MAIN)

# Demo (personalizza i file input)
demo: $(BIN)
	@echo "== Demo =="
	./$(BIN) < Testing.txt || true

# Pulizia
clean:
	- rm -f $(DIR)/*.o $(DIR)/*.hi

distclean: clean
	- rm -f $(DIR)/Lex.hs $(DIR)/Par.hs $(BIN)
