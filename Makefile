# ====== Configurazione strumenti ======
GHC   := ghc -package array -package containers -package mtl
ALEX  := alex
HAPPY := happy

# Versioni consigliate dal testo (non vincolanti a runtime):
# GHC 9.2.8, BNFC 2.9.1, Happy/Alex compatibili.

# ====== Opzioni compilazione ======
# -iGrammatica per trovare i moduli in Grammatica
# -odir/-hidir per mettere .o/.hi in Grammatica
GHCFLAGS := -O2 -Wall -iGrammatica -odir Grammatica -hidir Grammatica

# ====== Struttura progetto ======
GRAMDIR := Grammatica
EXE     := Test

# Sorgenti generati da Alex/Happy
GEN_SRCS := $(GRAMDIR)/Lex.hs $(GRAMDIR)/Par.hs

# Altri moduli della grammatica (non generati da regole qui)
GRAM_SRCS := $(GRAMDIR)/Abs.hs $(GRAMDIR)/Print.hs $(GRAMDIR)/ErrM.hs $(GRAMDIR)/Skel.hs

# Sorgenti Haskell del progetto: tutti gli .hs in root + TAC in Grammatica
ROOT_HS := $(filter-out $(GRAMDIR)/%,$(wildcard *.hs))
TAC_HS  := $(wildcard $(GRAMDIR)/Tac*.hs)
HS_SRCS := $(ROOT_HS) $(TAC_HS)

# Target di default
.PHONY: all
all: $(EXE)

# ====== Regole di generazione Lexer/Parser ======
$(GRAMDIR)/Lex.hs: $(GRAMDIR)/Lex.x
	@echo "[ALEX ] $< -> $@"
	$(ALEX) -g $< -o $@

$(GRAMDIR)/Par.hs: $(GRAMDIR)/Par.y
	@echo "[HAPPY] $< -> $@"
	$(HAPPY) -gca $< -o $@

# ====== Link finale (compilazione Haskell) ======
$(EXE): $(HS_SRCS) $(GEN_SRCS) $(GRAM_SRCS)
	@echo "[GHC  ] $(HS_SRCS) -> $(EXE)"
	$(GHC) $(GHCFLAGS) -o $@ Test.hs

# ====== Demo automatica ======
# - Esegue tutti i file tests/*.txt se la cartella esiste
# - In alternativa/aggiunta usa Testing.txt se presente
.PHONY: demo
demo: $(EXE)
	@set -e; \
	OK=0; \
	if ls tests/*.txt >/dev/null 2>&1; then \
	  echo "== Esecuzione demo su tests/*.txt =="; \
	  for f in tests/*.txt; do \
	    echo ""; echo "--- $$f ---"; \
	    ./$(EXE) < "$$f" || exit $$?; \
	    OK=1; \
	  done; \
	fi; \
	if [ -f Testing.txt ]; then \
	  echo ""; echo "== Esecuzione demo su Testing.txt =="; \
	  ./$(EXE) < Testing.txt || exit $$?; \
	  OK=1; \
	fi; \
	if [ $$OK -eq 0 ]; then \
	  echo "Nessun caso di test trovato (tests/*.txt o Testing.txt)."; \
	  echo "Aggiungi dei file di input per la demo."; \
	fi

# ====== Pulizia ======
.PHONY: clean distclean
clean:
	@echo "Pulizia dei file generati..."
	-rm -f *.o *.hi *.info
	-rm -f $(EXE) TestGrammatica
	-rm -f $(GRAMDIR)/*.o $(GRAMDIR)/*.hi $(GRAMDIR)/*.info
	# Duplicati/backup e generati vari:
	-rm -f AbsGrammatica.hs LexGrammatica.* ParGrammatica.* PrintGrammatica.hs TestGrammatica.hs
	-rm -f $(GRAMDIR)/*.bak *.bak *~ .*~ .DS_Store
	@echo "Pulizia completata."

# distclean = clean + rimozione dei file generati da Alex/Happy
distclean: clean
	@echo "Rimozione dei sorgenti generati (Alex/Happy)..."
	-rm -f $(GRAMDIR)/Lex.hs $(GRAMDIR)/Par.hs
	@echo "Fatto."

# ====== Utility ======
.PHONY: regenerate
regenerate: distclean
	@$(MAKE) $(GEN_SRCS)

.PHONY: run
run: $(EXE)
	./$(EXE)