" Custom compiler setup for using the Arduino IDE as a commandline compiler.
" Author: Marc Dougherty <muncus@gmail.com>

if exists("current_compiler")
  finish
endif
let current_compiler = "arduino"

" Compatibility - older vim versions do not define CompilerSet.
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" Attempt to translate arduino error messages to actual filenames.

"Ignore various lines that are part of the standard output of arduino builds.
let &l:efm .= ",%-GPicked up JAVA_TOOL_OPTIONS%.%#"
" Ignore the several standard lines that all end with '...'.
let &l:efm .= ",%-G%.%#..."
" On success, there's always a line about archiving the core.
let &l:efm .= ",%-GArchiving built core%.%#"
" Ignore the standard memory stats.
let &l:efm .= ",%-GSketch uses%.%#"
let &l:efm .= ",%-GGlobal variables use%.%#"
let &l:efm .= ",%A%f: In function %.%#,%C%.%#:%l:%m,%C%s,%Z%p^"
" Sometimes the filename bit is not included in the first error.
" Vim assumes the current buffer in this case, which will probably be correct.
let &l:efm .= ",%A%.%#:%l:%m"

" The below specifies that quickfix entries missing a buffer number should
" assume the current buffer.
function! arduino#FixQfList()
  let qflist = getqflist()
  for qfentry in qflist
    if(qfentry.bufnr == 0)
      " guess that we want this file, if file didnt match.
      let qfentry.bufnr = bufnr("%")
    endif
  endfor
  call setqflist(qflist)
endfunction

"au QuickfixCmdPost make call arduino#FixQfList()
