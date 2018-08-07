" Vim syntax file
" Language:     Scilla
" Filenames:    *.scilla
" Upstream:     https://github.com/rgrinberg/vim-ocaml
" Maintainers:  Ian Tan      <iantanwx@gmail.com>
" Last Change:  2018 Aug 05 - initial version
" Version: 0.0.1

" Scilla is case sensitive.
syn case match

" lowercase identifier - the standard way to match
syn match    ocamlLCIdentifier /\<\(\l\|_\)\(\w\|'\)*\>/

syn match    ocamlKeyChar    "|"

" Errors
syn match    ocamlBraceErr   "}"
syn match    ocamlBrackErr   "\]"
syn match    ocamlParenErr   ")"
syn match    ocamlArrErr     "|]"

syn match    ocamlCommentErr "\*)"

syn match    ocamlCountErr   "\<downto\>"
syn match    ocamlCountErr   "\<to\>"

" Error-highlighting of "end" without synchronization:
" as keyword or as error (default)
if exists("ocaml_noend_error")
  syn match    ocamlKeyword    "\<end\>"
else
  syn match    ocamlEndErr     "\<end\>"
endif

" Some convenient clusters
syn cluster  ocamlAllErrs contains=ocamlBraceErr,ocamlBrackErr,ocamlParenErr,ocamlCommentErr,ocamlCountErr,ocamlDoErr,ocamlDoneErr,ocamlEndErr,ocamlThenErr

syn cluster  ocamlAENoParen contains=ocamlBraceErr,ocamlBrackErr,ocamlCommentErr,ocamlCountErr,ocamlDoErr,ocamlDoneErr,ocamlEndErr,ocamlThenErr

syn cluster  ocamlContained contains=ocamlTodo,ocamlPreDef,ocamlModParam,ocamlModParam1,ocamlMPRestr,ocamlMPRestr1,ocamlMPRestr2,ocamlMPRestr3,ocamlModRHS,ocamlFuncWith,ocamlFuncStruct,ocamlModTypeRestr,ocamlModTRWith,ocamlWith,ocamlWithRest,ocamlModType,ocamlFullMod,ocamlVal


" Enclosing delimiters
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="(" matchgroup=ocamlKeyword end=")" contains=ALLBUT,@ocamlContained,ocamlParenErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="{" matchgroup=ocamlKeyword end="}"  contains=ALLBUT,@ocamlContained,ocamlBraceErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="\[" matchgroup=ocamlKeyword end="\]" contains=ALLBUT,@ocamlContained,ocamlBrackErr
syn region   ocamlEncl transparent matchgroup=ocamlKeyword start="\[|" matchgroup=ocamlKeyword end="|\]" contains=ALLBUT,@ocamlContained,ocamlArrErr


" Comments
syn region   ocamlComment start="(\*" end="\*)" contains=@Spell,ocamlComment,ocamlTodo
syn keyword  ocamlTodo contained TODO FIXME XXX NOTE

" Blocks
if !exists("ocaml_revised")
  syn region   ocamlEnd matchgroup=ocamlKeyword start="\<begin\>" matchgroup=ocamlKeyword end="\<end\>" contains=ALLBUT,@ocamlContained,ocamlEndErr
endif

"" Modules

" "sig"
syn region   ocamlSig matchgroup=ocamlModule start="\<sig\>" matchgroup=ocamlModule end="\<end\>" contains=ALLBUT,@ocamlContained,ocamlEndErr,ocamlModule
syn region   ocamlModSpec matchgroup=ocamlKeyword start="\<module\>" matchgroup=ocamlModule end="\<\u\(\w\|'\)*\>" contained contains=@ocamlAllErrs,ocamlComment skipwhite skipempty nextgroup=ocamlModTRWith,ocamlMPRestr

" "open"
syn region   ocamlNone matchgroup=ocamlKeyword start="\<open\>" matchgroup=ocamlModule end="\<\u\(\w\|'\)*\( *\. *\u\(\w\|'\)*\)*\>" contains=@ocamlAllErrs,ocamlComment

" "include"
syn match    ocamlKeyword "\<include\>" skipwhite skipempty nextgroup=ocamlModParam,ocamlFullMod

syn region   ocamlMPRestr start=":" end="."me=e-1 contained contains=@ocamlComment skipwhite skipempty nextgroup=ocamlMPRestr1,ocamlMPRestr2,ocamlMPRestr3
syn region   ocamlMPRestr1 matchgroup=ocamlModule start="\ssig\s\=" matchgroup=ocamlModule end="\<end\>" contained contains=ALLBUT,@ocamlContained,ocamlEndErr,ocamlModule
syn region   ocamlMPRestr2 start="\sfunctor\(\s\|(\)\="me=e-1 matchgroup=ocamlKeyword end="->" contained contains=@ocamlAllErrs,ocamlComment,ocamlModParam,ocamlGenMod skipwhite skipempty nextgroup=ocamlFuncWith,ocamlMPRestr2
syn match    ocamlMPRestr3 "\w\(\w\|'\)*\( *\. *\w\(\w\|'\)*\)*" contained
syn match    ocamlModPreRHS "=" contained skipwhite skipempty nextgroup=ocamlModParam,ocamlFullMod
syn keyword  ocamlKeyword val
syn region   ocamlVal matchgroup=ocamlKeyword start="\<val\>" matchgroup=ocamlLCIdentifier end="\<\l\(\w\|'\)*\>" contains=@ocamlAllErrs,ocamlComment,ocamlFullMod skipwhite skipempty nextgroup=ocamlMPRestr
syn region   ocamlModRHS start="." end=". *\w\|([^*]"me=e-2 contained contains=ocamlComment skipwhite skipempty nextgroup=ocamlModParam,ocamlFullMod
syn match    ocamlFullMod "\<\u\(\w\|'\)*\( *\. *\u\(\w\|'\)*\)*" contained skipwhite skipempty nextgroup=ocamlFuncWith

syn region   ocamlFuncWith start="([^*)]"me=e-1 end=")" contained contains=ocamlComment,ocamlWith,ocamlFuncStruct skipwhite skipempty nextgroup=ocamlFuncWith
syn region   ocamlFuncStruct matchgroup=ocamlModule start="[^a-zA-Z]struct\>"hs=s+1 matchgroup=ocamlModule end="\<end\>" contains=ALLBUT,@ocamlContained,ocamlEndErr

syn match    ocamlModTypeRestr "\<\w\(\w\|'\)*\( *\. *\w\(\w\|'\)*\)*\>" contained
syn region   ocamlModTRWith start=":\s*("hs=s+1 end=")" contained contains=@ocamlAENoParen,ocamlWith
syn match    ocamlWith "\<\(\u\(\w\|'\)* *\. *\)*\w\(\w\|'\)*\>" contained skipwhite skipempty nextgroup=ocamlWithRest
syn region   ocamlWithRest start="[^)]" end=")"me=e-1 contained contains=ALLBUT,@ocamlContained

syn keyword  scillaKeyword import library contract transition
syn keyword  scillaKeyword builtin fun tfun field Emp send accept
syn keyword  scillaKeyword block let in match with end

syn keyword  ocamlType     String Int32 Int64 Int128 Int256 Uint32 Uint64 Uint128 Uint256
syn keyword  ocamlType     BNum Address Hash Message ADT Map

syn match    ocamlConstructor  "(\s*)"
syn match    ocamlConstructor  "\[\s*\]"
syn match    ocamlConstructor  "\[|\s*>|]"
syn match    ocamlConstructor  "\[<\s*>\]"
syn match    ocamlConstructor  "\u\(\w\|'\)*\>"

" Polymorphic variants
syn match    ocamlConstructor  "`\w\(\w\|'\)*\>"

" Module prefix
syn match    ocamlModPath      "\u\(\w\|'\)* *\."he=e-1

syn match    ocamlCharacter    "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn match    ocamlCharacter    "'\\x\x\x'"
syn match    ocamlCharErr      "'\\\d\d'\|'\\\d'"
syn match    ocamlCharErr      "'\\[^\'ntbr]'"
syn region   ocamlString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn match    ocamlString       "{\(\w*\)|\(.\|\n\)\{-}|\1}" contains=@Spell

syn match    ocamlFunDef       "->"
syn match    ocamlRefAssign    ":="
syn match    ocamlTopStop      ";;"
syn match    ocamlOperator     "\^"
syn match    ocamlOperator     "::"

syn match    ocamlOperator     "&&"
syn match    ocamlOperator     "<"
syn match    ocamlOperator     ">"
syn match    ocamlAnyVar       "\<_\>"
syn match    ocamlKeyChar      "|[^\]]"me=e-1
syn match    ocamlKeyChar      ";"
syn match    ocamlKeyChar      "\~"
syn match    ocamlKeyChar      "?"
syn match    ocamlKeyChar      "\*"
syn match    ocamlKeyChar      "="

if exists("ocaml_revised")
  syn match    ocamlErr        "<-"
else
  syn match    ocamlOperator   "<-"
endif

syn match    ocamlNumber        "\<-\=\d\(_\|\d\)*[l|L|n]\?\>"
syn match    ocamlNumber        "\<-\=0[x|X]\(\x\|_\)\+[l|L|n]\?\>"
syn match    ocamlNumber        "\<-\=0[o|O]\(\o\|_\)\+[l|L|n]\?\>"
syn match    ocamlNumber        "\<-\=0[b|B]\([01]\|_\)\+[l|L|n]\?\>"
syn match    ocamlFloat         "\<-\=\d\(_\|\d\)*\.\?\(_\|\d\)*\([eE][-+]\=\d\(_\|\d\)*\)\=\>"

" Labels
syn match    ocamlLabel        "\~\(\l\|_\)\(\w\|'\)*"lc=1
syn match    ocamlLabel        "?\(\l\|_\)\(\w\|'\)*"lc=1
syn region   ocamlLabel transparent matchgroup=ocamlLabel start="?(\(\l\|_\)\(\w\|'\)*"lc=2 end=")"me=e-1 contains=ALLBUT,@ocamlContained,ocamlParenErr


" Synchronization
syn sync minlines=50
syn sync maxlines=500

if !exists("ocaml_revised")
  syn sync match ocamlDoSync      grouphere  ocamlDo      "\<do\>"
  syn sync match ocamlDoSync      groupthere ocamlDo      "\<done\>"
endif

if exists("ocaml_revised")
  syn sync match ocamlEndSync     grouphere  ocamlEnd     "\<\(object\)\>"
else
  syn sync match ocamlEndSync     grouphere  ocamlEnd     "\<\(begin\|object\)\>"
endif

syn sync match ocamlEndSync     groupthere ocamlEnd     "\<end\>"
syn sync match ocamlStructSync  grouphere  ocamlStruct  "\<struct\>"
syn sync match ocamlStructSync  groupthere ocamlStruct  "\<end\>"
syn sync match ocamlSigSync     grouphere  ocamlSig     "\<sig\>"
syn sync match ocamlSigSync     groupthere ocamlSig     "\<end\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ocaml_syntax_inits")
  if version < 508
    let did_ocaml_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ocamlBraceErr	   Error
  HiLink ocamlBrackErr	   Error
  HiLink ocamlParenErr	   Error
  HiLink ocamlArrErr	   Error

  HiLink ocamlCommentErr   Error

  HiLink ocamlCountErr	   Error
  HiLink ocamlDoErr	   Error
  HiLink ocamlDoneErr	   Error
  HiLink ocamlEndErr	   Error
  HiLink ocamlThenErr	   Error

  HiLink ocamlCharErr	   Error

  HiLink ocamlErr	   Error

  HiLink ocamlComment	   Comment

  HiLink ocamlModPath	   Include
  HiLink ocamlObject	   Include
  HiLink ocamlModule	   Include
  HiLink ocamlModParam1    Include
  HiLink ocamlGenMod       Include
  HiLink ocamlModType	   Include
  HiLink ocamlMPRestr3	   Include
  HiLink ocamlFullMod	   Include
  HiLink ocamlFuncWith	   Include
  HiLink ocamlModParam     Include
  HiLink ocamlModTypeRestr Include
  HiLink ocamlWith	   Include
  HiLink ocamlMTDef	   Include

  HiLink ocamlScript	   Include

  HiLink ocamlConstructor  Constant

  HiLink ocamlVal          Keyword
  HiLink ocamlModPreRHS    Keyword
  HiLink ocamlMPRestr2	   Keyword
  HiLink ocamlKeyword	   Keyword
  HiLink ocamlMethod	   Include
  HiLink ocamlFunDef	   Keyword
  HiLink ocamlRefAssign    Keyword
  HiLink ocamlKeyChar	   Keyword
  HiLink ocamlAnyVar	   Keyword
  HiLink ocamlTopStop	   Keyword
  HiLink ocamlOperator	   Keyword

  HiLink ocamlBoolean	   Boolean
  HiLink ocamlCharacter    Character
  HiLink ocamlNumber	   Number
  HiLink ocamlFloat	   Float
  HiLink ocamlString	   String

  HiLink ocamlLabel	   Identifier

  HiLink ocamlType	   Type

  HiLink ocamlTodo	   Todo

  HiLink ocamlEncl	   Keyword

  HiLink ocamlPpxEncl       ocamlEncl

  delcommand HiLink
endif

let b:current_syntax = "ocaml"

" vim: ts=8
