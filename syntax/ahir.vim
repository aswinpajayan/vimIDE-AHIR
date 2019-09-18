" Vim syntax file 
" Language:	AHIR
" Maintainer:	Aswin P Ajayan <aswin@ee.iitb.ac.in>
" Last Change:	2019 Sep 12
" Credits:	
"		

" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syntax match ahirIdentifier "\[\zs[^[]\+\ze\]"
syntax match ahirDollars "\$"
syntax match ahirComment "//.*$"


"Section for floats
"currently only mantessa of 8 and 11 are supported in AHIR
"FIXME regex highlights 81
syntax match ahirFloatMantessa   "<\zs[81][1]\=\ze,"  
syntax match ahirNumber		 "^\d\+"  
"currently only mantessa of 52 and 23 are supported in AHIR
syntax match ahirFloatExponent  ",\zs[52][23]\ze>"
syntax match ahirFloat    "_f[-+]\=\d.\d\+e+\d\+"
syn keyword ahirPipelineDesc dopipeline depth buffering fullrate pipeline
""" pipe is used as a synchronisation mechanism in AHIR Language
syn keyword ahirPipeType lifo noblock in out signal
syn keyword ahirDataType uint uint8  uint_8 float pipe int pointer array  record

syn keyword ahirModuleType volatile
syn keyword ahirCall	 call
syn keyword ahirStorage  storage   operator opaque macro foreign 
syn keyword ahirConstant  constant
syn keyword ahirParam    parameter
""" $guard(flag) <statement>
""" $split (<vector-to-split>,len1,len2,len3...) (var1,var2,var3,....)
syn keyword ahirMisc     guard null split of
syn keyword ahirFlow	 switch when then default endswitch place merge endmerge phi on while do if else endif
syn keyword ahirDefPlaces entry loopback
""" <res> = ($slice <vector-to-split> <start-index> <stop-index>)
syn keyword ahirSlice	 contained slice
syn keyword ahirSync     mark sync delay keep join fork
syn keyword ahirModule   module in out is nextgroup=ahirIdentifier
syn keyword ahirBlocks   branchblock seriesblock parallelblock forkblock

"Operator highlighting 
syn match ahirArithmeticOperator contained "[-+]"
syn match ahirArithmeticOperator contained "\.\=[*\\]"
syn match ahirLogicalOperator	contained	"[&|~^]"
syn match ahirLogicalOperator	contained	"[~][&|^]"
syn match ahirLogicalOperator	contained	"[<][<]"
syn match ahirLogicalOperator	contained	"[>][>]"
syn match ahirLogicalOperator	contained	"[>][o][>]"
syn match ahirLogicalOperator	contained	"[<][o][<]"
syn match ahirMiscOperator	contained	"[&][&]"
syn match ahirMiscOperator	contained	"\[\]"
syn match ahirRelationalOperator	contained	"[<>][=]\="
syn match ahirRelationalOperator	contained	"[!=][=]"
syn keyword ahirSpecialOperator	contained	bitcast cast encode p_encode bitreduce bitmap reduce concat mux prioritymux

syn match ahirAssignmentOperator  		":="
syn match ahirAssignment                         "="
syn match ahirExportOperator     contained	"=>"

syn match ahirPointer		"->"
syn match ahirPointer		"@"


syn keyword ahirBoolean		true false


syn region ahirOperatorEnclose     start="(" end=")" fold transparent contains=ahirArithmeticOperator,ahirFloat,ahirLogicalOperator,ahirDataType,ahirFloatExponent,ahirFloatMantessa,ahirSlice,ahirExportOperator,ahirSpecialOperator,ahirMiscOperator,ahirDollars,ahirRelationalOperator

syn region ahirBlockEnclose     start="{" end="}" fold transparent contains=ALLBUT,ahirModule,ahirParam,ahirConstant,ahirArithmeticOperator,ahirLogicalOperator,ahirSlice,ahirExportOperator,ahirSpecialOperator,ahirMiscOperator,ahirRelationalOperator

hi def link ahirIdentifier Identifier
hi def 	    ahirDollars guifg=Red ctermfg=Red
hi def 	    ahirFloatMantessa guifg=Yellow ctermfg=Yellow
hi def 	    ahirFloatExponent guifg=Yellow ctermfg=Yellow
hi def link ahirComment		Comment
hi def link ahirPipelineDesc	Statement
hi def link ahirCall		Statement
hi def link ahirDataType	Type
hi def link ahirStorage 	Type
hi def link ahirModuleType 	PreProc
hi def link ahirConstant  	PreProc
hi def link ahirPipeType	PreProc
hi def link pipeDesc		PreProc
hi def link ahirParam		PreProc
hi def link ahirSync		PreProc
hi def link ahirFloat		Number
hi def link ahirNumber		Number
hi def link ahirModule		Statement
hi def link ahirMisc		Statement
hi def link ahirSlice		Statement
hi def link ahirAssignmentOperator   Statement
hi def link ahirAssignment   Statement
hi def link ahirExportOperator       Statement
hi def link ahirBlocks PreProc
hi def link ahirLogicalOperator      Statement
hi def link ahirArithmeticOperator   Statement
hi def link ahirRelationalOperator   Statement
hi def link ahirSpecialOperator	     Statement
hi def link ahirMiscOperator	     PreProc
hi def link ahirFlow		     Statement
hi def link ahirPointer		     PreProc
hi def link ahirDefPlaces	     Identifier
"hi def link ahirOperatorEnclose PreProc
"hi def link ahirSsaVariables Identifier

let b:current_syntax="ahir"
