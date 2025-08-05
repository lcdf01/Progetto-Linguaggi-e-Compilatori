# File: Makefile
# Progetto Linguaggi e Compilatori - Compilazione automatica

GHC=ghc -package array
EXEC=TypeCheck
MAIN=Main.hs

GRAMDIR=Grammatica
GRAMFILES=$(GRAMDIR)/Abs.hs \
           $(GRAMDIR)/Lex.hs \
           $(GRAMDIR)/Par.hs \
           $(GRAMDIR)/Print.hs \
           $(GRAMDIR)/Skel.hs

SOURCES=$(MAIN) TypeChecker.hs TypeEnv.hs TypeRules.hs $(GRAMFILES)

all: $(EXEC)

$(EXEC): $(SOURCES)
	$(GHC) --make $(MAIN) -o $(EXEC)

demo: all
	./$(EXEC) Testing.txt

clean:
	rm -f *.o *.hi $(EXEC)
	rm -f $(GRAMDIR)/*.o $(GRAMDIR)/*.hi

.PHONY: all demo clean
