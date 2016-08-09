#!/bin/sh
#
# Apply hypen2endash.sh for all .tex files
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, you can access it online at
# http://www.gnu.org/licenses/gpl-2.0.html.
#
# Copyright (C) Akira Yokosawa, 2016
#
# Authors: Akira Yokosawa <akiyks@gmain.com>

texfiles=`find . -name '*.tex' -print`
for i in $texfiles
do
	basename="${i%.tex}"
#	echo $basename
	sh ./utilities/hyphen2endash.sh $basename.tex > $basename.tmp
	if diff -q $basename.tex $basename.tmp >/dev/null
	then
		rm $basename.tmp
	else
		echo "$basename.tex modified"
		mv -f $basename.tmp $basename.tex
	fi
done
