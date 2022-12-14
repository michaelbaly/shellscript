##
##  Makefile for GNU shtool
##  Copyright (c) 1999-2008 Ralf S. Engelschall <rse@engelschall.com>
##
##  This file is part of shtool and free software; you can redistribute
##  it and/or modify it under the terms of the GNU General Public
##  License as published by the Free Software Foundation; either version
##  2 of the License, or (at your option) any later version.
##
##  This file is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
##  General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software
##  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
##  USA, or contact Ralf S. Engelschall <rse@engelschall.com>.
##



TOP         = .
prefix      = /usr/local
exec_prefix = ${prefix}
bindir      = ${exec_prefix}/bin
mandir      = ${datarootdir}/man
datarootdir = ${prefix}/share
datadir     = ${datarootdir}
aclocaldir  = $(datadir)/aclocal
pkgdatadir  = $(datadir)/shtool

DESTDIR     =

SHELL       = /bin/sh
PERL        = /usr/bin/perl
POD2MAN     = /usr/bin/pod2man
RM          = rm -f
RMDIR       = rmdir
TRUE        = true
CP          = cp
LS          = ls

SCRIPTS = \
 sh.echo \
 sh.mdate \
 sh.table \
 sh.prop \
 sh.move \
 sh.install \
 sh.mkdir \
 sh.mkln \
 sh.mkshadow \
 sh.fixperm \
 sh.rotate \
 sh.tarball \
 sh.subst \
 sh.platform \
 sh.arx \
 sh.slo \
 sh.scpp \
 sh.version \
 sh.path

all: shtool manpages

shtool: $(SCRIPTS) sh.common shtoolize
	@$(SHELL) sh.echo -e "%Bbuilding program shtool%b"
	./shtoolize -o shtool all

manpages: .timestamp
.timestamp: shtoolize.pod shtool.pod $(SCRIPTS)
	-@V1=`$(SHELL) sh.version -l txt -d short VERSION`; \
	V2=`$(SHELL) sh.version -l txt -d long VERSION`; \
	D=`$(SHELL) sh.version -l txt -d long VERSION | sed -e 's;.*(;;' -e 's;).*;;'`; \
	for ifile in shtoolize.pod shtool.pod $(SCRIPTS); do \
	    tfile=`echo "$$ifile" | sed -e 's/\.pod$$/.tmp/' -e 's/^sh\.\(.*\)$$/shtool-\1.tmp/'`; \
	    ofile=`echo "$$ifile" | sed -e 's/\.pod$$/.1/' -e 's/^sh\.\(.*\)$$/shtool-\1.1/'`; \
		cp $$ifile $$tfile; \
	    $(SHELL) sh.echo -e "%Bbuilding manpage $$ofile%b"; \
	    $(POD2MAN) --section=1 --center="GNU Portable Shell Tool" \
	               --release="$$D" --date="shtool $$V1" $$tfile |\
	    sed -e "s;SHTOOL_VERSION_STR;$$V2;" >$$ofile; \
		rm -f $$tfile; \
	done; \
	touch .timestamp

check: test
test: all
	@$(SHELL) sh.echo -e "%BRunning test suite:%b"
	@$(SHELL) test.sh

install: all
	./shtool mkdir -f -p -m 755 $(DESTDIR)$(prefix)
	./shtool mkdir -f -p -m 755 $(DESTDIR)$(bindir)
	./shtool mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
	./shtool mkdir -f -p -m 755 $(DESTDIR)$(aclocaldir)
	./shtool mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir)
	./shtool install -c -m 755 shtool $(DESTDIR)$(bindir)/shtool
	./shtool install -c -m 755 shtoolize $(DESTDIR)$(bindir)/shtoolize
	-@for ifile in shtoolize.pod shtool.pod $(SCRIPTS); do \
	    ofile=`echo "$$ifile" | sed -e 's/\.pod$$/.1/' -e 's/^sh\.\(.*\)$$/shtool-\1.1/'`; \
	    echo "./shtool install -c -m 644 $$ofile $(DESTDIR)$(mandir)/man1/$$ofile"; \
	    ./shtool install -c -m 644 $$ofile $(DESTDIR)$(mandir)/man1/$$ofile; \
	done
	./shtool install -c -m 644 shtool.m4 $(DESTDIR)$(aclocaldir)/shtool.m4
	@for script in sh.common $(SCRIPTS); do \
	    echo "./shtool install -c -m 644 $$script $(DESTDIR)$(pkgdatadir)/$$script"; \
	    ./shtool install -c -m 644 $$script $(DESTDIR)$(pkgdatadir)/$$script; \
	done

uninstall:
	@for script in sh.common $(SCRIPTS); do \
	    echo "$(RM) $(DESTDIR)$(pkgdatadir)/$$script"; \
	    $(RM) $(DESTDIR)$(pkgdatadir)/$$script; \
	done
	$(RM) $(DESTDIR)$(aclocaldir)/shtool.m4
	-@for ifile in shtoolize.pod shtool.pod $(SCRIPTS); do \
	    ofile=`echo "$$ifile" | sed -e 's/\.pod$$/.1/' -e 's/^sh\.\(.*\)$$/shtool-\1.1/'`; \
	    echo "$(RM) $(DESTDIR)$(mandir)/man1/$$ofile"; \
	    $(RM) $(DESTDIR)$(mandir)/man1/$$ofile; \
	done
	$(RM) $(DESTDIR)$(bindir)/shtoolize
	$(RM) $(DESTDIR)$(bindir)/shtool
	$(RMDIR) $(DESTDIR)$(aclocaldir) >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(pkgdatadir) >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(datadir) >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(mandir)/man1 >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(mandir) >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(bindir) >/dev/null 2>&1 || $(TRUE)
	$(RMDIR) $(DESTDIR)$(prefix) >/dev/null 2>&1 || $(TRUE)

clean:
	$(RM) shtool
	$(RM) *.1

distclean: clean
	$(RM) Makefile shtoolize
	$(RM) config.cache config.status config.log
	$(RM) .timestamp

