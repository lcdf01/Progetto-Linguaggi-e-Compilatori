
Makefile:
# Makefile (fuori da ./Grammatica)

# Toolchain
GHC        = ghc
GHC_OPTS   = -package array -package containers -package mtl  # Aggiunto GHC_OPTS per chiarezza
HAPPY      = happy
HAPPY_OPTS = --array --info --ghc --coerce
ALEX       = alex
ALEX_OPTS  = --ghc

# Cartelle / nomi
DIR   = Grammatica
BIN   = Test              # nome eseguibile
MAIN  = Test.hs

# ----------------- MODIFICA -----------------
# Aggiunta dei nuovi moduli del Type Checker
TYPECHECKER_HS = TypeEnv.hs TypeRules.hs TypeChecker.hs

# Sorgenti
GEN_HS    = $(DIR)/Lex.hs $(DIR)/Par.hs
STATIC_HS = $(DIR)/Abs.hs $(DIR)/Print.hs $(DIR)/Skel.hs

# Lista completa dei sorgenti, inclusi quelli del type checker
SOURCES   = $(STATIC_HS) $(GEN_HS) $(TYPECHECKER_HS) $(MAIN)
# ----------------- FINE MODIFICA -----------------

.PHONY: all clean distclean demo

# Obiettivo di default
all: $(BIN)

# Alex / Happy (file dentro ./Grammatica)
$(DIR)/Lex.hs: $(DIR)/Lex.x
	$(ALEX) $(ALEX_OPTS) -o $@ $<

$(DIR)/Par.hs: $(DIR)/Par.y
	$(HAPPY) $(HAPPY_OPTS) -o $@ $<

# Link finale: metto .o/.hi in ./Grammatica e cerco moduli lì
# L'obiettivo $(BIN) ora dipende da TUTTI i sorgenti, inclusi i nuovi file.
# GHC capirà le dipendenze tra i moduli da solo.
$(BIN): $(SOURCES)
	$(GHC) $(GHC_OPTS) -i$(DIR) -odir $(DIR) -hidir $(DIR) -o $(BIN) $(MAIN)

# Demo (personalizza i file input)
demo: $(BIN)
	@echo "== Demo =="
	# Modificato per passare il file come argomento, come si aspetta Test.hs
	./$(BIN) Testing.txt || true

# Pulizia
clean :
	@echo "Pulizia dei file generati..."
	-rm -f *.o *.hi *.info
	-rm -f Test TestGrammatica
	-rm -f Grammatica/*.o Grammatica/*.hi Grammatica/*.info Grammatica/Grammatica/*.o Grammatica/Grammatica/*.hi Grammatica/Grammatica/*.info 
	-rm -f AbsGrammatica.hs LexGrammatica.* ParGrammatica.* PrintGrammatica.hs TestGrammatica.hs
	@echo "Pulizia completata."

distclean: clean
	- rm -f $(DIR)/Lex.hs $(DIR)/Par.hs $(BIN) $(DIR)/*.info