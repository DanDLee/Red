Red/System [
	Title:   "Action! datatype runtime functions"
	Author:  "Nenad Rakocevic"
	File: 	 %action.reds
	Rights:  "Copyright (C) 2011 Nenad Rakocevic. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/dockimbel/Red/blob/master/red-system/runtime/BSL-License.txt
	}
]

action: context [
	verbose: 0
	
	push: func [
		/local
			cell  [red-action!]
	][
		#if debug? = yes [if verbose > 0 [print-line "action/push"]]
		
		cell: as red-action! stack/push
		cell/header: TYPE_ACTION
		;...TBD
	]
	
	;-- Actions -- 
	
	make: func [
		proto	   [red-value!]
		spec   	   [red-block!]
		return:    [red-action!]							;-- return action cell pointer
		/local
			action [red-action!]
	][
		#if debug? = yes [if verbose > 0 [print-line "action/make"]]
		
		assert TYPE_OF(spec) = TYPE_BLOCK
		
		action: as red-action! stack/push
		action/header:  TYPE_ACTION						;-- implicit reset of all header flags
		action/spec:    spec/node						; @@ copy spec block if not at head
		;action/symbols: clean-spec spec 				; @@ TBD
		
		action
	]
	
	form: func [
		value	[red-action!]
		buffer	[red-string!]
		part	[integer!]
		return: [integer!]
		/local
			str [red-string!]
	][
		#if debug? = yes [if verbose > 0 [print-line "action/form"]]

		string/concatenate-literal buffer "?action?"
		part											;@@ implement full support for /part
	]
	
	mold: func [
		value	[red-action!]
		buffer	[red-string!]
		part	[integer!]
		flags   [integer!]								;-- 0: /only, 1: /all, 2: /flat
		return: [integer!]
		/local
			str [red-string!]
	][
		#if debug? = yes [if verbose > 0 [print-line "action/mold"]]

		string/concatenate-literal buffer "make action! [...]" ;@@ TBD
		part											;@@ implement full support for /part
	]


	datatype/register [
		TYPE_ACTION
		"action"
		;-- General actions --
		:make
		null			;random
		null			;reflect
		null			;to
		:form
		:mold
		null			;get-path
		null			;set-path
		null			;compare
		;-- Scalar actions --
		null			;absolute
		null			;add
		null			;divide
		null			;multiply
		null			;negate
		null			;power
		null			;remainder
		null			;round
		null			;subtract
		null			;even?
		null			;odd?
		;-- Bitwise actions --
		null			;and~
		null			;complement
		null			;or~
		null			;xor~
		;-- Series actions --
		null			;append
		null			;at
		null			;back
		null			;change
		null			;clear
		null			;copy
		null			;find
		null			;head
		null			;head?
		null			;index?
		null			;insert
		null			;length?
		null			;next
		null			;pick
		null			;poke
		null			;remove
		null			;reverse
		null			;select
		null			;sort
		null			;skip
		null			;swap
		null			;tail
		null			;tail?
		null			;take
		null			;trim
		;-- I/O actions --
		null			;create
		null			;close
		null			;delete
		null			;modify
		null			;open
		null			;open?
		null			;query
		null			;read
		null			;rename
		null			;update
		null			;write
	]
]