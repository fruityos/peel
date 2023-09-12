; this code was generated by a tool. assemble with nasm.
bits 64

global pish_chdir
global pish_puts
global pish_str_equal
global pish_path
global pish_exec
global pish_parse_line
global nextArg
global main

pish_chdir:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	mov	rax, 0
	push	rax
	mov	rax, chdir
	push	rax
	mov	rax, 8
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setl	dl
	mov	rax, rdx
	test	rax, rax
	jz	pish_chdir_L0
	mov	rax, pish_puts
	push	rax
	mov	rax, 8
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_puts
	push	rax
	jmp	pish_chdir_L3
pish_chdir_L2:
	db	"?"
	db 0
pish_chdir_L3:
	mov	rax, pish_chdir_L2
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, putch
	push	rax
	mov	rax, 10
	push	rax
	pop	rdi
	pop	rax
	call	rax
	jmp pish_chdir_L1
pish_chdir_L0:
pish_chdir_L1:
	mov	rsp, rbp
	pop	rbp
	ret

pish_puts:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rax
	jmp	pish_puts_L1
pish_puts_L0:
	mov	rax, putch
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_puts_L1:
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	test	rax, rax
	jnz	pish_puts_L0
	mov	rsp, rbp
	pop	rbp
	ret

pish_str_equal:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rsi
	jmp	pish_str_equal_L1
pish_str_equal_L0:
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	xor	rdx, rdx
	test	rax, rax
	setz	dl
	mov	rax, rdx
	test	rax, rax
	jz	pish_str_equal_L2
	mov	rax, 1
	mov	rsp, rbp
	pop	rbp
	ret
	jmp pish_str_equal_L3
pish_str_equal_L2:
pish_str_equal_L3:
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_str_equal_L1:
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	sete	dl
	mov	rax, rdx
	test	rax, rax
	jnz	pish_str_equal_L0
	mov	rax, 0
	mov	rsp, rbp
	pop	rbp
	ret
	mov	rsp, rbp
	pop	rbp
	ret

pish_path:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rsi
	push	rdx
	push	rax
	jmp	pish_path_L1
pish_path_L0:
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_path_L1:
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	test	rax, rax
	jnz	pish_path_L0
	jmp	pish_path_L3
pish_path_L2:
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_path_L3:
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	test	rax, rax
	jnz	pish_path_L2
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 0
	pop	rdi
	mov	[rdi], rax
	mov	rsp, rbp
	pop	rbp
	ret

pish_exec:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rsi
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, fork
	push	rax
	pop	rax
	call	rax
	pop	rdi
	mov	[rdi], rax
	mov	rax, 0
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	sete	dl
	mov	rax, rdx
	test	rax, rax
	jz	pish_exec_L0
	mov	rax, exec
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_path
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	jmp	pish_exec_L3
pish_exec_L2:
	db	"./"
	db 0
pish_exec_L3:
	mov	rax, pish_exec_L2
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, exec
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_path
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	jmp	pish_exec_L5
pish_exec_L4:
	db	"/bin/"
	db 0
pish_exec_L5:
	mov	rax, pish_exec_L4
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, exec
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_puts
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_puts
	push	rax
	jmp	pish_exec_L7
pish_exec_L6:
	db	"?"
	db 0
pish_exec_L7:
	mov	rax, pish_exec_L6
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, putch
	push	rax
	mov	rax, 10
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, exit
	push	rax
	pop	rax
	call	rax
	jmp pish_exec_L1
pish_exec_L0:
	mov	rax, waitpid
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
pish_exec_L1:
	mov	rsp, rbp
	pop	rbp
	ret

pish_parse_line:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rsi
	push	rax
	push	rax
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	jmp	pish_parse_line_L1
pish_parse_line_L0:
	jmp	pish_parse_line_L3
pish_parse_line_L2:
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 256
	neg	rax
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_parse_line_L3:
	mov	rax, 32
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	sete	dl
	mov	rax, rdx
	test	rax, rax
	jnz	pish_parse_line_L2
	mov	rax, 10
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	test	rax, rax
	jz	pish_parse_line_L4
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	push	rax
	mov	rax, 8
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	jmp pish_parse_line_L5
pish_parse_line_L4:
pish_parse_line_L5:
	jmp	pish_parse_line_L7
pish_parse_line_L6:
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
pish_parse_line_L7:
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 10
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	push	rax
	mov	rax, 32
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	test	rax, rax
	jnz	pish_parse_line_L6
pish_parse_line_L1:
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 10
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	test	rax, rax
	jnz	pish_parse_line_L0
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 0
	pop	rdi
	mov	[rdi], rax
	mov	rsp, rbp
	pop	rbp
	ret

nextArg:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	jmp	nextArg_L1
nextArg_L0:
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
nextArg_L1:
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	test	rax, rax
	jnz	nextArg_L0
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	mov	rsp, rbp
	pop	rbp
	ret
	mov	rsp, rbp
	pop	rbp
	ret

main:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax
	push	rdi
	push	rsi
	push	rax
	push	rax
	push	rax
	push	rax
	push	rax
	push	rax
	push	rax
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	push	rax
	mov	rax, brk
	push	rax
	mov	rax, 1
	neg	rax
	push	rax
	pop	rdi
	pop	rax
	call	rax
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	push	rax
	mov	rax, 1024
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	push	rax
	mov	rax, 1024
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 64
	sub	rax, rdi
	push	rax
	mov	rax, 1024
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, brk
	push	rax
	mov	rax, 1024
	push	rax
	mov	rax, rbp
	mov	rdi, 64
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, 2
	push	rax
	mov	rax, rbp
	mov	rdi, 8
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	sete	dl
	mov	rax, rdx
	test	rax, rax
	jz	main_L0
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, open
	push	rax
	mov	rax, nextArg
	push	rax
	mov	rax, rbp
	mov	rdi, 16
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	push	rax
	mov	rax, 0
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	pop	rdi
	mov	[rdi], rax
	jmp main_L1
main_L0:
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	push	rax
	mov	rax, 0
	pop	rdi
	mov	[rdi], rax
main_L1:
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	push	rax
	mov	rax, 32
	pop	rdi
	mov	[rdi], rax
	jmp	main_L3
main_L2:
	mov	rax, 0
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	sete	dl
	mov	rax, rdx
	test	rax, rax
	jz	main_L4
	mov	rax, getcwd
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 1024
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, pish_puts
	push	rax
	mov	rax, rbp
	mov	rdi, 32
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, putch
	push	rax
	jmp	main_L7
main_L6:
	db	">"
	db 0
main_L7:
	mov	rax, main_L6
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, putch
	push	rax
	mov	rax, 32
	push	rax
	pop	rdi
	pop	rax
	call	rax
	jmp main_L5
main_L4:
main_L5:
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, fgetch
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 48
	sub	rax, rdi
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	jmp	main_L9
main_L8:
	mov	rax, rbp
	mov	rdi, 48
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 48
	sub	rax, rdi
	push	rax
	mov	rax, 1
	push	rax
	mov	rax, rbp
	mov	rdi, 48
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	add	rax, rdi
	pop	rdi
	mov	[rdi], rax
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, fgetch
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	pop	rdi
	and	rax, rdi
	pop	rdi
	mov	[rdi], rax
main_L9:
	mov	rax, 10
	push	rax
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	push	rax
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	test	rax, rax
	jnz	main_L8
	mov	rax, rbp
	mov	rdi, 48
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, 0
	pop	rdi
	mov	[rdi], rax
	mov	rax, pish_parse_line
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	mov	rax, 255
	push	rax
	jmp	main_L11
main_L10:
	db	"#"
	db 0
main_L11:
	mov	rax, main_L10
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	push	rax
	mov	rax, 255
	push	rax
	mov	rax, rbp
	mov	rdi, 40
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	and	rax, rdi
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setne	dl
	mov	rax, rdx
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	test	rax, rax
	jz	main_L12
	mov	rax, rbp
	mov	rdi, 80
	sub	rax, rdi
	push	rax
	mov	rax, 0
	pop	rdi
	mov	[rdi], rax
	mov	rax, pish_str_equal
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	jmp	main_L15
main_L14:
	db	"exit"
	db 0
main_L15:
	mov	rax, main_L14
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	test	rax, rax
	jz	main_L16
	mov	rax, exit
	push	rax
	pop	rax
	call	rax
	mov	rax, rbp
	mov	rdi, 80
	sub	rax, rdi
	push	rax
	mov	rax, 1
	pop	rdi
	mov	[rdi], rax
	jmp main_L17
main_L16:
main_L17:
	mov	rax, pish_str_equal
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	mov	rax, [rax]
	push	rax
	jmp	main_L19
main_L18:
	db	"cd"
	db 0
main_L19:
	mov	rax, main_L18
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	test	rax, rax
	jz	main_L20
	mov	rax, pish_chdir
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rax, rbp
	mov	rdi, 80
	sub	rax, rdi
	push	rax
	mov	rax, 1
	pop	rdi
	mov	[rdi], rax
	jmp main_L21
main_L20:
main_L21:
	mov	rax, rbp
	mov	rdi, 80
	sub	rax, rdi
	mov	rax, [rax]
	xor	rdx, rdx
	test	rax, rax
	setz	dl
	mov	rax, rdx
	test	rax, rax
	jz	main_L22
	mov	rax, pish_exec
	push	rax
	mov	rax, rbp
	mov	rdi, 64
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	mov	rax, rbp
	mov	rdi, 56
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rsi
	pop	rdi
	pop	rax
	call	rax
	jmp main_L23
main_L22:
main_L23:
	jmp main_L13
main_L12:
main_L13:
main_L3:
	mov	rax, 0
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	cmp	rax, rdi
	setge	dl
	mov	rax, rdx
	push	rax
	mov	rax, rbp
	mov	rdi, 72
	sub	rax, rdi
	mov	rax, [rax]
	pop	rdi
	xor	rdx, rdx
	test	rax, rax
	setnz	dl
	mov	rax, rdx
	xor	rdx, rdx
	test	rdi, rdi
	setnz	dl
	mov	rdi, rdx
	and	rax, rdi
	test	rax, rax
	jnz	main_L2
	mov	rax, close
	push	rax
	mov	rax, rbp
	mov	rdi, 24
	sub	rax, rdi
	mov	rax, [rax]
	push	rax
	pop	rdi
	pop	rax
	call	rax
	mov	rsp, rbp
	pop	rbp
	ret
