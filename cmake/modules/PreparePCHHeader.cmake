# Copyright (c) 2012 by Alex Turbov
#
# Collect a list of foreign headers used in a project as a file to be compiled into PCH
#

execute_process(
    COMMAND find . -maxdepth 1 -type d -a ! -printf "%p|"
    COMMAND sed -e "s,\\./,,g" -e "s,\\.|,," -e "s,|$,,"
    OUTPUT_VARIABLE TOP_LEVEL_SOURCE_DIRS_MASK
    OUTPUT_STRIP_TRAILING_WHITESPACE
    WORKING_DIRECTORY /work/GitHub/zencxx
 )
# message(STATUS "tldm: ${TOP_LEVEL_SOURCE_DIRS_MASK}")

execute_process(
    COMMAND grep -r -e "^#\\s*include\\s*<.*>" --include=*.hh --include=*.cc
    COMMAND egrep -v "(cmake|docs|tests)/"
    COMMAND sed -e "s,[^:]*:# *include *<\\(.*\\)>.*$,\\1,"
    
    COMMAND sort
    COMMAND uniq -c
    COMMAND sort -nr
    COMMAND egrep -v "(${TOP_LEVEL_SOURCE_DIRS_MASK})"
    COMMAND sed "s,^\\s\\+\\([0-9]\\+\\)\\s\\+\\(.*\\)\\s*$,#  include <\\2> // Included \\1 times,"
    COMMAND awk -F "//" "{ printf(\"%-60s//%s\\n\", $1, $2)}"
    OUTPUT_VARIABLE use_pch_file_CONTENT
    WORKING_DIRECTORY /work/GitHub/zencxx
 )

string(RANDOM LENGTH 15 ALPHABET "QWERTYUIOPASDFGHJKLZXCVBNM0123456789" use_pch_file_GUARD)
set(use_pch_file_GUARD "__PCH_${use_pch_file_GUARD}__")

# Render a PCH file
configure_file(/work/GitHub/zencxx/cmake/modules/pch-template.h.in /work/GitHub/build/zencxx/zencxx-pch.hh @ONLY)

# kate: hl cmake;