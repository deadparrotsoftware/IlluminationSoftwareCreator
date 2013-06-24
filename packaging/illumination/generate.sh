#!/bin/bash

# This is an example of how to generate packaging for ISC using
# the packagemonkey application on the command line.

# https://github.com/fuzzgun/packagemonkey

packagemonkey --dir "/home/motters/develop/illumination" -l "gpl2" -e "Bob Mottram (4096 bits) <bob@robotics.uk.to>" --brief "Visual App Creation for Android, iOS, HTML5, PyGTK and Flash" --desc "Illumination Software Creator allows you to quickily (and visually) build apps for Android, iOS, HTML5, Flash and Python/GTK.  Illumination generates raw source code (including XCode and Eclipse project files when necessary) for each platform -- making it an excellent rapid prototyping tool for native apps." --homepage "http://www.lunduke.com" --section "devel" --version "6.0.0" --categories "Development;IDE;" --builddeb "build-essential, libc6 (>=2.3), libexpat1 (>=1.95.8), libglib2.0-0 (>=2.2.0), libgtk2.0-0 (>=2.2.0)" --dependsdeb "ia32-libs, libc6 (>=2.3), libexpat1 (>=1.95.8), libglib2.0-0 (>=2.2.0), libgtk2.0-0 (>=2.2.0)" --dependsrpm "glibc expat glib2 gtk2 expat-devel" --dependsarch "glibc, expat, glib2, gtk2"
