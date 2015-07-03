" Vim syntax file
" Language:     Zepto
" Maintainer:   Veit Heller <veit@veitheller.de>
" URL:          http://github.com/zepto-lang/vim-zepto.git
" Description:  Contains all of the keywords in #lang zepto

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match zeptoError ,[]})],

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,124,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,124,126,_
endif


syn keyword zeptoSyntax quote \| <- , typeof \|\| && <|
syn keyword zeptoSyntax lambda let let* letrec
syn keyword zeptoSyntax if cond and or nor case define else
syn keyword zeptoSyntax define-syntax syntax-rules
syn keyword zeptoSyntax when unless
syn keyword zeptoSyntax set! set-car! set-cdr!
syn keyword zeptoSyntax for for-each begin
syn keyword zeptoSyntax quasiquote unquote unquote-splicing

syn keyword zeptoSyntax delay force

syn match zeptoSyntax /\<[\u03bb]\>/
syn match zeptoSyntax /\<[\u0192]\>/

syn keyword zeptoFunc write display error write?
syn keyword zeptoFunc read read-all read-contents read?

syn keyword zeptoFunc boolean? not equal? eqv? eq? nil
syn keyword zeptoFunc #t #f symbol? boolean?
syn keyword zeptoFunc number? complex? real? rational? integer?
syn keyword zeptoFunc zero? positive? negative? float?
syn keyword zeptoFunc even? odd? exact? inexact?
syn keyword zeptoFunc exact->inexact

syn keyword zeptoFunc + - * / /. quotient remainder modulo mod
syn keyword zeptoFunc abs max min gcd lcm round floor ceiling ceil real imaginary
syn keyword zeptoFunc truncate numerator denominator generate sum product

syn keyword zeptoFunc any? all? every? iota

syn keyword zeptoFunc = < <= > >=

syn keyword zeptoFunc sqrt
syn keyword zeptoFunc expt pow log

syn keyword zeptoFunc sin cos tan asin acos atan

syn keyword zeptoFunc real-part imag-part

syn keyword zeptoFunc random

syn keyword zeptoFunc number->string string->number string->float string->integer
syn keyword zeptoFunc string->rational string->complex string->boolean

syn keyword zeptoFunc pi e

syn keyword zeptoFunc string? make-string string string->immutable-string string-length
syn keyword zeptoFunc string-ref string-set! substring string-copy string-copy!
syn keyword zeptoFunc string-fill! string-append string->list list->string
syn keyword zeptoFunc build-string string=? string<? string<=? string>? string>=?
syn keyword zeptoFunc string-ci=? string-ci<? string-ci<=? string-ci>? string-ci>=?
syn keyword zeptoFunc string-extend ++ += string-lower-case string-upper-case
syn keyword zeptoFunc string-substitute

syn keyword zeptoFunc make-hash hash-values hash-keys hash-filter-by-keys

syn keyword zeptoFunc char? char->integer integer->char
syn keyword zeptoFunc char=? char<? char<=? char>? char>=?
syn keyword zeptoFunc char-ci=? char-ci<? char-ci<=? char-ci>? char-ci>=?
syn keyword zeptoFunc char-upper-case char-lower-case

syn keyword zeptoFunc symbol?
syn keyword zeptoFunc symbol->string string->symbol

syn keyword zeptoFunc pair? null? cons car cdr null
syn keyword zeptoFunc list? list length list-append list-extend
syn keyword zeptoFunc list-ref list-tail append reverse map reduce
syn keyword zeptoFunc for-each foldl foldr fold filter remove
syn keyword zeptoFunc sort member memv memq
syn keyword zeptoFunc assq assv assoc
syn keyword zeptoFunc caar cadr cdar cddr caaar caadr cadar caddr cdaar cdadr
syn keyword zeptoFunc cddar cdddr caaaar caaadr caadar caaddr cadadr caddar
syn keyword zeptoFunc cadddr cdaaar cdaadr cdadar cddaar cdddar cddddr

syn keyword zeptoFunc head tail indexed-tail

syn keyword zeptoFunc vector?  make-vector vector vector-length
syn keyword zeptoFunc vector-ref vector-set!  vector->list list->vector
syn keyword zeptoFunc vector-fill! vector-append vector-extend

syn keyword zeptoFunc procedure? apply compose
syn keyword zeptoFunc primitive?
syn keyword zeptoFunc negate curry uncurry

syn match zeptoAtom      ,:\k+,  contained
syn match zeptoSymbol    ,\k+,  contained

syn cluster zeptoNormal  contains=zeptoSyntax,zeptoFunc,zeptoDelimiter
syn cluster zeptoQuotedStuff  contains=zeptoSymbol,zeptoAtom
syn cluster zeptoQuotedOrNormal  contains=zeptoDelimiter

syn region zeptoQuotedStruc start="("rs=s+1 end=")"re=e-1     contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal contained
syn region zeptoQuotedStruc start="#("rs=s+2 end=")"re=e-1    contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal contained
syn region zeptoQuotedStruc start="{"rs=s+1 end="}"re=e-1   contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal contained
syn region zeptoQuotedStruc start="\["rs=s+1 end="\]"re=e-1   contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal contained

syn cluster zeptoQuotedStuff add=zeptoQuotedStruc

syn region zeptoStruc matchgroup=Delimiter start="("rs=s+1 matchgroup=Delimiter end=")"re=e-1 contains=@zeptoNormal
syn region zeptoStruc matchgroup=Delimiter start="#("rs=s+2 matchgroup=Delimiter end=")"re=e-1 contains=@zeptoNormal
syn region zeptoStruc matchgroup=Delimiter start="{"rs=s+1 matchgroup=Delimiter end="}"re=e-1 contains=@zeptoNormal
syn region zeptoStruc matchgroup=Delimiter start="#{"rs=s+1 matchgroup=Delimiter end="}"re=e-1 contains=@zeptoNormal
syn region zeptoStruc matchgroup=Delimiter start="\["rs=s+1 matchgroup=Delimiter end="\]"re=e-1 contains=@zeptoNormal

syn region zeptoString start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
syn region zeptoString start=/#<<\z(.*\)$/ end=/^\z1$/

syn cluster zeptoNormal          add=zeptoError,zeptoConstant,zeptoStruc,zeptoString
syn cluster zeptoQuotedOrNormal  add=zeptoString
syn match zeptoNumberError         "\<#[xdobie]\k*"

syn match zeptoContainedNumberError   "\<#o\k*[^-+0-7delfinas#./@]"
syn match zeptoContainedNumberError   "\<#b\k*[^-+01delfinas#./@]"
syn match zeptoContainedNumberError   "\<#[ei]#[ei]"
syn match zeptoContainedNumberError   "\<#[xdob]#[xdob]"

syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\d\+/\d\+\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\d\+/\d\+[-+]\d\+\(/\d\+\)\?i\>" contains=zeptoContainedNumberError

syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?i\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?[-+]\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?i\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\(inf\|nan\)\.[0f][-+]\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?i\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?[-+]\(inf\|nan\)\.[0f]i\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?@[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\(inf\|nan\)\.[0f]@[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[dobie]\)\{0,2}[-+]\?\(\d\+\|\d\+#*\.\|\d*\.\d\+\)#*\(/\d\+#*\)\?\([sdlef][-+]\?\d\+#*\)\?@[-+]\(inf\|nan\)\.[0f]\>" contains=zeptoContainedNumberError

syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\x\+/\x\+\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\x\+/\x\+[-+]\x\+\(/\x\+\)\?i\>"

syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?i\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?[-+]\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?i\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\(inf\|nan\)\.[0f][-+]\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?i\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?[-+]\(inf\|nan\)\.[0f]i\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?@[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\(inf\|nan\)\.[0f]@[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?\>"
syn match zeptoNumber    "\<\(#x\|#[ei]#x\|#x#[ei]\)[-+]\?\(\x\+\|\x\+#*\.\|\x*\.\x\+\)#*\(/\x\+#*\)\?\([sl][-+]\?\x\+#*\)\?@[-+]\(inf\|nan\)\.[0f]\>"

syn match zeptoNumber    "\<\(#[xdobie]\)\{0,2}[-+]\(inf\|nan\)\.[0f]i\?\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[xdobie]\)\{0,2}[-+]\(inf\|nan\)\.[0f][-+]\(inf\|nan\)\.[0f]i\>" contains=zeptoContainedNumberError
syn match zeptoNumber    "\<\(#[xdobie]\)\{0,2}[-+]\(inf\|nan\)\.[0f]@[-+]\(inf\|nan\)\.[0f]\>" contains=zeptoContainedNumberError

syn keyword zeptoBoolean  #t #f #true #false #T #F

syn match zeptoError   "\<#\\\k*\>"

syn match zeptoChar    "\<#\\.\w\@!"
syn match zeptoChar    "\<#\\space\>"
syn match zeptoChar    "\<#\\newline\>"
syn match zeptoChar    "\<#\\return\>"
syn match zeptoChar    "\<#\\null\?\>"
syn match zeptoChar    "\<#\\backspace\>"
syn match zeptoChar    "\<#\\tab\>"
syn match zeptoChar    "\<#\\[0-7]\{1,3}\>"
syn match zeptoChar    "\<#\\x[0-9a-f]\{1,2}\>"
syn match zeptoChar    "\<#\\u[0-9a-f]\{1,6}\>"

syn cluster zeptoNormal  add=zeptoNumber,zeptoBoolean,zeptoChar
syn cluster zeptoQuotedOrNormal  add=zeptoNumber,zeptoBoolean

syn cluster zeptoNormal  add=zeptoExtFunc,zeptoExtSyntax

syn region zeptoQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal
syn region zeptoQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal
syn region zeptoQuoted matchgroup=Delimiter start="['`]\?#(" matchgroup=Delimiter end=")" contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal

syn region zeptoUnquote matchgroup=Delimiter start="\<#,"rs=s+2 end=![ \t\[\]()";]!re=e-1,me=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<#,@"rs=s+3 end=![ \t\[\]()";]!re=e-1,me=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<#,("rs=s+3 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<#,@("rs=s+4 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<#,\["rs=s+3 end="\]"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<#,@\["rs=s+4 end="\]"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,"rs=s+1 end=![ \t\[\]()";]!re=e-1,me=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,@"rs=s+2 end=![ \t\[\]()";]!re=e-1,me=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,("rs=s+2 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,@("rs=s+3 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,#("rs=s+3 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,@#("rs=s+4 end=")"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,\["rs=s+2 end="\]"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,@\["rs=s+3 end="\]"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,#\["rs=s+3 end="\]"re=e-1 contained contains=@zeptoNormal
syn region zeptoUnquote matchgroup=Delimiter start="\<,@#\["rs=s+4 end="\]"re=e-1 contained contains=@zeptoNormal

syn cluster zeptoQuotedStuff add=zeptoUnquote

syn region zeptoQuoted matchgroup=Delimiter start="#['`]"rs=s+2 end=![ \t()\[\]";]!re=e-1,me=e-1 contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal
syn region zeptoQuoted matchgroup=Delimiter start="#['`]("rs=s+3 matchgroup=Delimiter end=")"re=e-1 contains=@zeptoQuotedStuff,@zeptoQuotedOrNormal

syn match zeptoComment /;.*$/ contains=@Spell
syn region zeptoMultilineComment start=/#|/ end=/|#/ contains=zeptoMultilineComment,@Spell

syn cluster zeptoNormal  add=zeptoQuoted,zeptoComment,zeptoMultilineComment
syn cluster zeptoQuotedOrNormal  add=zeptoComment,zeptoMultilineComment

syn sync match matchPlace grouphere NONE "^[^ \t]"

if version >= 508 || !exists("zepto_syntax_init")
  if version < 508
    let zepto_syntax_init = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink zeptoSyntax             Statement
  HiLink zeptoFunc               Function

  HiLink zeptoString             String
  HiLink zeptoChar               Character
  HiLink zeptoBoolean            Boolean

  HiLink zeptoNumber             Number
  HiLink zeptoNumberError        Error
  HiLink zeptoContainedNumberError Error

  HiLink zeptoQuoted             Structure
  HiLink zeptoQuotedStruc        Structure
  HiLink zeptoSymbol             Structure
  HiLink zeptoAtom               Structure

  HiLink zeptoDelimiter          Delimiter
  HiLink zeptoConstant           Constant

  HiLink zeptoComment            Comment
  HiLink zeptoMultilineComment   Comment
  HiLink zeptoError              Error
  HiLink zeptoExtFunc            PreProc
  delcommand HiLink
endif

let b:current_syntax = "zepto"
