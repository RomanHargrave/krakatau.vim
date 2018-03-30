" vim: set foldmarker="{{{,}}}" foldmethod=marker :
" Vim syntax file
" Language: Krakatau Assembler
" Maintainer: Roman Hargrave <roman@hargrave.info>
" URL: https://github.com/RomanHargrave/krakatau.vim
"
" Originally based on
" Pascal Germroth <pascal@ensieve.org>
"   http://github.com/neapel/vim-java-bytecode
"
"   Which was originally based on
"       Claudio Fleiner <claudio@fleiner.com>
"           http://www.fleiner.com/vim/syntax/bytecode.vim
"
" Last change: 2017 Jul 26
"
" To highlight Krakatau assembler files.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" prevent syntax from breaking when skipping long portions of the file
syn sync fromstart

" `.` needs to be in keyword spec
syn iskeyword @,48-57,.,_,<,>

" literals
syn match  bckSpecialChar /\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)/ contained
syn region bckString start=/\v"/ skip=/\v\\./ end=/\v"/ contained contains=bckSpecialChar

syn match bckC_constr "<clinit>" contained
syn match bckC_bare   /[A-Za-z0-9$_]+/ contained
syn cluster bckName add=bckC_constr,bckC_bare

" {{{1 Instructions
" from http://en.wikipedia.org/wiki/Java_bytecode_instruction_listings

" {{{2 Non-stack instructions
" no stack op
syn keyword bckInstructionNop nop
"[No change]	perform no operation
syn keyword bckInstructionNop iinc
"[No change]	increment local variable #index by signed byte const
" }}}2 Non-stack instructions end

" {{{2 Stack push Instructions 
" push to stash
syn keyword bckInstructionPush aconst_null
"→ null	push a null reference onto the stack
syn keyword bckInstructionPush iconst_m1
"→ -1	load the int value -1 onto the stack
syn keyword bckInstructionPush iconst_0
"→ 0	load the int value 0 onto the stack
syn keyword bckInstructionPush iconst_1
"→ 1	load the int value 1 onto the stack
syn keyword bckInstructionPush iconst_2
"→ 2	load the int value 2 onto the stack
syn keyword bckInstructionPush iconst_3
"→ 3	load the int value 3 onto the stack
syn keyword bckInstructionPush iconst_4
"→ 4	load the int value 4 onto the stack
syn keyword bckInstructionPush iconst_5
"→ 5	load the int value 5 onto the stack
syn keyword bckInstructionPush lconst_0
"→ 0L	push the long 0 onto the stack
syn keyword bckInstructionPush lconst_1
"→ 1L	push the long 1 onto the stack
syn keyword bckInstructionPush fconst_0
"→ 0.0f	push 0.0f on the stack
syn keyword bckInstructionPush fconst_1
"→ 1.0f	push 1.0f on the stack
syn keyword bckInstructionPush fconst_2
"→ 2.0f	push 2.0f on the stack
syn keyword bckInstructionPush dconst_0
"→ 0.0	push the constant 0.0 onto the stack
syn keyword bckInstructionPush dconst_1
"→ 1.0	push the constant 1.0 onto the stack
syn keyword bckInstructionPush iload_0
"→ value	load an int value from local variable 0
syn keyword bckInstructionPush iload_1
"→ value	load an int value from local variable 1
syn keyword bckInstructionPush iload_2
"→ value	load an int value from local variable 2
syn keyword bckInstructionPush iload_3
"→ value	load an int value from local variable 3
syn keyword bckInstructionPush lload_0
"→ value	load a long value from a local variable 0
syn keyword bckInstructionPush lload_1
"→ value	load a long value from a local variable 1
syn keyword bckInstructionPush lload_2
"→ value	load a long value from a local variable 2
syn keyword bckInstructionPush lload_3
"→ value	load a long value from a local variable 3
syn keyword bckInstructionPush fload_0
"→ value	load a float value from local variable 0
syn keyword bckInstructionPush fload_1
"→ value	load a float value from local variable 1
syn keyword bckInstructionPush fload_2
"→ value	load a float value from local variable 2
syn keyword bckInstructionPush fload_3
"→ value	load a float value from local variable 3
syn keyword bckInstructionPush dload_0
"→ value	load a double from local variable 0
syn keyword bckInstructionPush dload_1
"→ value	load a double from local variable 1
syn keyword bckInstructionPush dload_2
"→ value	load a double from local variable 2
syn keyword bckInstructionPush dload_3
"→ value	load a double from local variable 3
syn keyword bckInstructionPush aload_0
"→ objectref	load a reference onto the stack from local variable 0
syn keyword bckInstructionPush aload_1
"→ objectref	load a reference onto the stack from local variable 1
syn keyword bckInstructionPush aload_2
"→ objectref	load a reference onto the stack from local variable 2
syn keyword bckInstructionPush aload_3
"→ objectref	load a reference onto the stack from local variable 3
syn keyword bckInstructionPush bipush
"→ value	push a byte onto the stack as an integer value
syn keyword bckInstructionPush sipush
"→ value	push a short onto the stack
syn keyword bckInstructionPush ldc
"→ value	push a constant #index from a constant pool (String, int or float) onto the stack
syn keyword bckInstructionPush ldc_w
"→ value	push a constant #index from a constant pool (String, int or float) onto the stack (wide index is constructed as indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionPush ldc2_w
"→ value	push a constant #index from a constant pool (double or long) onto the stack (wide index is constructed as indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionPush iload
"→ value	load an int value from a local variable #index
syn keyword bckInstructionPush lload
"→ value	load a long value from a local variable #index
syn keyword bckInstructionPush fload
"→ value	load a float value from a local variable #index
syn keyword bckInstructionPush dload
"→ value	load a double value from a local variable #index
syn keyword bckInstructionPush aload
"→ objectref	load a reference onto the stack from a local variable #index
" }}}2 Stack push instructions end

" {{{2 Stack pop instructions
" pop stack
syn keyword bckInstructionPop istore
"value →	store int value into variable #index
syn keyword bckInstructionPop lstore
"value →	store a long value in a local variable #index
syn keyword bckInstructionPop fstore
"value →	store a float value into a local variable #index
syn keyword bckInstructionPop dstore
"value →	store a double value into a local variable #index
syn keyword bckInstructionPop astore
"objectref →	store a reference into a local variable #index
syn keyword bckInstructionPop istore_0
"value →	store int value into variable 0
syn keyword bckInstructionPop istore_1
"value →	store int value into variable 1
syn keyword bckInstructionPop istore_2
"value →	store int value into variable 2
syn keyword bckInstructionPop istore_3
"value →	store int value into variable 3
syn keyword bckInstructionPop lstore_0
"value →	store a long value in a local variable 0
syn keyword bckInstructionPop lstore_1
"value →	store a long value in a local variable 1
syn keyword bckInstructionPop lstore_2
"value →	store a long value in a local variable 2
syn keyword bckInstructionPop lstore_3
"value →	store a long value in a local variable 3
syn keyword bckInstructionPop fstore_0
"value →	store a float value into local variable 0
syn keyword bckInstructionPop fstore_1
"value →	store a float value into local variable 1
syn keyword bckInstructionPop fstore_2
"value →	store a float value into local variable 2
syn keyword bckInstructionPop fstore_3
"value →	store a float value into local variable 3
syn keyword bckInstructionPop dstore_0
"value →	store a double into local variable 0
syn keyword bckInstructionPop dstore_1
"value →	store a double into local variable 1
syn keyword bckInstructionPop dstore_2
"value →	store a double into local variable 2
syn keyword bckInstructionPop dstore_3
"value →	store a double into local variable 3
syn keyword bckInstructionPop astore_0
"objectref →	store a reference into local variable 0
syn keyword bckInstructionPop astore_1
"objectref →	store a reference into local variable 1
syn keyword bckInstructionPop astore_2
"objectref →	store a reference into local variable 2
syn keyword bckInstructionPop astore_3
"objectref →	store a reference into local variable 3
syn keyword bckInstructionPop iastore
"arrayref, index, value →	store an int into an array
syn keyword bckInstructionPop lastore
"arrayref, index, value →	store a long to an array
syn keyword bckInstructionPop fastore
"arrayref, index, value →	store a float in an array
syn keyword bckInstructionPop dastore
"arrayref, index, value →	store a double into an array
syn keyword bckInstructionPop aastore
"arrayref, index, value →	store into a reference in an array
syn keyword bckInstructionPop bastore
"arrayref, index, value →	store a byte or Boolean value into an array
syn keyword bckInstructionPop castore
"arrayref, index, value →	store a char into an array
syn keyword bckInstructionPop sastore
"arrayref, index, value →	store short to array
syn keyword bckInstructionPop pop
"value →	discard the top value on the stack
syn keyword bckInstructionPop pop2
"{value2, value1} →	discard the top two values on the stack (or one value, if it is a double or long)
" }}}2 Stack pop instructions end

" {{{2 Stack mod instructions
" modify stack
syn keyword bckInstructionMod iaload
"arrayref, index → value	load an int from an array
syn keyword bckInstructionMod laload
"arrayref, index → value	load a long from an array
syn keyword bckInstructionMod faload
"arrayref, index → value	load a float from an array
syn keyword bckInstructionMod daload
"arrayref, index → value	load a double from an array
syn keyword bckInstructionMod aaload
"arrayref, index → value	load onto the stack a reference from an array
syn keyword bckInstructionMod baload
"arrayref, index → value	load a byte or Boolean value from an array
syn keyword bckInstructionMod caload
"arrayref, index → value	load a char from an array
syn keyword bckInstructionMod saload
"arrayref, index → value	load short from array
syn keyword bckInstructionMod dup
"value → value, value	duplicate the value on top of the stack
syn keyword bckInstructionMod dup_x1
"value2, value1 → value1, value2, value1	insert a copy of the top value into the stack two values from the top. value1 and value2 must not be of the type double or long.
syn keyword bckInstructionMod dup_x2
"value3, value2, value1 → value1, value3, value2, value1	insert a copy of the top value into the stack two (if value2 is double or long it takes up the entry of value3, too) or three values (if value2 is neither double nor long) from the top
syn keyword bckInstructionMod dup2
"{value2, value1} → {value2, value1}, {value2, value1}	duplicate top two stack words (two values, if value1 is not double nor long; a single value, if value1 is double or long)
syn keyword bckInstructionMod dup2_x1
"value3, {value2, value1} → {value2, value1}, value3, {value2, value1}	duplicate two words and insert beneath third word (see explanation above)
syn keyword bckInstructionMod dup2_x2
"{value4, value3}, {value2, value1} → {value2, value1}, {value4, value3}, {value2, value1}	duplicate two words and insert beneath fourth word
syn keyword bckInstructionMod swap
"value2, value1 → value1, value2	swaps two top words on the stack (note that value1 and value2 must not be double or long)
syn keyword bckInstructionMod iadd
"value1, value2 → result	add two ints
syn keyword bckInstructionMod ladd
"value1, value2 → result	add two longs
syn keyword bckInstructionMod fadd
"value1, value2 → result	add two floats
syn keyword bckInstructionMod dadd
"value1, value2 → result	add two doubles
syn keyword bckInstructionMod isub
"value1, value2 → result	int subtract
syn keyword bckInstructionMod lsub
"value1, value2 → result	subtract two longs
syn keyword bckInstructionMod fsub
"value1, value2 → result	subtract two floats
syn keyword bckInstructionMod dsub
"value1, value2 → result	subtract a double from another
syn keyword bckInstructionMod imul
"value1, value2 → result	multiply two integers
syn keyword bckInstructionMod lmul
"value1, value2 → result	multiply two longs
syn keyword bckInstructionMod fmul
"value1, value2 → result	multiply two floats
syn keyword bckInstructionMod dmul
"value1, value2 → result	multiply two doubles
syn keyword bckInstructionMod idiv
"value1, value2 → result	divide two integers
syn keyword bckInstructionMod ldiv
"value1, value2 → result	divide two longs
syn keyword bckInstructionMod fdiv
"value1, value2 → result	divide two floats
syn keyword bckInstructionMod ddiv
"value1, value2 → result	divide two doubles
syn keyword bckInstructionMod irem
"value1, value2 → result	logical int remainder
syn keyword bckInstructionMod lrem
"value1, value2 → result	remainder of division of two longs
syn keyword bckInstructionMod frem
"value1, value2 → result	get the remainder from a division between two floats
syn keyword bckInstructionMod drem
"value1, value2 → result	get the remainder from a division between two doubles
syn keyword bckInstructionMod ineg
"value → result	negate int
syn keyword bckInstructionMod lneg
"value → result	negate a long
syn keyword bckInstructionMod fneg
"value → result	negate a float
syn keyword bckInstructionMod dneg
"value → result	negate a double
syn keyword bckInstructionMod ishl
"value1, value2 → result	int shift left
syn keyword bckInstructionMod lshl
"value1, value2 → result	bitwise shift left of a long value1 by int value2 positions
syn keyword bckInstructionMod ishr
"value1, value2 → result	int arithmetic shift right
syn keyword bckInstructionMod lshr
"value1, value2 → result	bitwise shift right of a long value1 by int value2 positions
syn keyword bckInstructionMod iushr
"value1, value2 → result	int logical shift right
syn keyword bckInstructionMod lushr
"value1, value2 → result	bitwise shift right of a long value1 by int value2 positions, unsigned
syn keyword bckInstructionMod iand
"value1, value2 → result	perform a bitwise and on two integers
syn keyword bckInstructionMod land
"value1, value2 → result	bitwise and of two longs
syn keyword bckInstructionMod ior
"value1, value2 → result	bitwise int or
syn keyword bckInstructionMod lor
"value1, value2 → result	bitwise or of two longs
syn keyword bckInstructionMod ixor
"value1, value2 → result	int xor
syn keyword bckInstructionMod lxor
"value1, value2 → result	bitwise exclusive or of two longs
syn keyword bckInstructionMod i2l
"value → result	convert an int into a long
syn keyword bckInstructionMod i2f
"value → result	convert an int into a float
syn keyword bckInstructionMod i2d
"value → result	convert an int into a double
syn keyword bckInstructionMod l2i
"value → result	convert a long to a int
syn keyword bckInstructionMod l2f
"value → result	convert a long to a float
syn keyword bckInstructionMod l2d
"value → result	convert a long to a double
syn keyword bckInstructionMod f2i
"value → result	convert a float to an int
syn keyword bckInstructionMod f2l
"value → result	convert a float to a long
syn keyword bckInstructionMod f2d
"value → result	convert a float to a double
syn keyword bckInstructionMod d2i
"value → result	convert a double to an int
syn keyword bckInstructionMod d2l
"value → result	convert a double to a long
syn keyword bckInstructionMod d2f
"value → result	convert a double to a float
syn keyword bckInstructionMod i2b
"value → result	convert an int into a byte
syn keyword bckInstructionMod i2c
"value → result	convert an int into a character
syn keyword bckInstructionMod i2s
"value → result	convert an int into a short
syn keyword bckInstructionMod lcmp
"value1, value2 → result	compare two longs values
syn keyword bckInstructionMod fcmpl
"value1, value2 → result	compare two floats
syn keyword bckInstructionMod fcmpg
"value1, value2 → result	compare two floats
syn keyword bckInstructionMod dcmpl
"value1, value2 → result	compare two doubles
syn keyword bckInstructionMod dcmpg
"value1, value2 → result	compare two doubles
"}}}2 Strack mod instructions end

" {{{2 Control flow branch instructions
" branch
syn keyword bckInstructionBranch ifeq
"value →	if value is 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch ifne
"value →	if value is not 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch iflt
"value →	if value is less than 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch ifge
"value →	if value is greater than or equal to 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch ifgt
"value →	if value is greater than 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch ifle
"value →	if value is less than or equal to 0, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmpeq
"value1, value2 →	if ints are equal, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmpne
"value1, value2 →	if ints are not equal, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmplt
"value1, value2 →	if value1 is less than value2, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmpge
"value1, value2 →	if value1 is greater than or equal to value2, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmpgt
"value1, value2 →	if value1 is greater than value2, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_icmple
"value1, value2 →	if value1 is less than or equal to value2, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_acmpeq
"value1, value2 →	if references are equal, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch if_acmpne
"value1, value2 →	if references are not equal, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch goto
"[no change]	goes to another instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch jsr
"→ address	jump to subroutine at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2) and place the return address on the stack
syn keyword bckInstructionBranch ret
"[No change]	continue execution from address taken from a local variable #index (the asymmetry with jsr is intentional)
syn keyword bckInstructionBranch tableswitch
"index →	continue execution from an address in the table at offset index
syn keyword bckInstructionBranch lookupswitch
"key →	a target address is looked up from a table using a key and execution continues from the instruction at that address
syn keyword bckInstructionBranch ireturn
"value → [empty]	return an integer from a method
syn keyword bckInstructionBranch lreturn
"value → [empty]	return a long value
syn keyword bckInstructionBranch freturn
"value → [empty]	return a float
syn keyword bckInstructionBranch dreturn
"value → [empty]	return a double from a method
syn keyword bckInstructionBranch areturn
"objectref → [empty]	return a reference from a method
syn keyword bckInstructionBranch return
"→ [empty]	return void from method
syn keyword bckInstructionBranch ifnull
"value →	if value is null, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch ifnonnull
"value →	if value is not null, branch to instruction at branchoffset (signed short constructed from unsigned bytes branchbyte1 << 8 + branchbyte2)
syn keyword bckInstructionBranch goto_w
"[no change]	goes to another instruction at branchoffset (signed int constructed from unsigned bytes branchbyte1 << 24 + branchbyte2 << 16 + branchbyte3 << 8 + branchbyte4)
syn keyword bckInstructionBranch jsr_w
"→ address	jump to subroutine at branchoffset (signed int constructed from unsigned bytes branchbyte1 << 24 + branchbyte2 << 16 + branchbyte3 << 8 + branchbyte4) and place the return address on the stack
" }}}2 Control flow branch instructions end

" {{{2 Metaprogramming, OOP-simplifying, and other instructions
" high level
syn keyword bckInstructionHigh getstatic
"→ value	get a static field value of a class, where the field is identified by field reference in the constant pool index (index1 << 8 + index2)
syn keyword bckInstructionHigh putstatic
"value →	set static field to value in a class, where the field is identified by a field reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh getfield
"objectref → value	get a field value of an object objectref, where the field is identified by field reference in the constant pool index (index1 << 8 + index2)
syn keyword bckInstructionHigh putfield
"objectref, value →	set field to value in an object objectref, where the field is identified by a field reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh invokevirtual
"objectref, [arg1, arg2, ...] →	invoke virtual method on object objectref, where the method is identified by method reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh invokespecial
"objectref, [arg1, arg2, ...] →	invoke instance method on object objectref, where the method is identified by method reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh invokestatic
"[arg1, arg2, ...] →	invoke a static method, where the method is identified by method reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh invokeinterface
"objectref, [arg1, arg2, ...] →	invokes an interface method on object objectref, where the interface method is identified by method reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh invokedynamic
"[arg1, [arg2 ...]] →	invokes a dynamic method identified by method reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh new
"→ objectref	create new object of type identified by class reference in constant pool index (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh newarray
"count → arrayref	create new array with count elements of primitive type identified by atype
syn keyword bckInstructionHigh anewarray
"count → arrayref	create a new array of references of length count and component type identified by the class reference index (indexbyte1 << 8 + indexbyte2) in the constant pool
syn keyword bckInstructionHigh arraylength
"arrayref → length	get the length of an array
syn keyword bckInstructionHigh athrow
"objectref → [empty], objectref	throws an error or exception (notice that the rest of the stack is cleared, leaving only a reference to the Throwable)
syn keyword bckInstructionHigh checkcast
"objectref → objectref	checks whether an objectref is of a certain type, the class reference of which is in the constant pool at index (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh instanceof
"objectref → result	determines if an object objectref is of a given type, identified by class reference index in constant pool (indexbyte1 << 8 + indexbyte2)
syn keyword bckInstructionHigh monitorenter
"objectref →	enter monitor for object ("grab the lock" - start of synchronized() section)
syn keyword bckInstructionHigh monitorexit
"objectref →	exit monitor for object ("release the lock" - end of synchronized() section)
syn keyword bckInstructionHigh wide
"[same as for corresponding instructions]	execute opcode, where opcode is either iload, fload, aload, lload, dload, istore, fstore, astore, lstore, dstore, or ret, but assume the index is 16 bit; or execute iinc, where the index is 16 bits and the constant to increment by is a signed 16 bit short
syn keyword bckInstructionHigh multianewarray
"count1, [count2,...] → arrayref	create a new array of dimensions dimensions with elements of type identified by class reference in constant pool index (indexbyte1 << 8 + indexbyte2); the sizes of each dimension is identified by count1, [count2, etc.]
" }}}2 Other instructions end

syn match bckPoolRef /\[[0-9]\+\]\s*$/
syn match bckInvoke /[_$a-zA-Z][_$a-zA-Z0-9]*\s*(/me=e-1

syn cluster bckInstructions contains=bckInstructionNop,bckInstructionPush,bckInstructionPop,bckInstructionMod,bckInstructionBranch,bckInstructionHigh,bckInvoke,bckPoolRef

" }}}1 Instructions end

" modifier keywords
syn keyword bckJavaKeyword transient strictfp serializable synchronized static final volatile protected public private abstract class interface implements enum extends this

" type names
syn keyword bckJavaType boolean char byte short int long float double void
syn match bckQualifiedType /[_$a-zA-Z][_$a-zA-Z0-9]*\(\.[_$a-zA-Z][_$a-zA-Z0-9]*\)\+\(\[\]\)\?/ contained


"syn region bckName start=/</ end=/>/
"<[^>]*>"

" invokestatic pkg.Class.fun(tp, tp) : returntype
syn region bckParams start=/(/ end=/)/ contains=bckJavaType,bckQualifiedType
syn match bckType /\s:\s*[_$a-zA-Z][_$a-zA-Z0-9]*/ms=s+2 contains=bckJavaType,bckQualifiedType

" Krak comments
syn match bckComment ";.*$"
syn cluster bckGlobal add=bckComment

" {{{1 Assembler directives

" JVM type descriptors
" V   void
" B   byte
" C   char
" D   double
" F   float
" I   int
" J   long
" Lxx instance of `xx`
" S   short
" Z   boolean
" [   array

" Field type: int test[] = [I
" Param list: (int, int[], Object) = (I[ILjava.lang.Object;)
" Method sig: void (int, int[], Object) = (I[ILjava.lang.Object;)V
syn match bckT_Type           /(B|C|D|F|I|J|S|Z|L[^;]+;)/ contained
syn match bckArray /\[+/ contained nextgroup=bckArray,bckT_Type
syn region bckSignature start="(" end=")" matchgroup=Special excludenl nextgroup=bckT_Type contains=NONE


syn keyword bckAssemblerDirective_global            .version
syn cluster bckGlobal                               add=bckAssemblerDirective_global

syn keyword bckFlagKeyword contained                public private protected static final super synchronized volatile bridge transient varargs native interface abstract strict synthetic annotation enum mandated

function! s:bckRegionDirective (name, contains)
   let synName = "bckB_".a:name
   let rWhite = "^\\s*"
   let begPat = "/".l:rWhite."\\.".a:name."/"
   let endPat = "/".l:rWhite."\\.end ".a:name."/"
   exe "syn region ".l:synName." matchgroup=bckBlockOuter start=".l:begPat." end=".l:endPat." contains=".a:contains." fold"
endfunction

" .linenumbertable ... .end linenumbertable
call s:bckRegionDirective("linenumbertable", "") " bckB_linenumbertable
" .end linenumbertable

" .code ... .end code
syn keyword bckAssemblerDirective_code contained .limit .stack
syn keyword bckKeyword_code stack locals
" Labels, e.g. ^L0: or ^name:
syn match   bckLabel /^\s*[A-Za-z0-9_]\+:/
syn cluster bckInside_code add=bckLabel,bckKeyword_code,bckAssemblerDirective_code
call s:bckRegionDirective("code",   "bckB_linenumbertable,@bckInstructions,@bckInside_code,@bckGlobal") " bckB_code
" .end code

" .method ... .end method

" hack to hilight the different parts of the method spec
syn match bckB_Method_Open /\\.method/ skipwhite nextgroup=bckB_Method_Vis
syn match bckB_Method_Name /(<clinit>|[^\s]+)/ contained skipwhite nextgroup=bckB_Method_TypeLeader
syn match bckB_Method_TypeLeader / : / contained skipwhite nextgroup=bckSignature
syn cluster bckB_MethodProlog add=bckB_Method_Open,bckB_Method_Name,bckB_Method_TypeLeader,bckSignature

"syn region bckB_MSig start=/(<clinit>|[^\s]+)/ end=":" skipwhite nextgroup=bckSignature
syn cluster bckName add=bckB_MSig,bckB_Method_Name

syn cluster bckInside_method add=bckFlagKeyword,bckName,bckB_MSig,@bckB_MethodProlog
call s:bckRegionDirective("method", "bckB_code,@bckInside_method,@bckGlobal") " bckB_method
".end method

" .class ... .end class
syn keyword bckAssemblerDirective_class contained .super .field .const .innerclasses .bootstrap .sourcefile
syn cluster bckInside_class add=bckAssemblerDirective_class
call s:bckRegionDirective("class",  "bckB_method,@bckInside_class,@bckGlobal") " bckB_class
" .end class

" .stack ... .end stack
syn keyword bckAssemblerDirective_class contained .super .field .const .innerclasses .bootstrap .sourcefile
syn cluster bckInside_class add=bckAssemblerDirective_class
call s:bckRegionDirective("stack",  "bckB_method,@bckInside_stack,@bckGlobal") " bckB_class
" .end stack


" }}}1 Assembler directives end

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_bck_syn_inits")
  if version < 508
    let did_bck_syn_inits = 1
    command! -nargs=+ HiLink hi link <args>
  else
    command! -nargs=+ HiLink hi def link <args>
  endif

  let did_bck_syntax_inits = 1
  HiLink bckComment                     Comment

  HiLink bckLabel                       Label

  HiLink bckPoolRef                     Identifier
  HiLink bckAssemblerDirective          Statement
  HiLink bckAssemblerDirective_global   bckAssemblerDirective
  HiLink bckAssemblerDirective_class    bckAssemblerDirective
  HiLink bckAssemblerDirective_method   bckAssemblerDirective
  HiLink bckAssemblerDirective_code     bckAssemblerDirective

  HiLink bckKeyword                     StorageClass
  HiLink bckKeyword_code                bckKeyword
  HiLink bckFlagKeyword                 Identifier

  HiLink bckBlockOuter                  bckAssemblerDirective
  HiLink bckBlockBody                   Normal
  HiLink bckB_class                     bckBlockBody
  HiLink bckB_method                    bckBlockBody
  HiLink bckB_code                      bckBlockBody
  HiLink bckB_linenumbertable           Comment

  HiLink bckInstruction                 Keyword
  HiLink bckInstructionNop              bckInstruction
  HiLink bckInstructionPush             bckInstruction
  HiLink bckInstructionPop              bckInstruction
  HiLink bckInstructionMod              bckInstruction
  HiLink bckInstructionBranch           bckInstruction
  HiLink bckInstructionHigh             bckInstruction

  HiLink bckInvoke                      Function
  HiLink bckJavaType                    Type
  HiLink bckQualifiedType               Type
  HiLink bckT_Type                      Type
  HiLink bckArray                       Type
  HiLink bckSignature                   Keyword

  HiLink bckSpecialChar                 PreProc
  HiLink bckString                      String

  HiLink bckName                        Identifier
  delcommand HiLink
endif
