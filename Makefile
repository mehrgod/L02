# IDEA OF MAKE:
# "make TARGET" is supposed to make the TARGET file up-to-date.
# Algorithm outline for "make TARGET"
# (1) (recursively) make each of the dependencies (listed after the :)
#     This will check the up-to-dateness of each dependency.
#     Those that are updated are recorded as YOUNGER than the TARGET.
# (2) If the TARGET file is missing or one or more dependency is 
#     YOUNGER than the TARGET, then the COMMANDS (on tabbed lines below)
#     are performed.
# (3) Often, the COMMANDS recreate the TARGET.  $@ within a command
#     evaluates to the TARGET (name).  
# (4) Sometime, the COMMANDS don't recreate the TARGET.  Makefile
#     programmers write such commands so "make TARGET" executes the
#     commands ALWAYS.  Examples: make config and make help
#

raceDriver${OPT} : racer.h config.h raceDriver.c racer${OPT}.o Makefile
	gcc -o $@ -lpthread raceDriver.c racer${OPT}.o

racer${OPT}.o : racer${OPT}.s Makefile
	gcc ${OPT} -c racer${OPT}.s

racer${OPT}.s : config.h racer.c racer.h Makefile
	gcc -c -S ${OPT} racer.c -o racer${OPT}.s

config:
	@echo Please edit config.h
	nano config.h

help:
	@echo
	@echo 'make OPT=-O3 to compile racer.c with O3 optimization.'
	@echo 'make to compile racer.c with default (no) optimization.'
	@echo 'make config to edit the configuration file to specify'
	@echo '    whether the shared variable is declared volatile'
	@echo '    This technology is similar to configuration of '
	@echo '    Linux kernel builds, roughly.'
	@echo 'make clean to remove machine built and backup files'
	@echo 'make dist  to clean and generate a tar archive.'

clean:
	rm -f *.o *.s *~ raceDriver raceDriver-* *.bak

tar: clean
	cd ..;	tar cvf L02.tar L02

