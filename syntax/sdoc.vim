" Language: StrictDoc
"
" https://strictdoc.readthedocs.io/en/stable/strictdoc-1-user-manual.html#grammar-elements
" https://github.com/strictdoc-project/strictdoc/blob/74563e018c3bbbadb05d3f4f66ca1ddacd87f423/strictdoc/backend/sdoc/grammar/grammar.py

if exists("b:current_syntax")
  finish
endif

runtime! syntax/rst.vim

unlet! b:current_syntax

syn include @sdocTex syntax/tex.vim
syn region sdocMathJax start="\V$" end="\V$" keepend contains=@sdocTex
syn region sdocMathJax start="\V$$" end="\V$$" keepend contains=@sdocTex

syn match sdocElement /\[\/\{0,1}[A-Z_]\+\]/
syn match sdocField /[A-Z_]\+:/
syn keyword sdocLiteral Inline Table True False
syn match sdocDeprecated /NAME:/

let b:current_syntax = "sdoc"

hi link sdocElement Function
hi link sdocField Type
hi link sdocDeprecated Error
hi link sdocLiteral Constant
