#!/usr/bin/env ruby
# canna2skk.rb -- convert Canna dictionary to SKK-JISYO format.
#
# Copyright (C) 2003 NAKAJIMA Mikio <minakaji@namazu.org>
#
# Author: NAKAJIMA Mikio <minakaji@namazu.org>
# Created: March 23, 2003
# Last Modified: $Date: 2003/03/22 23:59:37 $
# Version: $Id: canna2skk.rb,v 1.1 2003/03/22 23:59:37 minakaji Exp $

# This file is part of Daredevil SKK.

# Daredevil SKK is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either versions 2, or (at your option)
# any later version.
#
# Daredevil SKK is distributed in the hope that it will be useful
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Daredevil SKK, see the file COPYING.  If not, write to the
# Free Software Foundation Inc., 59 Temple Place - Suite 330, Boston,
# MA 02111-1307, USA.
#
# Commentary:
# As to Canna dictionary, See
#   http://cannadic.oucrc.org/
#
# $ canna2skk.rb gcanna.t gcannaf.t > tmp.jisyo
# $ skkdic-expr2 tmp.jisyo > SKK-JISYO.canna
#
# ���� #JS*8 �� #CNSUC2*2 �� #JS �� �� #JSSUC ��

file = ARGV.shift
open(file).each{|line|
  if !(line =~ /([^ ]+) (.+) *$/)
    next
  else
    key = $1
    words = $2
    words.split(' ').each{|word|
      if (word =~ /[#*a-zA-Z0-9]+/ || key == word)
	next
      else
	print key, " /", word, "/\n"
      end
    }
  end
}
# end of canna2skk.rb
