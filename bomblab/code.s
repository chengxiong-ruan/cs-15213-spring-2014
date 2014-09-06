
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a28 <_init>:
  400a28:	48 83 ec 08          	sub    $0x8,%rsp
  400a2c:	e8 0b 02 00 00       	callq  400c3c <call_gmon_start>
  400a31:	e8 8a 02 00 00       	callq  400cc0 <frame_dummy>
  400a36:	e8 b5 1a 00 00       	callq  4024f0 <__do_global_ctors_aux>
  400a3b:	48 83 c4 08          	add    $0x8,%rsp
  400a3f:	c3                   	retq   

Disassembly of section .plt:

0000000000400a40 <printf@plt-0x10>:
  400a40:	ff 35 02 29 20 00    	pushq  0x202902(%rip)        # 603348 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a46:	ff 25 04 29 20 00    	jmpq   *0x202904(%rip)        # 603350 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a50 <printf@plt>:
  400a50:	ff 25 02 29 20 00    	jmpq   *0x202902(%rip)        # 603358 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a56:	68 00 00 00 00       	pushq  $0x0
  400a5b:	e9 e0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a60 <memset@plt>:
  400a60:	ff 25 fa 28 20 00    	jmpq   *0x2028fa(%rip)        # 603360 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a66:	68 01 00 00 00       	pushq  $0x1
  400a6b:	e9 d0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a70 <close@plt>:
  400a70:	ff 25 f2 28 20 00    	jmpq   *0x2028f2(%rip)        # 603368 <_GLOBAL_OFFSET_TABLE_+0x28>
  400a76:	68 02 00 00 00       	pushq  $0x2
  400a7b:	e9 c0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a80 <gethostbyname@plt>:
  400a80:	ff 25 ea 28 20 00    	jmpq   *0x2028ea(%rip)        # 603370 <_GLOBAL_OFFSET_TABLE_+0x30>
  400a86:	68 03 00 00 00       	pushq  $0x3
  400a8b:	e9 b0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a90 <puts@plt>:
  400a90:	ff 25 e2 28 20 00    	jmpq   *0x2028e2(%rip)        # 603378 <_GLOBAL_OFFSET_TABLE_+0x38>
  400a96:	68 04 00 00 00       	pushq  $0x4
  400a9b:	e9 a0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400aa0 <exit@plt>:
  400aa0:	ff 25 da 28 20 00    	jmpq   *0x2028da(%rip)        # 603380 <_GLOBAL_OFFSET_TABLE_+0x40>
  400aa6:	68 05 00 00 00       	pushq  $0x5
  400aab:	e9 90 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ab0 <strcasecmp@plt>:
  400ab0:	ff 25 d2 28 20 00    	jmpq   *0x2028d2(%rip)        # 603388 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ab6:	68 06 00 00 00       	pushq  $0x6
  400abb:	e9 80 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ac0 <read@plt>:
  400ac0:	ff 25 ca 28 20 00    	jmpq   *0x2028ca(%rip)        # 603390 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ac6:	68 07 00 00 00       	pushq  $0x7
  400acb:	e9 70 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ad0 <fopen@plt>:
  400ad0:	ff 25 c2 28 20 00    	jmpq   *0x2028c2(%rip)        # 603398 <_GLOBAL_OFFSET_TABLE_+0x58>
  400ad6:	68 08 00 00 00       	pushq  $0x8
  400adb:	e9 60 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ae0 <__libc_start_main@plt>:
  400ae0:	ff 25 ba 28 20 00    	jmpq   *0x2028ba(%rip)        # 6033a0 <_GLOBAL_OFFSET_TABLE_+0x60>
  400ae6:	68 09 00 00 00       	pushq  $0x9
  400aeb:	e9 50 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400af0 <fgets@plt>:
  400af0:	ff 25 b2 28 20 00    	jmpq   *0x2028b2(%rip)        # 6033a8 <_GLOBAL_OFFSET_TABLE_+0x68>
  400af6:	68 0a 00 00 00       	pushq  $0xa
  400afb:	e9 40 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b00 <bcopy@plt>:
  400b00:	ff 25 aa 28 20 00    	jmpq   *0x2028aa(%rip)        # 6033b0 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b06:	68 0b 00 00 00       	pushq  $0xb
  400b0b:	e9 30 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b10 <__ctype_b_loc@plt>:
  400b10:	ff 25 a2 28 20 00    	jmpq   *0x2028a2(%rip)        # 6033b8 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b16:	68 0c 00 00 00       	pushq  $0xc
  400b1b:	e9 20 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b20 <sprintf@plt>:
  400b20:	ff 25 9a 28 20 00    	jmpq   *0x20289a(%rip)        # 6033c0 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b26:	68 0d 00 00 00       	pushq  $0xd
  400b2b:	e9 10 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b30 <__strtol_internal@plt>:
  400b30:	ff 25 92 28 20 00    	jmpq   *0x202892(%rip)        # 6033c8 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b36:	68 0e 00 00 00       	pushq  $0xe
  400b3b:	e9 00 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b40 <sscanf@plt>:
  400b40:	ff 25 8a 28 20 00    	jmpq   *0x20288a(%rip)        # 6033d0 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b46:	68 0f 00 00 00       	pushq  $0xf
  400b4b:	e9 f0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b50 <sleep@plt>:
  400b50:	ff 25 82 28 20 00    	jmpq   *0x202882(%rip)        # 6033d8 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b56:	68 10 00 00 00       	pushq  $0x10
  400b5b:	e9 e0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b60 <connect@plt>:
  400b60:	ff 25 7a 28 20 00    	jmpq   *0x20287a(%rip)        # 6033e0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b66:	68 11 00 00 00       	pushq  $0x11
  400b6b:	e9 d0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b70 <gethostname@plt>:
  400b70:	ff 25 72 28 20 00    	jmpq   *0x202872(%rip)        # 6033e8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400b76:	68 12 00 00 00       	pushq  $0x12
  400b7b:	e9 c0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b80 <signal@plt>:
  400b80:	ff 25 6a 28 20 00    	jmpq   *0x20286a(%rip)        # 6033f0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400b86:	68 13 00 00 00       	pushq  $0x13
  400b8b:	e9 b0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b90 <socket@plt>:
  400b90:	ff 25 62 28 20 00    	jmpq   *0x202862(%rip)        # 6033f8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400b96:	68 14 00 00 00       	pushq  $0x14
  400b9b:	e9 a0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ba0 <getenv@plt>:
  400ba0:	ff 25 5a 28 20 00    	jmpq   *0x20285a(%rip)        # 603400 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ba6:	68 15 00 00 00       	pushq  $0x15
  400bab:	e9 90 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bb0 <alarm@plt>:
  400bb0:	ff 25 52 28 20 00    	jmpq   *0x202852(%rip)        # 603408 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bb6:	68 16 00 00 00       	pushq  $0x16
  400bbb:	e9 80 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 4a 28 20 00    	jmpq   *0x20284a(%rip)        # 603410 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bc6:	68 17 00 00 00       	pushq  $0x17
  400bcb:	e9 70 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bd0 <strcpy@plt>:
  400bd0:	ff 25 42 28 20 00    	jmpq   *0x202842(%rip)        # 603418 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400bd6:	68 18 00 00 00       	pushq  $0x18
  400bdb:	e9 60 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400be0 <fprintf@plt>:
  400be0:	ff 25 3a 28 20 00    	jmpq   *0x20283a(%rip)        # 603420 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400be6:	68 19 00 00 00       	pushq  $0x19
  400beb:	e9 50 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bf0 <write@plt>:
  400bf0:	ff 25 32 28 20 00    	jmpq   *0x202832(%rip)        # 603428 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400bf6:	68 1a 00 00 00       	pushq  $0x1a
  400bfb:	e9 40 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400c00 <fflush@plt>:
  400c00:	ff 25 2a 28 20 00    	jmpq   *0x20282a(%rip)        # 603430 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c06:	68 1b 00 00 00       	pushq  $0x1b
  400c0b:	e9 30 fe ff ff       	jmpq   400a40 <_init+0x18>

Disassembly of section .text:

0000000000400c10 <_start>:
  400c10:	31 ed                	xor    %ebp,%ebp
  400c12:	49 89 d1             	mov    %rdx,%r9
  400c15:	5e                   	pop    %rsi
  400c16:	48 89 e2             	mov    %rsp,%rdx
  400c19:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c1d:	50                   	push   %rax
  400c1e:	54                   	push   %rsp
  400c1f:	49 c7 c0 50 24 40 00 	mov    $0x402450,%r8
  400c26:	48 c7 c1 60 24 40 00 	mov    $0x402460,%rcx
  400c2d:	48 c7 c7 e8 0c 40 00 	mov    $0x400ce8,%rdi
  400c34:	e8 a7 fe ff ff       	callq  400ae0 <__libc_start_main@plt>
  400c39:	f4                   	hlt    
  400c3a:	90                   	nop
  400c3b:	90                   	nop

0000000000400c3c <call_gmon_start>:
  400c3c:	48 83 ec 08          	sub    $0x8,%rsp
  400c40:	48 8b 05 f1 26 20 00 	mov    0x2026f1(%rip),%rax        # 603338 <_DYNAMIC+0x190>
  400c47:	48 85 c0             	test   %rax,%rax
  400c4a:	74 02                	je     400c4e <call_gmon_start+0x12>
  400c4c:	ff d0                	callq  *%rax
  400c4e:	48 83 c4 08          	add    $0x8,%rsp
  400c52:	c3                   	retq   
  400c53:	90                   	nop
  400c54:	90                   	nop
  400c55:	90                   	nop
  400c56:	90                   	nop
  400c57:	90                   	nop
  400c58:	90                   	nop
  400c59:	90                   	nop
  400c5a:	90                   	nop
  400c5b:	90                   	nop
  400c5c:	90                   	nop
  400c5d:	90                   	nop
  400c5e:	90                   	nop
  400c5f:	90                   	nop

0000000000400c60 <__do_global_dtors_aux>:
  400c60:	55                   	push   %rbp
  400c61:	48 89 e5             	mov    %rsp,%rbp
  400c64:	53                   	push   %rbx
  400c65:	48 83 ec 08          	sub    $0x8,%rsp
  400c69:	80 3d f0 34 20 00 00 	cmpb   $0x0,0x2034f0(%rip)        # 604160 <completed.6145>
  400c70:	75 44                	jne    400cb6 <__do_global_dtors_aux+0x56>
  400c72:	b8 98 31 60 00       	mov    $0x603198,%eax
  400c77:	48 2d 90 31 60 00    	sub    $0x603190,%rax
  400c7d:	48 c1 f8 03          	sar    $0x3,%rax
  400c81:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  400c85:	48 8b 05 cc 34 20 00 	mov    0x2034cc(%rip),%rax        # 604158 <dtor_idx.6147>
  400c8c:	48 39 c3             	cmp    %rax,%rbx
  400c8f:	76 1e                	jbe    400caf <__do_global_dtors_aux+0x4f>
  400c91:	48 83 c0 01          	add    $0x1,%rax
  400c95:	48 89 05 bc 34 20 00 	mov    %rax,0x2034bc(%rip)        # 604158 <dtor_idx.6147>
  400c9c:	ff 14 c5 90 31 60 00 	callq  *0x603190(,%rax,8)
  400ca3:	48 8b 05 ae 34 20 00 	mov    0x2034ae(%rip),%rax        # 604158 <dtor_idx.6147>
  400caa:	48 39 c3             	cmp    %rax,%rbx
  400cad:	77 e2                	ja     400c91 <__do_global_dtors_aux+0x31>
  400caf:	c6 05 aa 34 20 00 01 	movb   $0x1,0x2034aa(%rip)        # 604160 <completed.6145>
  400cb6:	48 83 c4 08          	add    $0x8,%rsp
  400cba:	5b                   	pop    %rbx
  400cbb:	c9                   	leaveq 
  400cbc:	c3                   	retq   
  400cbd:	0f 1f 00             	nopl   (%rax)

0000000000400cc0 <frame_dummy>:
  400cc0:	55                   	push   %rbp
  400cc1:	48 83 3d d7 24 20 00 	cmpq   $0x0,0x2024d7(%rip)        # 6031a0 <__JCR_END__>
  400cc8:	00 
  400cc9:	48 89 e5             	mov    %rsp,%rbp
  400ccc:	74 16                	je     400ce4 <frame_dummy+0x24>
  400cce:	b8 00 00 00 00       	mov    $0x0,%eax
  400cd3:	48 85 c0             	test   %rax,%rax
  400cd6:	74 0c                	je     400ce4 <frame_dummy+0x24>
  400cd8:	bf a0 31 60 00       	mov    $0x6031a0,%edi
  400cdd:	49 89 c3             	mov    %rax,%r11
  400ce0:	c9                   	leaveq 
  400ce1:	41 ff e3             	jmpq   *%r11
  400ce4:	c9                   	leaveq 
  400ce5:	c3                   	retq   
  400ce6:	90                   	nop
  400ce7:	90                   	nop

0000000000400ce8 <main>:
  400ce8:	53                   	push   %rbx
  400ce9:	48 89 f3             	mov    %rsi,%rbx                  #second argument to rbx
  400cec:	83 ff 01             	cmp    $0x1,%edi                  #check argument number = 1
  400cef:	75 10                	jne    400d01 <main+0x19>
  400cf1:	48 8b 05 48 34 20 00 	mov    0x203448(%rip),%rax        # 604140 <__bss_start>
  400cf8:	48 89 05 69 34 20 00 	mov    %rax,0x203469(%rip)        # 604168 <infile>
  400cff:	eb 56                	jmp    400d57 <main+0x6f>
  400d01:	83 ff 02             	cmp    $0x2,%edi                  #check argument number = 2
  400d04:	75 35                	jne    400d3b <main+0x53>
  400d06:	be 50 25 40 00       	mov    $0x402550,%esi
  400d0b:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  400d0f:	e8 bc fd ff ff       	callq  400ad0 <fopen@plt>
  400d14:	48 89 05 4d 34 20 00 	mov    %rax,0x20344d(%rip)        # 604168 <infile>
  400d1b:	48 85 c0             	test   %rax,%rax
  400d1e:	75 37                	jne    400d57 <main+0x6f>
  400d20:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400d24:	48 8b 33             	mov    (%rbx),%rsi
  400d27:	bf 52 25 40 00       	mov    $0x402552,%edi
  400d2c:	e8 1f fd ff ff       	callq  400a50 <printf@plt>
  400d31:	bf 08 00 00 00       	mov    $0x8,%edi
  400d36:	e8 65 fd ff ff       	callq  400aa0 <exit@plt>
  400d3b:	48 8b 36             	mov    (%rsi),%rsi
  400d3e:	bf 6f 25 40 00       	mov    $0x40256f,%edi
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	e8 03 fd ff ff       	callq  400a50 <printf@plt>
  400d4d:	bf 08 00 00 00       	mov    $0x8,%edi
  400d52:	e8 49 fd ff ff       	callq  400aa0 <exit@plt>
  400d57:	e8 41 09 00 00       	callq  40169d <initialize_bomb>   # call initialize_bomb
  400d5c:	bf d8 25 40 00       	mov    $0x4025d8,%edi
  400d61:	e8 2a fd ff ff       	callq  400a90 <puts@plt>
  400d66:	bf 18 26 40 00       	mov    $0x402618,%edi
  400d6b:	e8 20 fd ff ff       	callq  400a90 <puts@plt>          # print two lines of string 
  400d70:	e8 fe 07 00 00       	callq  401573 <read_line>
  400d75:	48 89 c7             	mov    %rax,%rdi
  400d78:	e8 db 04 00 00       	callq  401258 <phase_1>           # call phase_1, string is in %rdi
  400d7d:	e8 6f 06 00 00       	callq  4013f1 <phase_defused>
  400d82:	bf 48 26 40 00       	mov    $0x402648,%edi
  400d87:	e8 04 fd ff ff       	callq  400a90 <puts@plt>
  400d8c:	e8 e2 07 00 00       	callq  401573 <read_line>
  400d91:	48 89 c7             	mov    %rax,%rdi
  400d94:	e8 5c 02 00 00       	callq  400ff5 <phase_2>
  400d99:	e8 53 06 00 00       	callq  4013f1 <phase_defused>
  400d9e:	bf 89 25 40 00       	mov    $0x402589,%edi
  400da3:	e8 e8 fc ff ff       	callq  400a90 <puts@plt>
  400da8:	e8 c6 07 00 00       	callq  401573 <read_line>
  400dad:	48 89 c7             	mov    %rax,%rdi
  400db0:	e8 5c 03 00 00       	callq  401111 <phase_3>
  400db5:	e8 37 06 00 00       	callq  4013f1 <phase_defused>
  400dba:	bf a7 25 40 00       	mov    $0x4025a7,%edi
  400dbf:	e8 cc fc ff ff       	callq  400a90 <puts@plt>
  400dc4:	e8 aa 07 00 00       	callq  401573 <read_line>
  400dc9:	48 89 c7             	mov    %rax,%rdi
  400dcc:	e8 e0 02 00 00       	callq  4010b1 <phase_4>
  400dd1:	e8 1b 06 00 00       	callq  4013f1 <phase_defused>
  400dd6:	bf 78 26 40 00       	mov    $0x402678,%edi
  400ddb:	e8 b0 fc ff ff       	callq  400a90 <puts@plt>
  400de0:	e8 8e 07 00 00       	callq  401573 <read_line>
  400de5:	48 89 c7             	mov    %rax,%rdi
  400de8:	e8 51 02 00 00       	callq  40103e <phase_5>
  400ded:	e8 ff 05 00 00       	callq  4013f1 <phase_defused>
  400df2:	bf b6 25 40 00       	mov    $0x4025b6,%edi
  400df7:	e8 94 fc ff ff       	callq  400a90 <puts@plt>
  400dfc:	e8 72 07 00 00       	callq  401573 <read_line>
  400e01:	48 89 c7             	mov    %rax,%rdi
  400e04:	e8 d5 00 00 00       	callq  400ede <phase_6>
  400e09:	e8 e3 05 00 00       	callq  4013f1 <phase_defused>
  400e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400e13:	5b                   	pop    %rbx
  400e14:	c3                   	retq   
  400e15:	90                   	nop
  400e16:	90                   	nop
  400e17:	90                   	nop
  400e18:	90                   	nop
  400e19:	90                   	nop
  400e1a:	90                   	nop
  400e1b:	90                   	nop
  400e1c:	90                   	nop
  400e1d:	90                   	nop
  400e1e:	90                   	nop
  400e1f:	90                   	nop

0000000000400e20 <func4>:
  400e20:	53                   	push   %rbx
  400e21:	89 d1                	mov    %edx,%ecx
  400e23:	29 f2                	sub    %esi,%edx
  400e25:	89 d0                	mov    %edx,%eax
  400e27:	c1 e8 1f             	shr    $0x1f,%eax
  400e2a:	01 d0                	add    %edx,%eax
  400e2c:	d1 f8                	sar    %eax
  400e2e:	8d 1c 30             	lea    (%rax,%rsi,1),%ebx
  400e31:	39 fb                	cmp    %edi,%ebx
  400e33:	7e 0c                	jle    400e41 <func4+0x21>
  400e35:	8d 53 ff             	lea    -0x1(%rbx),%edx
  400e38:	e8 e3 ff ff ff       	callq  400e20 <func4>
  400e3d:	01 c3                	add    %eax,%ebx
  400e3f:	eb 10                	jmp    400e51 <func4+0x31>
  400e41:	39 fb                	cmp    %edi,%ebx
  400e43:	7d 0c                	jge    400e51 <func4+0x31>
  400e45:	8d 73 01             	lea    0x1(%rbx),%esi
  400e48:	89 ca                	mov    %ecx,%edx
  400e4a:	e8 d1 ff ff ff       	callq  400e20 <func4>
  400e4f:	01 c3                	add    %eax,%ebx
  400e51:	89 d8                	mov    %ebx,%eax
  400e53:	5b                   	pop    %rbx
  400e54:	c3                   	retq   

0000000000400e55 <fun7>:
  400e55:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400e5a:	48 85 ff             	test   %rdi,%rdi
  400e5d:	74 28                	je     400e87 <fun7+0x32>
  400e5f:	8b 17                	mov    (%rdi),%edx
  400e61:	39 f2                	cmp    %esi,%edx
  400e63:	7e 0c                	jle    400e71 <fun7+0x1c>
  400e65:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400e69:	e8 e7 ff ff ff       	callq  400e55 <fun7>
  400e6e:	01 c0                	add    %eax,%eax
  400e70:	c3                   	retq   
  400e71:	b8 00 00 00 00       	mov    $0x0,%eax
  400e76:	39 f2                	cmp    %esi,%edx
  400e78:	74 0d                	je     400e87 <fun7+0x32>
  400e7a:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400e7e:	e8 d2 ff ff ff       	callq  400e55 <fun7>
  400e83:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400e87:	f3 c3                	repz retq 

0000000000400e89 <secret_phase>:
  400e89:	53                   	push   %rbx
  400e8a:	e8 e4 06 00 00       	callq  401573 <read_line>
  400e8f:	48 89 c7             	mov    %rax,%rdi
  400e92:	b9 00 00 00 00       	mov    $0x0,%ecx
  400e97:	ba 0a 00 00 00       	mov    $0xa,%edx
  400e9c:	be 00 00 00 00       	mov    $0x0,%esi
  400ea1:	e8 8a fc ff ff       	callq  400b30 <__strtol_internal@plt>
  400ea6:	89 c3                	mov    %eax,%ebx
  400ea8:	8d 40 ff             	lea    -0x1(%rax),%eax
  400eab:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400eb0:	76 05                	jbe    400eb7 <secret_phase+0x2e>
  400eb2:	e8 c6 05 00 00       	callq  40147d <explode_bomb>
  400eb7:	89 de                	mov    %ebx,%esi
  400eb9:	bf a0 3e 60 00       	mov    $0x603ea0,%edi
  400ebe:	e8 92 ff ff ff       	callq  400e55 <fun7>
  400ec3:	83 f8 04             	cmp    $0x4,%eax
  400ec6:	74 05                	je     400ecd <secret_phase+0x44>
  400ec8:	e8 b0 05 00 00       	callq  40147d <explode_bomb>
  400ecd:	bf a0 26 40 00       	mov    $0x4026a0,%edi
  400ed2:	e8 b9 fb ff ff       	callq  400a90 <puts@plt>
  400ed7:	e8 15 05 00 00       	callq  4013f1 <phase_defused>
  400edc:	5b                   	pop    %rbx
  400edd:	c3                   	retq   

0000000000400ede <phase_6>:
  400ede:	41 57                	push   %r15
  400ee0:	41 56                	push   %r14
  400ee2:	41 55                	push   %r13
  400ee4:	41 54                	push   %r12
  400ee6:	55                   	push   %rbp
  400ee7:	53                   	push   %rbx
  400ee8:	48 83 ec 58          	sub    $0x58,%rsp
  400eec:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  400ef1:	e8 bd 05 00 00       	callq  4014b3 <read_six_numbers>
  400ef6:	41 bd 00 00 00 00    	mov    $0x0,%r13d                 #r13=0
  400efc:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14            #r14=rsp+0x30
  400f01:	4d 89 f7             	mov    %r14,%r15                  #r15=rsp+0x30
  400f04:	4d 89 ec             	mov    %r13,%r12                  #r12=r13  （跳转到这里）
  400f07:	43 8b 04 ae          	mov    (%r14,%r13,4),%eax         #eax=rsp+0x30
  400f0b:	83 e8 01             	sub    $0x1,%eax                  #eax=num1-1
  400f0e:	83 f8 05             	cmp    $0x5,%eax                  #eax=num1-1<=5
  400f11:	76 05                	jbe    400f18 <phase_6+0x3a>
  400f13:	e8 65 05 00 00       	callq  40147d <explode_bomb>
  400f18:	41 8d 5d 01          	lea    0x1(%r13),%ebx             #ebx=1
  400f1c:	49 83 fd 05          	cmp    $0x5,%r13                  #看看是不是已经比较到第5个数字了
  400f20:	0f 84 ac 00 00 00    	je     400fd2 <phase_6+0xf4>      #(已经是最后一个数字了，就跳转到400fd2)
  400f26:	4c 89 fd             	mov    %r15,%rbp                  #rbp=rsp+0x30
  400f29:	48 63 d3             	movslq %ebx,%rdx                  #rdx=ebx(跳转到这里)
  400f2c:	42 8b 44 a5 00       	mov    0x0(%rbp,%r12,4),%eax      #eax=num1
  400f31:	3b 44 94 30          	cmp    0x30(%rsp,%rdx,4),%eax     #比较num1和num2，不能相等num2不能和其他数字相等
  400f35:	75 05                	jne    400f3c <phase_6+0x5e>
  400f37:	e8 41 05 00 00       	callq  40147d <explode_bomb>
  400f3c:	83 c3 01             	add    $0x1,%ebx                  #ebx=ebx+1
  400f3f:	83 fb 05             	cmp    $0x5,%ebx                  #看看是不是已经比较到第5个数字了
  400f42:	7e e5                	jle    400f29 <phase_6+0x4b>      #如果ebx<=5，继续比较
  400f44:	49 83 c5 01          	add    $0x1,%r13                  #r13=r13+1 继续前面的操作
  400f48:	eb ba                	jmp    400f04 <phase_6+0x26>
  400f4a:	48 8b 76 08          	mov    0x8(%rsi),%rsi
  400f4e:	83 c2 01             	add    $0x1,%edx
  400f51:	48 63 c1             	movslq %ecx,%rax                  #edx=1, esi=0x603cd0, ecx=0
  400f54:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx     #rax=ecx
  400f58:	7c f0                	jl     400f4a <phase_6+0x6c>      #edx要等于其中一个数
  400f5a:	48 89 34 c4          	mov    %rsi,(%rsp,%rax,8)         #num=1指向0x603cd0数组第0个元素,rsp存6个地址,指向数组的(num-1)
  400f5e:	83 c1 01             	add    $0x1,%ecx
  400f61:	83 f9 05             	cmp    $0x5,%ecx
  400f64:	7f 0c                	jg     400f72 <phase_6+0x94>
  400f66:	ba 01 00 00 00       	mov    $0x1,%edx
  400f6b:	be d0 3c 60 00       	mov    $0x603cd0,%esi
  400f70:	eb df                	jmp    400f51 <phase_6+0x73>
  400f72:	48 8b 0c 24          	mov    (%rsp),%rcx                #刚才得到了6个数据
  400f76:	48 8b 44 24 08       	mov    0x8(%rsp),%rax             
  400f7b:	48 89 41 08          	mov    %rax,0x8(%rcx)
  400f7f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400f84:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400f88:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400f8d:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400f91:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400f96:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400f9a:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  400f9f:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fa3:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  400faa:	00 
  400fab:	48 89 cb             	mov    %rcx,%rbx
  400fae:	bd 00 00 00 00       	mov    $0x0,%ebp
  400fb3:	48 8b 53 08          	mov    0x8(%rbx),%rdx    #rdx中放的是rsp+8的东西
  400fb7:	8b 03                	mov    (%rbx),%eax        #rbx中放的是rsp的东西
  400fb9:	3b 02                	cmp    (%rdx),%eax        #rsp<=rsp+8的东西
  400fbb:	7e 05                	jle    400fc2 <phase_6+0xe4>
  400fbd:	e8 bb 04 00 00       	callq  40147d <explode_bomb>
  400fc2:	48 8b 5b 08          	mov    0x8(%rbx),%rbx     
  400fc6:	83 c5 01             	add    $0x1,%ebp
  400fc9:	83 fd 05             	cmp    $0x5,%ebp
  400fcc:	74 18                	je     400fe6 <phase_6+0x108>
  400fce:	66 90                	xchg   %ax,%ax
  400fd0:	eb e1                	jmp    400fb3 <phase_6+0xd5>
  400fd2:	ba 01 00 00 00       	mov    $0x1,%edx
  400fd7:	be d0 3c 60 00       	mov    $0x603cd0,%esi
  400fdc:	b9 00 00 00 00       	mov    $0x0,%ecx
  400fe1:	e9 6b ff ff ff       	jmpq   400f51 <phase_6+0x73>
  400fe6:	48 83 c4 58          	add    $0x58,%rsp
  400fea:	5b                   	pop    %rbx
  400feb:	5d                   	pop    %rbp
  400fec:	41 5c                	pop    %r12
  400fee:	41 5d                	pop    %r13
  400ff0:	41 5e                	pop    %r14
  400ff2:	41 5f                	pop    %r15
  400ff4:	c3                   	retq   

0000000000400ff5 <phase_2>:
  400ff5:	55                   	push   %rbp
  400ff6:	53                   	push   %rbx
  400ff7:	48 83 ec 28          	sub    $0x28,%rsp
  400ffb:	48 89 e6             	mov    %rsp,%rsi
  400ffe:	e8 b0 04 00 00       	callq  4014b3 <read_six_numbers>
  401003:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  401007:	75 07                	jne    401010 <phase_2+0x1b>
  401009:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  40100e:	74 05                	je     401015 <phase_2+0x20>
  401010:	e8 68 04 00 00       	callq  40147d <explode_bomb>
  401015:	48 8d 5c 24 08       	lea    0x8(%rsp),%rbx
  40101a:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  40101f:	8b 43 f8             	mov    -0x8(%rbx),%eax
  401022:	03 43 fc             	add    -0x4(%rbx),%eax
  401025:	39 03                	cmp    %eax,(%rbx)
  401027:	74 05                	je     40102e <phase_2+0x39>
  401029:	e8 4f 04 00 00       	callq  40147d <explode_bomb>
  40102e:	48 83 c3 04          	add    $0x4,%rbx
  401032:	48 39 eb             	cmp    %rbp,%rbx
  401035:	75 e8                	jne    40101f <phase_2+0x2a>
  401037:	48 83 c4 28          	add    $0x28,%rsp
  40103b:	5b                   	pop    %rbx
  40103c:	5d                   	pop    %rbp
  40103d:	c3                   	retq   

000000000040103e <phase_5>:
  40103e:	48 83 ec 18          	sub    $0x18,%rsp
  401042:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  401047:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  40104c:	be 10 28 40 00       	mov    $0x402810,%esi
  401051:	b8 00 00 00 00       	mov    $0x0,%eax
  401056:	e8 e5 fa ff ff       	callq  400b40 <sscanf@plt>
  40105b:	83 f8 01             	cmp    $0x1,%eax
  40105e:	7f 05                	jg     401065 <phase_5+0x27>
  401060:	e8 18 04 00 00       	callq  40147d <explode_bomb>
  401065:	8b 44 24 14          	mov    0x14(%rsp),%eax        #正经从这里开始
  401069:	83 e0 0f             	and    $0xf,%eax
  40106c:	89 44 24 14          	mov    %eax,0x14(%rsp)        #只留最后4bit
  401070:	83 f8 0f             	cmp    $0xf,%eax
  401073:	74 30                	je     4010a5 <phase_5+0x67>  #不能全为1
  401075:	ba 00 00 00 00       	mov    $0x0,%edx
  40107a:	b9 00 00 00 00       	mov    $0x0,%ecx
  40107f:	83 c2 01             	add    $0x1,%edx
  401082:	48 98                	cltq   
  401084:	8b 04 85 60 27 40 00 	mov    0x402760(,%rax,4),%eax
  40108b:	01 c1                	add    %eax,%ecx
  40108d:	83 f8 0f             	cmp    $0xf,%eax
  401090:	75 ed                	jne    40107f <phase_5+0x41>
  401092:	c7 44 24 14 0f 00 00 	movl   $0xf,0x14(%rsp)
  401099:	00 
  40109a:	83 fa 0f             	cmp    $0xf,%edx
  40109d:	75 06                	jne    4010a5 <phase_5+0x67>
  40109f:	39 4c 24 10          	cmp    %ecx,0x10(%rsp)
  4010a3:	74 05                	je     4010aa <phase_5+0x6c>
  4010a5:	e8 d3 03 00 00       	callq  40147d <explode_bomb>
  4010aa:	48 83 c4 18          	add    $0x18,%rsp
  4010ae:	66 90                	xchg   %ax,%ax
  4010b0:	c3                   	retq   

00000000004010b1 <phase_4>:
  4010b1:	48 83 ec 18          	sub    $0x18,%rsp
  4010b5:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  4010ba:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  4010bf:	be 10 28 40 00       	mov    $0x402810,%esi
  4010c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4010c9:	e8 72 fa ff ff       	callq  400b40 <sscanf@plt>
  4010ce:	83 f8 02             	cmp    $0x2,%eax
  4010d1:	75 0f                	jne    4010e2 <phase_4+0x31>
  4010d3:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4010d7:	85 c0                	test   %eax,%eax
  4010d9:	78 07                	js     4010e2 <phase_4+0x31>    #rsp+0x14>0
  4010db:	83 f8 0e             	cmp    $0xe,%eax                #rsp+0x14<=12
  4010de:	66 90                	xchg   %ax,%ax
  4010e0:	7e 05                	jle    4010e7 <phase_4+0x36>
  4010e2:	e8 96 03 00 00       	callq  40147d <explode_bomb>
  4010e7:	8b 7c 24 14          	mov    0x14(%rsp),%edi
  4010eb:	ba 0e 00 00 00       	mov    $0xe,%edx
  4010f0:	be 00 00 00 00       	mov    $0x0,%esi
  4010f5:	e8 26 fd ff ff       	callq  400e20 <func4>           #func4(rsp+0x14, 0, 0xe)
  4010fa:	83 f8 12             	cmp    $0x12,%eax
  4010fd:	75 07                	jne    401106 <phase_4+0x55>
  4010ff:	83 7c 24 10 12       	cmpl   $0x12,0x10(%rsp)
  401104:	74 05                	je     40110b <phase_4+0x5a>
  401106:	e8 72 03 00 00       	callq  40147d <explode_bomb>
  40110b:	48 83 c4 18          	add    $0x18,%rsp
  40110f:	90                   	nop
  401110:	c3                   	retq   

0000000000401111 <phase_3>:
  401111:	48 83 ec 18          	sub    $0x18,%rsp
  401115:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
  40111a:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  40111f:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  401124:	be fe 26 40 00       	mov    $0x4026fe,%esi
  401129:	b8 00 00 00 00       	mov    $0x0,%eax
  40112e:	e8 0d fa ff ff       	callq  400b40 <sscanf@plt>
  401133:	83 f8 02             	cmp    $0x2,%eax
  401136:	7f 05                	jg     40113d <phase_3+0x2c>    #读取大于3个数
  401138:	e8 40 03 00 00       	callq  40147d <explode_bomb>
  40113d:	83 7c 24 14 07       	cmpl   $0x7,0x14(%rsp)          #<=7
  401142:	0f 87 ef 00 00 00    	ja     401237 <phase_3+0x126>
  401148:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40114c:	ff 24 c5 20 27 40 00 	jmpq   *0x402720(,%rax,8)
  401153:	b8 6e 00 00 00       	mov    $0x6e,%eax
  401158:	81 7c 24 10 6f 03 00 	cmpl   $0x36f,0x10(%rsp)
  40115f:	00 
  401160:	0f 84 e2 00 00 00    	je     401248 <phase_3+0x137>
  401166:	e8 12 03 00 00       	callq  40147d <explode_bomb>
  40116b:	b8 6e 00 00 00       	mov    $0x6e,%eax
  401170:	e9 d3 00 00 00       	jmpq   401248 <phase_3+0x137>
  401175:	b8 69 00 00 00       	mov    $0x69,%eax
  40117a:	81 7c 24 10 87 02 00 	cmpl   $0x287,0x10(%rsp)
  401181:	00 
  401182:	0f 84 c0 00 00 00    	je     401248 <phase_3+0x137>
  401188:	e8 f0 02 00 00       	callq  40147d <explode_bomb>
  40118d:	b8 69 00 00 00       	mov    $0x69,%eax
  401192:	e9 b1 00 00 00       	jmpq   401248 <phase_3+0x137>
  401197:	b8 7a 00 00 00       	mov    $0x7a,%eax
  40119c:	81 7c 24 10 a7 03 00 	cmpl   $0x3a7,0x10(%rsp)
  4011a3:	00 
  4011a4:	0f 84 9e 00 00 00    	je     401248 <phase_3+0x137>
  4011aa:	e8 ce 02 00 00       	callq  40147d <explode_bomb>
  4011af:	b8 7a 00 00 00       	mov    $0x7a,%eax
  4011b4:	e9 8f 00 00 00       	jmpq   401248 <phase_3+0x137>
  4011b9:	81 7c 24 10 65 02 00 	cmpl   $0x265,0x10(%rsp)
  4011c0:	00 
  4011c1:	0f 84 7c 00 00 00    	je     401243 <phase_3+0x132>
  4011c7:	e8 b1 02 00 00       	callq  40147d <explode_bomb>
  4011cc:	b8 61 00 00 00       	mov    $0x61,%eax
  4011d1:	eb 75                	jmp    401248 <phase_3+0x137>
  4011d3:	b8 73 00 00 00       	mov    $0x73,%eax
  4011d8:	81 7c 24 10 ce 03 00 	cmpl   $0x3ce,0x10(%rsp)
  4011df:	00 
  4011e0:	74 66                	je     401248 <phase_3+0x137>
  4011e2:	e8 96 02 00 00       	callq  40147d <explode_bomb>
  4011e7:	b8 73 00 00 00       	mov    $0x73,%eax
  4011ec:	eb 5a                	jmp    401248 <phase_3+0x137>
  4011ee:	81 7c 24 10 8c 02 00 	cmpl   $0x28c,0x10(%rsp)
  4011f5:	00 
  4011f6:	74 4b                	je     401243 <phase_3+0x132>
  4011f8:	e8 80 02 00 00       	callq  40147d <explode_bomb>
  4011fd:	b8 61 00 00 00       	mov    $0x61,%eax
  401202:	eb 44                	jmp    401248 <phase_3+0x137>
  401204:	81 7c 24 10 d5 02 00 	cmpl   $0x2d5,0x10(%rsp)
  40120b:	00 
  40120c:	74 35                	je     401243 <phase_3+0x132>
  40120e:	66 90                	xchg   %ax,%ax
  401210:	e8 68 02 00 00       	callq  40147d <explode_bomb>
  401215:	b8 61 00 00 00       	mov    $0x61,%eax
  40121a:	eb 2c                	jmp    401248 <phase_3+0x137>
  40121c:	b8 65 00 00 00       	mov    $0x65,%eax                 #==7跳到这里
  401221:	81 7c 24 10 cb 03 00 	cmpl   $0x3cb,0x10(%rsp)
  401228:	00 
  401229:	74 1d                	je     401248 <phase_3+0x137>
  40122b:	e8 4d 02 00 00       	callq  40147d <explode_bomb>
  401230:	b8 65 00 00 00       	mov    $0x65,%eax
  401235:	eb 11                	jmp    401248 <phase_3+0x137>
  401237:	e8 41 02 00 00       	callq  40147d <explode_bomb>
  40123c:	b8 69 00 00 00       	mov    $0x69,%eax
  401241:	eb 05                	jmp    401248 <phase_3+0x137>
  401243:	b8 61 00 00 00       	mov    $0x61,%eax
  401248:	3a 44 24 0f          	cmp    0xf(%rsp),%al
  40124c:	74 05                	je     401253 <phase_3+0x142>
  40124e:	e8 2a 02 00 00       	callq  40147d <explode_bomb>
  401253:	48 83 c4 18          	add    $0x18,%rsp
  401257:	c3                   	retq   

0000000000401258 <phase_1>:
  401258:	48 83 ec 08          	sub    $0x8,%rsp
  40125c:	be c8 26 40 00       	mov    $0x4026c8,%esi
  401261:	e8 39 00 00 00       	callq  40129f <strings_not_equal>
  401266:	85 c0                	test   %eax,%eax
  401268:	74 05                	je     40126f <phase_1+0x17>
  40126a:	e8 0e 02 00 00       	callq  40147d <explode_bomb>
  40126f:	48 83 c4 08          	add    $0x8,%rsp
  401273:	c3                   	retq   
  401274:	90                   	nop
  401275:	90                   	nop
  401276:	90                   	nop
  401277:	90                   	nop
  401278:	90                   	nop
  401279:	90                   	nop
  40127a:	90                   	nop
  40127b:	90                   	nop
  40127c:	90                   	nop
  40127d:	90                   	nop
  40127e:	90                   	nop
  40127f:	90                   	nop

0000000000401280 <string_length>:
  401280:	b8 00 00 00 00       	mov    $0x0,%eax
  401285:	80 3f 00             	cmpb   $0x0,(%rdi)
  401288:	74 13                	je     40129d <string_length+0x1d>
  40128a:	48 89 fa             	mov    %rdi,%rdx
  40128d:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  401291:	48 83 c2 01          	add    $0x1,%rdx
  401295:	84 c0                	test   %al,%al
  401297:	75 f4                	jne    40128d <string_length+0xd>
  401299:	89 d0                	mov    %edx,%eax
  40129b:	29 f8                	sub    %edi,%eax
  40129d:	f3 c3                	repz retq 

000000000040129f <strings_not_equal>:
  40129f:	41 54                	push   %r12
  4012a1:	55                   	push   %rbp
  4012a2:	53                   	push   %rbx
  4012a3:	48 89 fd             	mov    %rdi,%rbp
  4012a6:	49 89 f4             	mov    %rsi,%r12
  4012a9:	e8 d2 ff ff ff       	callq  401280 <string_length>
  4012ae:	89 c3                	mov    %eax,%ebx
  4012b0:	4c 89 e7             	mov    %r12,%rdi
  4012b3:	e8 c8 ff ff ff       	callq  401280 <string_length>
  4012b8:	39 c3                	cmp    %eax,%ebx
  4012ba:	75 32                	jne    4012ee <strings_not_equal+0x4f>
  4012bc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  4012c0:	84 c0                	test   %al,%al
  4012c2:	74 31                	je     4012f5 <strings_not_equal+0x56>
  4012c4:	48 89 e9             	mov    %rbp,%rcx
  4012c7:	4c 89 e2             	mov    %r12,%rdx
  4012ca:	41 3a 04 24          	cmp    (%r12),%al
  4012ce:	74 13                	je     4012e3 <strings_not_equal+0x44>
  4012d0:	eb 1c                	jmp    4012ee <strings_not_equal+0x4f>
  4012d2:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  4012d6:	48 83 c1 01          	add    $0x1,%rcx
  4012da:	48 83 c2 01          	add    $0x1,%rdx
  4012de:	40 38 c6             	cmp    %al,%sil
  4012e1:	75 0b                	jne    4012ee <strings_not_equal+0x4f>
  4012e3:	0f b6 71 01          	movzbl 0x1(%rcx),%esi
  4012e7:	40 84 f6             	test   %sil,%sil
  4012ea:	75 e6                	jne    4012d2 <strings_not_equal+0x33>
  4012ec:	eb 07                	jmp    4012f5 <strings_not_equal+0x56>
  4012ee:	b8 01 00 00 00       	mov    $0x1,%eax
  4012f3:	eb 05                	jmp    4012fa <strings_not_equal+0x5b>
  4012f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4012fa:	5b                   	pop    %rbx
  4012fb:	5d                   	pop    %rbp
  4012fc:	41 5c                	pop    %r12
  4012fe:	66 90                	xchg   %ax,%ax
  401300:	c3                   	retq   

0000000000401301 <initialize_bomb_solve>:
  401301:	f3 c3                	repz retq 

0000000000401303 <invalid_phase>:
  401303:	48 83 ec 08          	sub    $0x8,%rsp
  401307:	48 89 fe             	mov    %rdi,%rsi
  40130a:	bf a0 27 40 00       	mov    $0x4027a0,%edi
  40130f:	b8 00 00 00 00       	mov    $0x0,%eax
  401314:	e8 37 f7 ff ff       	callq  400a50 <printf@plt>
  401319:	bf 08 00 00 00       	mov    $0x8,%edi
  40131e:	e8 7d f7 ff ff       	callq  400aa0 <exit@plt>

0000000000401323 <send_msg>:
  401323:	55                   	push   %rbp
  401324:	53                   	push   %rbx
  401325:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  40132c:	89 fe                	mov    %edi,%esi
  40132e:	44 8b 0d 2f 2e 20 00 	mov    0x202e2f(%rip),%r9d        # 604164 <num_input_strings>
  401335:	49 63 c1             	movslq %r9d,%rax
  401338:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40133c:	48 c1 e0 04          	shl    $0x4,%rax
  401340:	48 8d 90 30 41 60 00 	lea    0x604130(%rax),%rdx
  401347:	48 89 d7             	mov    %rdx,%rdi
  40134a:	fc                   	cld    
  40134b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401352:	b8 00 00 00 00       	mov    $0x0,%eax
  401357:	f2 ae                	repnz scas %es:(%rdi),%al
  401359:	48 f7 d1             	not    %rcx
  40135c:	48 83 c1 63          	add    $0x63,%rcx
  401360:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401367:	76 14                	jbe    40137d <send_msg+0x5a>
  401369:	bf 88 29 40 00       	mov    $0x402988,%edi
  40136e:	e8 dd f6 ff ff       	callq  400a50 <printf@plt>
  401373:	bf 08 00 00 00       	mov    $0x8,%edi
  401378:	e8 23 f7 ff ff       	callq  400aa0 <exit@plt>
  40137d:	85 f6                	test   %esi,%esi
  40137f:	41 b8 b9 27 40 00    	mov    $0x4027b9,%r8d
  401385:	b8 b1 27 40 00       	mov    $0x4027b1,%eax
  40138a:	4c 0f 45 c0          	cmovne %rax,%r8
  40138e:	48 8d 9c 24 10 20 00 	lea    0x2010(%rsp),%rbx
  401395:	00 
  401396:	48 89 14 24          	mov    %rdx,(%rsp)
  40139a:	b9 80 38 60 00       	mov    $0x603880,%ecx
  40139f:	8b 15 bb 20 20 00    	mov    0x2020bb(%rip),%edx        # 603460 <bomb_id>
  4013a5:	be c2 27 40 00       	mov    $0x4027c2,%esi
  4013aa:	48 89 df             	mov    %rbx,%rdi
  4013ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4013b2:	e8 69 f7 ff ff       	callq  400b20 <sprintf@plt>
  4013b7:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  4013bc:	48 89 e9             	mov    %rbp,%rcx
  4013bf:	ba 00 00 00 00       	mov    $0x0,%edx
  4013c4:	48 89 de             	mov    %rbx,%rsi
  4013c7:	bf 80 34 60 00       	mov    $0x603480,%edi
  4013cc:	e8 cf 0f 00 00       	callq  4023a0 <driver_post>
  4013d1:	85 c0                	test   %eax,%eax
  4013d3:	79 12                	jns    4013e7 <send_msg+0xc4>
  4013d5:	48 89 ef             	mov    %rbp,%rdi
  4013d8:	e8 b3 f6 ff ff       	callq  400a90 <puts@plt>
  4013dd:	bf 00 00 00 00       	mov    $0x0,%edi
  4013e2:	e8 b9 f6 ff ff       	callq  400aa0 <exit@plt>
  4013e7:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  4013ee:	5b                   	pop    %rbx
  4013ef:	5d                   	pop    %rbp
  4013f0:	c3                   	retq   

00000000004013f1 <phase_defused>:
  4013f1:	53                   	push   %rbx
  4013f2:	48 83 ec 60          	sub    $0x60,%rsp
  4013f6:	bf 01 00 00 00       	mov    $0x1,%edi
  4013fb:	e8 23 ff ff ff       	callq  401323 <send_msg>
  401400:	83 3d 5d 2d 20 00 06 	cmpl   $0x6,0x202d5d(%rip)        # 604164 <num_input_strings>
  401407:	75 6e                	jne    401477 <phase_defused+0x86>
  401409:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  40140e:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401413:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401418:	49 89 d8             	mov    %rbx,%r8
  40141b:	be d1 27 40 00       	mov    $0x4027d1,%esi
  401420:	bf 70 42 60 00       	mov    $0x604270,%edi
  401425:	b8 00 00 00 00       	mov    $0x0,%eax
  40142a:	e8 11 f7 ff ff       	callq  400b40 <sscanf@plt>
  40142f:	83 f8 03             	cmp    $0x3,%eax
  401432:	75 2f                	jne    401463 <phase_defused+0x72>
  401434:	be da 27 40 00       	mov    $0x4027da,%esi
  401439:	48 89 df             	mov    %rbx,%rdi
  40143c:	e8 5e fe ff ff       	callq  40129f <strings_not_equal>
  401441:	85 c0                	test   %eax,%eax
  401443:	75 1e                	jne    401463 <phase_defused+0x72>
  401445:	bf b0 29 40 00       	mov    $0x4029b0,%edi
  40144a:	e8 41 f6 ff ff       	callq  400a90 <puts@plt>
  40144f:	bf d8 29 40 00       	mov    $0x4029d8,%edi
  401454:	e8 37 f6 ff ff       	callq  400a90 <puts@plt>
  401459:	b8 00 00 00 00       	mov    $0x0,%eax
  40145e:	e8 26 fa ff ff       	callq  400e89 <secret_phase>
  401463:	bf 10 2a 40 00       	mov    $0x402a10,%edi
  401468:	e8 23 f6 ff ff       	callq  400a90 <puts@plt>
  40146d:	bf 40 2a 40 00       	mov    $0x402a40,%edi
  401472:	e8 19 f6 ff ff       	callq  400a90 <puts@plt>
  401477:	48 83 c4 60          	add    $0x60,%rsp
  40147b:	5b                   	pop    %rbx
  40147c:	c3                   	retq   

000000000040147d <explode_bomb>:
  40147d:	48 83 ec 08          	sub    $0x8,%rsp
  401481:	bf e4 27 40 00       	mov    $0x4027e4,%edi
  401486:	e8 05 f6 ff ff       	callq  400a90 <puts@plt>
  40148b:	bf ed 27 40 00       	mov    $0x4027ed,%edi
  401490:	e8 fb f5 ff ff       	callq  400a90 <puts@plt>
  401495:	bf 00 00 00 00       	mov    $0x0,%edi
  40149a:	e8 84 fe ff ff       	callq  401323 <send_msg>
  40149f:	bf 88 2a 40 00       	mov    $0x402a88,%edi
  4014a4:	e8 e7 f5 ff ff       	callq  400a90 <puts@plt>
  4014a9:	bf 08 00 00 00       	mov    $0x8,%edi
  4014ae:	e8 ed f5 ff ff       	callq  400aa0 <exit@plt>

00000000004014b3 <read_six_numbers>:
  4014b3:	48 83 ec 18          	sub    $0x18,%rsp
  4014b7:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  4014bb:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4014bf:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4014c4:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4014c8:	48 89 04 24          	mov    %rax,(%rsp)
  4014cc:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  4014d0:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  4014d4:	48 89 f2             	mov    %rsi,%rdx
  4014d7:	be 04 28 40 00       	mov    $0x402804,%esi
  4014dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4014e1:	e8 5a f6 ff ff       	callq  400b40 <sscanf@plt>
  4014e6:	83 f8 05             	cmp    $0x5,%eax
  4014e9:	7f 05                	jg     4014f0 <read_six_numbers+0x3d>
  4014eb:	e8 8d ff ff ff       	callq  40147d <explode_bomb>
  4014f0:	48 83 c4 18          	add    $0x18,%rsp
  4014f4:	c3                   	retq   

00000000004014f5 <blank_line>:
  4014f5:	55                   	push   %rbp
  4014f6:	53                   	push   %rbx
  4014f7:	48 83 ec 08          	sub    $0x8,%rsp
  4014fb:	48 89 fd             	mov    %rdi,%rbp
  4014fe:	eb 1e                	jmp    40151e <blank_line+0x29>
  401500:	e8 0b f6 ff ff       	callq  400b10 <__ctype_b_loc@plt>
  401505:	48 0f be d3          	movsbq %bl,%rdx
  401509:	48 8b 00             	mov    (%rax),%rax
  40150c:	f6 44 50 01 20       	testb  $0x20,0x1(%rax,%rdx,2)
  401511:	75 07                	jne    40151a <blank_line+0x25>
  401513:	b8 00 00 00 00       	mov    $0x0,%eax
  401518:	eb 11                	jmp    40152b <blank_line+0x36>
  40151a:	48 83 c5 01          	add    $0x1,%rbp
  40151e:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401522:	84 db                	test   %bl,%bl
  401524:	75 da                	jne    401500 <blank_line+0xb>
  401526:	b8 01 00 00 00       	mov    $0x1,%eax
  40152b:	48 83 c4 08          	add    $0x8,%rsp
  40152f:	5b                   	pop    %rbx
  401530:	5d                   	pop    %rbp
  401531:	c3                   	retq   

0000000000401532 <skip>:
  401532:	53                   	push   %rbx
  401533:	48 63 3d 2a 2c 20 00 	movslq 0x202c2a(%rip),%rdi        # 604164 <num_input_strings>
  40153a:	48 8d 3c bf          	lea    (%rdi,%rdi,4),%rdi
  40153e:	48 c1 e7 04          	shl    $0x4,%rdi
  401542:	48 81 c7 80 41 60 00 	add    $0x604180,%rdi
  401549:	48 8b 15 18 2c 20 00 	mov    0x202c18(%rip),%rdx        # 604168 <infile>
  401550:	be 50 00 00 00       	mov    $0x50,%esi
  401555:	e8 96 f5 ff ff       	callq  400af0 <fgets@plt>
  40155a:	48 89 c3             	mov    %rax,%rbx
  40155d:	48 85 c0             	test   %rax,%rax
  401560:	74 0c                	je     40156e <skip+0x3c>
  401562:	48 89 c7             	mov    %rax,%rdi
  401565:	e8 8b ff ff ff       	callq  4014f5 <blank_line>
  40156a:	85 c0                	test   %eax,%eax
  40156c:	75 c5                	jne    401533 <skip+0x1>
  40156e:	48 89 d8             	mov    %rbx,%rax
  401571:	5b                   	pop    %rbx
  401572:	c3                   	retq   

0000000000401573 <read_line>:
  401573:	53                   	push   %rbx
  401574:	b8 00 00 00 00       	mov    $0x0,%eax
  401579:	e8 b4 ff ff ff       	callq  401532 <skip>
  40157e:	48 85 c0             	test   %rax,%rax
  401581:	75 6e                	jne    4015f1 <read_line+0x7e>
  401583:	48 8b 05 b6 2b 20 00 	mov    0x202bb6(%rip),%rax        # 604140 <__bss_start>
  40158a:	48 39 05 d7 2b 20 00 	cmp    %rax,0x202bd7(%rip)        # 604168 <infile>
  401591:	75 14                	jne    4015a7 <read_line+0x34>
  401593:	bf 16 28 40 00       	mov    $0x402816,%edi
  401598:	e8 f3 f4 ff ff       	callq  400a90 <puts@plt>
  40159d:	bf 08 00 00 00       	mov    $0x8,%edi
  4015a2:	e8 f9 f4 ff ff       	callq  400aa0 <exit@plt>
  4015a7:	bf 34 28 40 00       	mov    $0x402834,%edi
  4015ac:	e8 ef f5 ff ff       	callq  400ba0 <getenv@plt>
  4015b1:	48 85 c0             	test   %rax,%rax
  4015b4:	74 0a                	je     4015c0 <read_line+0x4d>
  4015b6:	bf 00 00 00 00       	mov    $0x0,%edi
  4015bb:	e8 e0 f4 ff ff       	callq  400aa0 <exit@plt>
  4015c0:	48 8b 05 79 2b 20 00 	mov    0x202b79(%rip),%rax        # 604140 <__bss_start>
  4015c7:	48 89 05 9a 2b 20 00 	mov    %rax,0x202b9a(%rip)        # 604168 <infile>
  4015ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4015d3:	e8 5a ff ff ff       	callq  401532 <skip>
  4015d8:	48 85 c0             	test   %rax,%rax
  4015db:	75 14                	jne    4015f1 <read_line+0x7e>
  4015dd:	bf 16 28 40 00       	mov    $0x402816,%edi
  4015e2:	e8 a9 f4 ff ff       	callq  400a90 <puts@plt>
  4015e7:	bf 00 00 00 00       	mov    $0x0,%edi
  4015ec:	e8 af f4 ff ff       	callq  400aa0 <exit@plt>
  4015f1:	48 63 05 6c 2b 20 00 	movslq 0x202b6c(%rip),%rax        # 604164 <num_input_strings>
  4015f8:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015fc:	48 c1 e0 04          	shl    $0x4,%rax
  401600:	48 8d b8 80 41 60 00 	lea    0x604180(%rax),%rdi
  401607:	fc                   	cld    
  401608:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40160f:	b8 00 00 00 00       	mov    $0x0,%eax
  401614:	f2 ae                	repnz scas %es:(%rdi),%al
  401616:	48 f7 d1             	not    %rcx
  401619:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  40161c:	83 fb 4e             	cmp    $0x4e,%ebx
  40161f:	7e 50                	jle    401671 <read_line+0xfe>
  401621:	bf 3f 28 40 00       	mov    $0x40283f,%edi
  401626:	e8 65 f4 ff ff       	callq  400a90 <puts@plt>
  40162b:	8b 05 33 2b 20 00    	mov    0x202b33(%rip),%eax        # 604164 <num_input_strings>
  401631:	8d 50 01             	lea    0x1(%rax),%edx
  401634:	89 15 2a 2b 20 00    	mov    %edx,0x202b2a(%rip)        # 604164 <num_input_strings>
  40163a:	48 98                	cltq   
  40163c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401640:	48 c1 e0 04          	shl    $0x4,%rax
  401644:	c7 80 80 41 60 00 2a 	movl   $0x742a2a2a,0x604180(%rax)
  40164b:	2a 2a 74 
  40164e:	c7 80 84 41 60 00 72 	movl   $0x636e7572,0x604184(%rax)
  401655:	75 6e 63 
  401658:	c7 80 88 41 60 00 61 	movl   $0x64657461,0x604188(%rax)
  40165f:	74 65 64 
  401662:	c7 80 8c 41 60 00 2a 	movl   $0x2a2a2a,0x60418c(%rax)
  401669:	2a 2a 00 
  40166c:	e8 0c fe ff ff       	callq  40147d <explode_bomb>
  401671:	8b 0d ed 2a 20 00    	mov    0x202aed(%rip),%ecx        # 604164 <num_input_strings>
  401677:	8d 53 ff             	lea    -0x1(%rbx),%edx
  40167a:	48 63 d2             	movslq %edx,%rdx
  40167d:	48 63 c1             	movslq %ecx,%rax
  401680:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401684:	48 c1 e0 04          	shl    $0x4,%rax
  401688:	48 05 80 41 60 00    	add    $0x604180,%rax
  40168e:	c6 04 10 00          	movb   $0x0,(%rax,%rdx,1)
  401692:	83 c1 01             	add    $0x1,%ecx
  401695:	89 0d c9 2a 20 00    	mov    %ecx,0x202ac9(%rip)        # 604164 <num_input_strings>
  40169b:	5b                   	pop    %rbx
  40169c:	c3                   	retq   

000000000040169d <initialize_bomb>:
  40169d:	55                   	push   %rbp
  40169e:	53                   	push   %rbx
  40169f:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  4016a6:	be 5f 17 40 00       	mov    $0x40175f,%esi
  4016ab:	bf 02 00 00 00       	mov    $0x2,%edi
  4016b0:	e8 cb f4 ff ff       	callq  400b80 <signal@plt>
  4016b5:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4016bc:	00 
  4016bd:	be 40 00 00 00       	mov    $0x40,%esi
  4016c2:	e8 a9 f4 ff ff       	callq  400b70 <gethostname@plt>
  4016c7:	85 c0                	test   %eax,%eax
  4016c9:	75 1b                	jne    4016e6 <initialize_bomb+0x49>
  4016cb:	48 8b 3d ee 27 20 00 	mov    0x2027ee(%rip),%rdi        # 603ec0 <host_table>
  4016d2:	bb 00 00 00 00       	mov    $0x0,%ebx
  4016d7:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  4016de:	00 
  4016df:	48 85 ff             	test   %rdi,%rdi
  4016e2:	75 16                	jne    4016fa <initialize_bomb+0x5d>
  4016e4:	eb 5b                	jmp    401741 <initialize_bomb+0xa4>
  4016e6:	bf b0 2a 40 00       	mov    $0x402ab0,%edi
  4016eb:	e8 a0 f3 ff ff       	callq  400a90 <puts@plt>
  4016f0:	bf 08 00 00 00       	mov    $0x8,%edi
  4016f5:	e8 a6 f3 ff ff       	callq  400aa0 <exit@plt>
  4016fa:	48 89 ee             	mov    %rbp,%rsi
  4016fd:	e8 ae f3 ff ff       	callq  400ab0 <strcasecmp@plt>
  401702:	85 c0                	test   %eax,%eax
  401704:	74 13                	je     401719 <initialize_bomb+0x7c>
  401706:	48 8b 3c dd c8 3e 60 	mov    0x603ec8(,%rbx,8),%rdi
  40170d:	00 
  40170e:	48 83 c3 01          	add    $0x1,%rbx
  401712:	48 85 ff             	test   %rdi,%rdi
  401715:	74 2a                	je     401741 <initialize_bomb+0xa4>
  401717:	eb e1                	jmp    4016fa <initialize_bomb+0x5d>
  401719:	48 89 e7             	mov    %rsp,%rdi
  40171c:	e8 8f 00 00 00       	callq  4017b0 <init_driver>
  401721:	85 c0                	test   %eax,%eax
  401723:	79 30                	jns    401755 <initialize_bomb+0xb8>
  401725:	48 89 e6             	mov    %rsp,%rsi
  401728:	bf 5a 28 40 00       	mov    $0x40285a,%edi
  40172d:	b8 00 00 00 00       	mov    $0x0,%eax
  401732:	e8 19 f3 ff ff       	callq  400a50 <printf@plt>
  401737:	bf 08 00 00 00       	mov    $0x8,%edi
  40173c:	e8 5f f3 ff ff       	callq  400aa0 <exit@plt>
  401741:	bf e8 2a 40 00       	mov    $0x402ae8,%edi
  401746:	e8 45 f3 ff ff       	callq  400a90 <puts@plt>
  40174b:	bf 08 00 00 00       	mov    $0x8,%edi
  401750:	e8 4b f3 ff ff       	callq  400aa0 <exit@plt>
  401755:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  40175c:	5b                   	pop    %rbx
  40175d:	5d                   	pop    %rbp
  40175e:	c3                   	retq   

000000000040175f <sig_handler>:
  40175f:	48 83 ec 08          	sub    $0x8,%rsp
  401763:	bf 20 2b 40 00       	mov    $0x402b20,%edi
  401768:	e8 23 f3 ff ff       	callq  400a90 <puts@plt>
  40176d:	bf 03 00 00 00       	mov    $0x3,%edi
  401772:	e8 d9 f3 ff ff       	callq  400b50 <sleep@plt>
  401777:	bf 74 28 40 00       	mov    $0x402874,%edi
  40177c:	b8 00 00 00 00       	mov    $0x0,%eax
  401781:	e8 ca f2 ff ff       	callq  400a50 <printf@plt>
  401786:	48 8b 3d c3 29 20 00 	mov    0x2029c3(%rip),%rdi        # 604150 <stdout@@GLIBC_2.2.5>
  40178d:	e8 6e f4 ff ff       	callq  400c00 <fflush@plt>
  401792:	bf 01 00 00 00       	mov    $0x1,%edi
  401797:	e8 b4 f3 ff ff       	callq  400b50 <sleep@plt>
  40179c:	bf 7c 28 40 00       	mov    $0x40287c,%edi
  4017a1:	e8 ea f2 ff ff       	callq  400a90 <puts@plt>
  4017a6:	bf 10 00 00 00       	mov    $0x10,%edi
  4017ab:	e8 f0 f2 ff ff       	callq  400aa0 <exit@plt>

00000000004017b0 <init_driver>:
  4017b0:	41 54                	push   %r12
  4017b2:	55                   	push   %rbp
  4017b3:	53                   	push   %rbx
  4017b4:	48 83 ec 10          	sub    $0x10,%rsp
  4017b8:	48 89 fd             	mov    %rdi,%rbp
  4017bb:	be 01 00 00 00       	mov    $0x1,%esi
  4017c0:	bf 0d 00 00 00       	mov    $0xd,%edi
  4017c5:	e8 b6 f3 ff ff       	callq  400b80 <signal@plt>
  4017ca:	be 01 00 00 00       	mov    $0x1,%esi
  4017cf:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4017d4:	e8 a7 f3 ff ff       	callq  400b80 <signal@plt>
  4017d9:	be 01 00 00 00       	mov    $0x1,%esi
  4017de:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4017e3:	e8 98 f3 ff ff       	callq  400b80 <signal@plt>
  4017e8:	ba 00 00 00 00       	mov    $0x0,%edx
  4017ed:	be 01 00 00 00       	mov    $0x1,%esi
  4017f2:	bf 02 00 00 00       	mov    $0x2,%edi
  4017f7:	e8 94 f3 ff ff       	callq  400b90 <socket@plt>
  4017fc:	41 89 c4             	mov    %eax,%r12d
  4017ff:	85 c0                	test   %eax,%eax
  401801:	79 4f                	jns    401852 <init_driver+0xa2>
  401803:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  40180a:	c7 45 04 72 3a 20 43 	movl   $0x43203a72,0x4(%rbp)
  401811:	c7 45 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%rbp)
  401818:	c7 45 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%rbp)
  40181f:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401826:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40182d:	c7 45 18 63 72 65 61 	movl   $0x61657263,0x18(%rbp)
  401834:	c7 45 1c 74 65 20 73 	movl   $0x73206574,0x1c(%rbp)
  40183b:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  401842:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  401848:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40184d:	e9 27 01 00 00       	jmpq   401979 <init_driver+0x1c9>
  401852:	bf 78 2b 40 00       	mov    $0x402b78,%edi
  401857:	e8 24 f2 ff ff       	callq  400a80 <gethostbyname@plt>
  40185c:	48 85 c0             	test   %rax,%rax
  40185f:	75 69                	jne    4018ca <init_driver+0x11a>
  401861:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401868:	c7 45 04 72 3a 20 44 	movl   $0x44203a72,0x4(%rbp)
  40186f:	c7 45 08 4e 53 20 69 	movl   $0x6920534e,0x8(%rbp)
  401876:	c7 45 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%rbp)
  40187d:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401884:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40188b:	c7 45 18 72 65 73 6f 	movl   $0x6f736572,0x18(%rbp)
  401892:	c7 45 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%rbp)
  401899:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  4018a0:	c7 45 24 65 72 20 61 	movl   $0x61207265,0x24(%rbp)
  4018a7:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4018ae:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4018b4:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4018b8:	44 89 e7             	mov    %r12d,%edi
  4018bb:	e8 b0 f1 ff ff       	callq  400a70 <close@plt>
  4018c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018c5:	e9 af 00 00 00       	jmpq   401979 <init_driver+0x1c9>
  4018ca:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4018d1:	00 
  4018d2:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4018d9:	00 00 
  4018db:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4018e1:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4018e6:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018ea:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018ee:	48 8b 38             	mov    (%rax),%rdi
  4018f1:	e8 0a f2 ff ff       	callq  400b00 <bcopy@plt>
  4018f6:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  4018fd:	ba 10 00 00 00       	mov    $0x10,%edx
  401902:	48 89 e6             	mov    %rsp,%rsi
  401905:	44 89 e7             	mov    %r12d,%edi
  401908:	e8 53 f2 ff ff       	callq  400b60 <connect@plt>
  40190d:	85 c0                	test   %eax,%eax
  40190f:	79 51                	jns    401962 <init_driver+0x1b2>
  401911:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401918:	c7 45 04 72 3a 20 55 	movl   $0x55203a72,0x4(%rbp)
  40191f:	c7 45 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%rbp)
  401926:	c7 45 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%rbp)
  40192d:	c7 45 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%rbp)
  401934:	c7 45 14 6e 65 63 74 	movl   $0x7463656e,0x14(%rbp)
  40193b:	c7 45 18 20 74 6f 20 	movl   $0x206f7420,0x18(%rbp)
  401942:	c7 45 1c 73 65 72 76 	movl   $0x76726573,0x1c(%rbp)
  401949:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  40194f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  401953:	44 89 e7             	mov    %r12d,%edi
  401956:	e8 15 f1 ff ff       	callq  400a70 <close@plt>
  40195b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401960:	eb 17                	jmp    401979 <init_driver+0x1c9>
  401962:	44 89 e7             	mov    %r12d,%edi
  401965:	e8 06 f1 ff ff       	callq  400a70 <close@plt>
  40196a:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  401970:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  401974:	b8 00 00 00 00       	mov    $0x0,%eax
  401979:	48 83 c4 10          	add    $0x10,%rsp
  40197d:	5b                   	pop    %rbx
  40197e:	5d                   	pop    %rbp
  40197f:	41 5c                	pop    %r12
  401981:	c3                   	retq   

0000000000401982 <init_timeout>:
  401982:	53                   	push   %rbx
  401983:	89 fb                	mov    %edi,%ebx
  401985:	85 ff                	test   %edi,%edi
  401987:	74 1e                	je     4019a7 <init_timeout+0x25>
  401989:	be 18 24 40 00       	mov    $0x402418,%esi
  40198e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401993:	e8 e8 f1 ff ff       	callq  400b80 <signal@plt>
  401998:	85 db                	test   %ebx,%ebx
  40199a:	bf 00 00 00 00       	mov    $0x0,%edi
  40199f:	0f 49 fb             	cmovns %ebx,%edi
  4019a2:	e8 09 f2 ff ff       	callq  400bb0 <alarm@plt>
  4019a7:	5b                   	pop    %rbx
  4019a8:	c3                   	retq   

00000000004019a9 <rio_readlineb>:
  4019a9:	41 57                	push   %r15
  4019ab:	41 56                	push   %r14
  4019ad:	41 55                	push   %r13
  4019af:	41 54                	push   %r12
  4019b1:	55                   	push   %rbp
  4019b2:	53                   	push   %rbx
  4019b3:	48 83 ec 18          	sub    $0x18,%rsp
  4019b7:	48 89 fb             	mov    %rdi,%rbx
  4019ba:	49 89 d7             	mov    %rdx,%r15
  4019bd:	49 89 f5             	mov    %rsi,%r13
  4019c0:	49 89 f6             	mov    %rsi,%r14
  4019c3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4019c9:	48 83 fa 01          	cmp    $0x1,%rdx
  4019cd:	77 3b                	ja     401a0a <rio_readlineb+0x61>
  4019cf:	e9 7e 00 00 00       	jmpq   401a52 <rio_readlineb+0xa9>
  4019d4:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4019d8:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019dd:	48 89 ee             	mov    %rbp,%rsi
  4019e0:	8b 3b                	mov    (%rbx),%edi
  4019e2:	e8 d9 f0 ff ff       	callq  400ac0 <read@plt>
  4019e7:	89 43 04             	mov    %eax,0x4(%rbx)
  4019ea:	85 c0                	test   %eax,%eax
  4019ec:	79 14                	jns    401a02 <rio_readlineb+0x59>
  4019ee:	e8 cd f1 ff ff       	callq  400bc0 <__errno_location@plt>
  4019f3:	83 38 04             	cmpl   $0x4,(%rax)
  4019f6:	74 12                	je     401a0a <rio_readlineb+0x61>
  4019f8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4019ff:	90                   	nop
  401a00:	eb 67                	jmp    401a69 <rio_readlineb+0xc0>
  401a02:	85 c0                	test   %eax,%eax
  401a04:	74 5e                	je     401a64 <rio_readlineb+0xbb>
  401a06:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  401a0a:	83 7b 04 00          	cmpl   $0x0,0x4(%rbx)
  401a0e:	66 90                	xchg   %ax,%ax
  401a10:	7e c2                	jle    4019d4 <rio_readlineb+0x2b>
  401a12:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a16:	0f b6 00             	movzbl (%rax),%eax
  401a19:	88 44 24 17          	mov    %al,0x17(%rsp)
  401a1d:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401a22:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401a26:	43 88 44 2c ff       	mov    %al,-0x1(%r12,%r13,1)
  401a2b:	49 83 c6 01          	add    $0x1,%r14
  401a2f:	80 7c 24 17 0a       	cmpb   $0xa,0x17(%rsp)
  401a34:	75 0f                	jne    401a45 <rio_readlineb+0x9c>
  401a36:	eb 23                	jmp    401a5b <rio_readlineb+0xb2>
  401a38:	b8 00 00 00 00       	mov    $0x0,%eax
  401a3d:	49 83 fc 01          	cmp    $0x1,%r12
  401a41:	74 31                	je     401a74 <rio_readlineb+0xcb>
  401a43:	eb 16                	jmp    401a5b <rio_readlineb+0xb2>
  401a45:	49 83 c4 01          	add    $0x1,%r12
  401a49:	4d 39 fc             	cmp    %r15,%r12
  401a4c:	75 bc                	jne    401a0a <rio_readlineb+0x61>
  401a4e:	66 90                	xchg   %ax,%ax
  401a50:	eb 09                	jmp    401a5b <rio_readlineb+0xb2>
  401a52:	49 89 f6             	mov    %rsi,%r14
  401a55:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  401a5b:	41 c6 06 00          	movb   $0x0,(%r14)
  401a5f:	4c 89 e0             	mov    %r12,%rax
  401a62:	eb 10                	jmp    401a74 <rio_readlineb+0xcb>
  401a64:	b8 00 00 00 00       	mov    $0x0,%eax
  401a69:	85 c0                	test   %eax,%eax
  401a6b:	74 cb                	je     401a38 <rio_readlineb+0x8f>
  401a6d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a74:	48 83 c4 18          	add    $0x18,%rsp
  401a78:	5b                   	pop    %rbx
  401a79:	5d                   	pop    %rbp
  401a7a:	41 5c                	pop    %r12
  401a7c:	41 5d                	pop    %r13
  401a7e:	41 5e                	pop    %r14
  401a80:	41 5f                	pop    %r15
  401a82:	c3                   	retq   

0000000000401a83 <submitr>:
  401a83:	41 57                	push   %r15
  401a85:	41 56                	push   %r14
  401a87:	41 55                	push   %r13
  401a89:	41 54                	push   %r12
  401a8b:	55                   	push   %rbp
  401a8c:	53                   	push   %rbx
  401a8d:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  401a94:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
  401a99:	89 f5                	mov    %esi,%ebp
  401a9b:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  401aa0:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  401aa5:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
  401aaa:	4d 89 cf             	mov    %r9,%r15
  401aad:	4c 8b b4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r14
  401ab4:	00 
  401ab5:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  401abc:	00 00 00 00 
  401ac0:	ba 00 00 00 00       	mov    $0x0,%edx
  401ac5:	be 01 00 00 00       	mov    $0x1,%esi
  401aca:	bf 02 00 00 00       	mov    $0x2,%edi
  401acf:	e8 bc f0 ff ff       	callq  400b90 <socket@plt>
  401ad4:	41 89 c5             	mov    %eax,%r13d
  401ad7:	85 c0                	test   %eax,%eax
  401ad9:	79 58                	jns    401b33 <submitr+0xb0>
  401adb:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401ae2:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ae9:	43 
  401aea:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401af1:	6e 
  401af2:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401af9:	6e 
  401afa:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401b01:	65 
  401b02:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401b09:	20 
  401b0a:	41 c7 46 18 63 72 65 	movl   $0x61657263,0x18(%r14)
  401b11:	61 
  401b12:	41 c7 46 1c 74 65 20 	movl   $0x73206574,0x1c(%r14)
  401b19:	73 
  401b1a:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  401b21:	65 
  401b22:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401b29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b2e:	e9 5b 08 00 00       	jmpq   40238e <submitr+0x90b>
  401b33:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  401b38:	e8 43 ef ff ff       	callq  400a80 <gethostbyname@plt>
  401b3d:	48 85 c0             	test   %rax,%rax
  401b40:	0f 85 85 00 00 00    	jne    401bcb <submitr+0x148>
  401b46:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401b4d:	41 c7 46 04 72 3a 20 	movl   $0x44203a72,0x4(%r14)
  401b54:	44 
  401b55:	41 c7 46 08 4e 53 20 	movl   $0x6920534e,0x8(%r14)
  401b5c:	69 
  401b5d:	41 c7 46 0c 73 20 75 	movl   $0x6e752073,0xc(%r14)
  401b64:	6e 
  401b65:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401b6c:	65 
  401b6d:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401b74:	20 
  401b75:	41 c7 46 18 72 65 73 	movl   $0x6f736572,0x18(%r14)
  401b7c:	6f 
  401b7d:	41 c7 46 1c 6c 76 65 	movl   $0x2065766c,0x1c(%r14)
  401b84:	20 
  401b85:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401b8c:	6f 
  401b8d:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401b94:	20 
  401b95:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401b9c:	76 
  401b9d:	41 c7 46 2c 65 72 20 	movl   $0x61207265,0x2c(%r14)
  401ba4:	61 
  401ba5:	41 c7 46 30 64 64 72 	movl   $0x65726464,0x30(%r14)
  401bac:	65 
  401bad:	66 41 c7 46 34 73 73 	movw   $0x7373,0x34(%r14)
  401bb4:	41 c6 46 36 00       	movb   $0x0,0x36(%r14)
  401bb9:	44 89 ef             	mov    %r13d,%edi
  401bbc:	e8 af ee ff ff       	callq  400a70 <close@plt>
  401bc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bc6:	e9 c3 07 00 00       	jmpq   40238e <submitr+0x90b>
  401bcb:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401bd2:	00 
  401bd3:	48 c7 84 24 60 a0 00 	movq   $0x0,0xa060(%rsp)
  401bda:	00 00 00 00 00 
  401bdf:	48 c7 84 24 68 a0 00 	movq   $0x0,0xa068(%rsp)
  401be6:	00 00 00 00 00 
  401beb:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401bf2:	00 02 00 
  401bf5:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401bf9:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401bfd:	48 8b 40 18          	mov    0x18(%rax),%rax
  401c01:	48 8b 38             	mov    (%rax),%rdi
  401c04:	e8 f7 ee ff ff       	callq  400b00 <bcopy@plt>
  401c09:	89 e8                	mov    %ebp,%eax
  401c0b:	66 c1 c8 08          	ror    $0x8,%ax
  401c0f:	66 89 84 24 62 a0 00 	mov    %ax,0xa062(%rsp)
  401c16:	00 
  401c17:	ba 10 00 00 00       	mov    $0x10,%edx
  401c1c:	48 89 de             	mov    %rbx,%rsi
  401c1f:	44 89 ef             	mov    %r13d,%edi
  401c22:	e8 39 ef ff ff       	callq  400b60 <connect@plt>
  401c27:	85 c0                	test   %eax,%eax
  401c29:	79 75                	jns    401ca0 <submitr+0x21d>
  401c2b:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401c32:	41 c7 46 04 72 3a 20 	movl   $0x55203a72,0x4(%r14)
  401c39:	55 
  401c3a:	41 c7 46 08 6e 61 62 	movl   $0x6c62616e,0x8(%r14)
  401c41:	6c 
  401c42:	41 c7 46 0c 65 20 74 	movl   $0x6f742065,0xc(%r14)
  401c49:	6f 
  401c4a:	41 c7 46 10 20 63 6f 	movl   $0x6e6f6320,0x10(%r14)
  401c51:	6e 
  401c52:	41 c7 46 14 6e 65 63 	movl   $0x7463656e,0x14(%r14)
  401c59:	74 
  401c5a:	41 c7 46 18 20 74 6f 	movl   $0x206f7420,0x18(%r14)
  401c61:	20 
  401c62:	41 c7 46 1c 74 68 65 	movl   $0x20656874,0x1c(%r14)
  401c69:	20 
  401c6a:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401c71:	6f 
  401c72:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401c79:	20 
  401c7a:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401c81:	76 
  401c82:	66 41 c7 46 2c 65 72 	movw   $0x7265,0x2c(%r14)
  401c89:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  401c8e:	44 89 ef             	mov    %r13d,%edi
  401c91:	e8 da ed ff ff       	callq  400a70 <close@plt>
  401c96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c9b:	e9 ee 06 00 00       	jmpq   40238e <submitr+0x90b>
  401ca0:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
  401ca7:	4c 89 ff             	mov    %r15,%rdi
  401caa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401cb0:	fc                   	cld    
  401cb1:	48 89 d9             	mov    %rbx,%rcx
  401cb4:	44 89 c0             	mov    %r8d,%eax
  401cb7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cb9:	48 89 ce             	mov    %rcx,%rsi
  401cbc:	48 f7 d6             	not    %rsi
  401cbf:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401cc4:	48 89 d9             	mov    %rbx,%rcx
  401cc7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cc9:	48 89 ca             	mov    %rcx,%rdx
  401ccc:	48 f7 d2             	not    %rdx
  401ccf:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401cd4:	48 89 d9             	mov    %rbx,%rcx
  401cd7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cd9:	49 89 c9             	mov    %rcx,%r9
  401cdc:	49 f7 d1             	not    %r9
  401cdf:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401ce4:	48 89 d9             	mov    %rbx,%rcx
  401ce7:	f2 ae                	repnz scas %es:(%rdi),%al
  401ce9:	48 f7 d1             	not    %rcx
  401cec:	49 8d 44 11 7e       	lea    0x7e(%r9,%rdx,1),%rax
  401cf1:	48 8d 4c 01 ff       	lea    -0x1(%rcx,%rax,1),%rcx
  401cf6:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401cfb:	48 01 c1             	add    %rax,%rcx
  401cfe:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401d05:	76 7e                	jbe    401d85 <submitr+0x302>
  401d07:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401d0e:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401d15:	52 
  401d16:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401d1d:	6c 
  401d1e:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401d25:	74 
  401d26:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401d2d:	67 
  401d2e:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401d35:	6f 
  401d36:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401d3d:	72 
  401d3e:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401d45:	20 
  401d46:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401d4d:	72 
  401d4e:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401d55:	65 
  401d56:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401d5d:	42 
  401d5e:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401d65:	52 
  401d66:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401d6d:	58 
  401d6e:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401d75:	00 
  401d76:	44 89 ef             	mov    %r13d,%edi
  401d79:	e8 f2 ec ff ff       	callq  400a70 <close@plt>
  401d7e:	89 d8                	mov    %ebx,%eax
  401d80:	e9 09 06 00 00       	jmpq   40238e <submitr+0x90b>
  401d85:	4c 8d a4 24 50 40 00 	lea    0x4050(%rsp),%r12
  401d8c:	00 
  401d8d:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d92:	be 00 00 00 00       	mov    $0x0,%esi
  401d97:	4c 89 e7             	mov    %r12,%rdi
  401d9a:	e8 c1 ec ff ff       	callq  400a60 <memset@plt>
  401d9f:	4c 89 fd             	mov    %r15,%rbp
  401da2:	4c 89 ff             	mov    %r15,%rdi
  401da5:	fc                   	cld    
  401da6:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401dad:	b8 00 00 00 00       	mov    $0x0,%eax
  401db2:	f2 ae                	repnz scas %es:(%rdi),%al
  401db4:	48 f7 d1             	not    %rcx
  401db7:	8d 59 fe             	lea    -0x2(%rcx),%ebx
  401dba:	83 fb ff             	cmp    $0xffffffff,%ebx
  401dbd:	0f 84 e6 04 00 00    	je     4022a9 <submitr+0x826>
  401dc3:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
  401dc8:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401dcc:	80 fa 2a             	cmp    $0x2a,%dl
  401dcf:	74 26                	je     401df7 <submitr+0x374>
  401dd1:	80 fa 2d             	cmp    $0x2d,%dl
  401dd4:	74 21                	je     401df7 <submitr+0x374>
  401dd6:	80 fa 2e             	cmp    $0x2e,%dl
  401dd9:	74 1c                	je     401df7 <submitr+0x374>
  401ddb:	80 fa 5f             	cmp    $0x5f,%dl
  401dde:	66 90                	xchg   %ax,%ax
  401de0:	74 15                	je     401df7 <submitr+0x374>
  401de2:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401de5:	3c 09                	cmp    $0x9,%al
  401de7:	76 0e                	jbe    401df7 <submitr+0x374>
  401de9:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401dec:	3c 19                	cmp    $0x19,%al
  401dee:	76 07                	jbe    401df7 <submitr+0x374>
  401df0:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401df3:	3c 19                	cmp    $0x19,%al
  401df5:	77 0a                	ja     401e01 <submitr+0x37e>
  401df7:	41 88 14 24          	mov    %dl,(%r12)
  401dfb:	49 83 c4 01          	add    $0x1,%r12
  401dff:	eb 52                	jmp    401e53 <submitr+0x3d0>
  401e01:	80 fa 20             	cmp    $0x20,%dl
  401e04:	75 0b                	jne    401e11 <submitr+0x38e>
  401e06:	41 c6 04 24 2b       	movb   $0x2b,(%r12)
  401e0b:	49 83 c4 01          	add    $0x1,%r12
  401e0f:	eb 42                	jmp    401e53 <submitr+0x3d0>
  401e11:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401e14:	3c 5f                	cmp    $0x5f,%al
  401e16:	76 05                	jbe    401e1d <submitr+0x39a>
  401e18:	80 fa 09             	cmp    $0x9,%dl
  401e1b:	75 4b                	jne    401e68 <submitr+0x3e5>
  401e1d:	0f b6 d2             	movzbl %dl,%edx
  401e20:	be 50 2c 40 00       	mov    $0x402c50,%esi
  401e25:	4c 89 ff             	mov    %r15,%rdi
  401e28:	b8 00 00 00 00       	mov    $0x0,%eax
  401e2d:	e8 ee ec ff ff       	callq  400b20 <sprintf@plt>
  401e32:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401e37:	41 88 04 24          	mov    %al,(%r12)
  401e3b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401e40:	41 88 44 24 01       	mov    %al,0x1(%r12)
  401e45:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401e4a:	41 88 44 24 02       	mov    %al,0x2(%r12)
  401e4f:	49 83 c4 03          	add    $0x3,%r12
  401e53:	83 eb 01             	sub    $0x1,%ebx
  401e56:	83 fb ff             	cmp    $0xffffffff,%ebx
  401e59:	0f 84 4a 04 00 00    	je     4022a9 <submitr+0x826>
  401e5f:	48 83 c5 01          	add    $0x1,%rbp
  401e63:	e9 60 ff ff ff       	jmpq   401dc8 <submitr+0x345>
  401e68:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401e6f:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401e76:	52 
  401e77:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401e7e:	6c 
  401e7f:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401e86:	74 
  401e87:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401e8e:	67 
  401e8f:	41 c7 46 14 20 63 6f 	movl   $0x6e6f6320,0x14(%r14)
  401e96:	6e 
  401e97:	41 c7 46 18 74 61 69 	movl   $0x6e696174,0x18(%r14)
  401e9e:	6e 
  401e9f:	41 c7 46 1c 73 20 61 	movl   $0x6e612073,0x1c(%r14)
  401ea6:	6e 
  401ea7:	41 c7 46 20 20 69 6c 	movl   $0x6c6c6920,0x20(%r14)
  401eae:	6c 
  401eaf:	41 c7 46 24 65 67 61 	movl   $0x6c616765,0x24(%r14)
  401eb6:	6c 
  401eb7:	41 c7 46 28 20 6f 72 	movl   $0x20726f20,0x28(%r14)
  401ebe:	20 
  401ebf:	41 c7 46 2c 75 6e 70 	movl   $0x72706e75,0x2c(%r14)
  401ec6:	72 
  401ec7:	41 c7 46 30 69 6e 74 	movl   $0x61746e69,0x30(%r14)
  401ece:	61 
  401ecf:	41 c7 46 34 62 6c 65 	movl   $0x20656c62,0x34(%r14)
  401ed6:	20 
  401ed7:	41 c7 46 38 63 68 61 	movl   $0x72616863,0x38(%r14)
  401ede:	72 
  401edf:	41 c7 46 3c 61 63 74 	movl   $0x65746361,0x3c(%r14)
  401ee6:	65 
  401ee7:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  401eee:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  401ef3:	44 89 ef             	mov    %r13d,%edi
  401ef6:	e8 75 eb ff ff       	callq  400a70 <close@plt>
  401efb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f00:	e9 89 04 00 00       	jmpq   40238e <submitr+0x90b>
  401f05:	48 01 c5             	add    %rax,%rbp
  401f08:	48 89 da             	mov    %rbx,%rdx
  401f0b:	48 89 ee             	mov    %rbp,%rsi
  401f0e:	44 89 ef             	mov    %r13d,%edi
  401f11:	e8 da ec ff ff       	callq  400bf0 <write@plt>
  401f16:	48 85 c0             	test   %rax,%rax
  401f19:	7f 0f                	jg     401f2a <submitr+0x4a7>
  401f1b:	e8 a0 ec ff ff       	callq  400bc0 <__errno_location@plt>
  401f20:	83 38 04             	cmpl   $0x4,(%rax)
  401f23:	75 0f                	jne    401f34 <submitr+0x4b1>
  401f25:	b8 00 00 00 00       	mov    $0x0,%eax
  401f2a:	48 29 c3             	sub    %rax,%rbx
  401f2d:	75 d6                	jne    401f05 <submitr+0x482>
  401f2f:	4d 85 e4             	test   %r12,%r12
  401f32:	79 79                	jns    401fad <submitr+0x52a>
  401f34:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401f3b:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401f42:	43 
  401f43:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401f4a:	6e 
  401f4b:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401f52:	6e 
  401f53:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401f5a:	65 
  401f5b:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f62:	20 
  401f63:	41 c7 46 18 77 72 69 	movl   $0x74697277,0x18(%r14)
  401f6a:	74 
  401f6b:	41 c7 46 1c 65 20 74 	movl   $0x6f742065,0x1c(%r14)
  401f72:	6f 
  401f73:	41 c7 46 20 20 74 68 	movl   $0x65687420,0x20(%r14)
  401f7a:	65 
  401f7b:	41 c7 46 24 20 41 75 	movl   $0x74754120,0x24(%r14)
  401f82:	74 
  401f83:	41 c7 46 28 6f 6c 61 	movl   $0x62616c6f,0x28(%r14)
  401f8a:	62 
  401f8b:	41 c7 46 2c 20 73 65 	movl   $0x72657320,0x2c(%r14)
  401f92:	72 
  401f93:	41 c7 46 30 76 65 72 	movl   $0x726576,0x30(%r14)
  401f9a:	00 
  401f9b:	44 89 ef             	mov    %r13d,%edi
  401f9e:	e8 cd ea ff ff       	callq  400a70 <close@plt>
  401fa3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fa8:	e9 e1 03 00 00       	jmpq   40238e <submitr+0x90b>
  401fad:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401fb4:	00 
  401fb5:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401fbc:	00 00 00 00 
  401fc0:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401fc7:	00 
  401fc8:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401fcc:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401fd3:	00 
  401fd4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401fdb:	00 
  401fdc:	ba 00 20 00 00       	mov    $0x2000,%edx
  401fe1:	e8 c3 f9 ff ff       	callq  4019a9 <rio_readlineb>
  401fe6:	48 85 c0             	test   %rax,%rax
  401fe9:	0f 8f 90 00 00 00    	jg     40207f <submitr+0x5fc>
  401fef:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401ff6:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ffd:	43 
  401ffe:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402005:	6e 
  402006:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  40200d:	6e 
  40200e:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402015:	65 
  402016:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  40201d:	20 
  40201e:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402025:	64 
  402026:	41 c7 46 1c 20 66 69 	movl   $0x72696620,0x1c(%r14)
  40202d:	72 
  40202e:	41 c7 46 20 73 74 20 	movl   $0x68207473,0x20(%r14)
  402035:	68 
  402036:	41 c7 46 24 65 61 64 	movl   $0x65646165,0x24(%r14)
  40203d:	65 
  40203e:	41 c7 46 28 72 20 66 	movl   $0x72662072,0x28(%r14)
  402045:	72 
  402046:	41 c7 46 2c 6f 6d 20 	movl   $0x41206d6f,0x2c(%r14)
  40204d:	41 
  40204e:	41 c7 46 30 75 74 6f 	movl   $0x6c6f7475,0x30(%r14)
  402055:	6c 
  402056:	41 c7 46 34 61 62 20 	movl   $0x73206261,0x34(%r14)
  40205d:	73 
  40205e:	41 c7 46 38 65 72 76 	movl   $0x65767265,0x38(%r14)
  402065:	65 
  402066:	66 41 c7 46 3c 72 00 	movw   $0x72,0x3c(%r14)
  40206d:	44 89 ef             	mov    %r13d,%edi
  402070:	e8 fb e9 ff ff       	callq  400a70 <close@plt>
  402075:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40207a:	e9 0f 03 00 00       	jmpq   40238e <submitr+0x90b>
  40207f:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
  402084:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  40208b:	00 
  40208c:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  402093:	00 
  402094:	48 8d bc 24 50 60 00 	lea    0x6050(%rsp),%rdi
  40209b:	00 
  40209c:	49 89 d8             	mov    %rbx,%r8
  40209f:	be 57 2c 40 00       	mov    $0x402c57,%esi
  4020a4:	b8 00 00 00 00       	mov    $0x0,%eax
  4020a9:	e8 92 ea ff ff       	callq  400b40 <sscanf@plt>
  4020ae:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  4020b5:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  4020bb:	74 4a                	je     402107 <submitr+0x684>
  4020bd:	48 89 d9             	mov    %rbx,%rcx
  4020c0:	be 98 2b 40 00       	mov    $0x402b98,%esi
  4020c5:	4c 89 f7             	mov    %r14,%rdi
  4020c8:	b8 00 00 00 00       	mov    $0x0,%eax
  4020cd:	e8 4e ea ff ff       	callq  400b20 <sprintf@plt>
  4020d2:	44 89 ef             	mov    %r13d,%edi
  4020d5:	e8 96 e9 ff ff       	callq  400a70 <close@plt>
  4020da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020df:	e9 aa 02 00 00       	jmpq   40238e <submitr+0x90b>
  4020e4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  4020eb:	00 
  4020ec:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  4020f3:	00 
  4020f4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020f9:	e8 ab f8 ff ff       	callq  4019a9 <rio_readlineb>
  4020fe:	48 85 c0             	test   %rax,%rax
  402101:	0f 8e 06 02 00 00    	jle    40230d <submitr+0x88a>
  402107:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40210e:	00 
  40210f:	0f b6 94 24 50 60 00 	movzbl 0x6050(%rsp),%edx
  402116:	00 
  402117:	0f b6 05 50 0b 00 00 	movzbl 0xb50(%rip),%eax        # 402c6e <array.3311+0x50e>
  40211e:	39 c2                	cmp    %eax,%edx
  402120:	75 c2                	jne    4020e4 <submitr+0x661>
  402122:	0f b6 94 24 51 60 00 	movzbl 0x6051(%rsp),%edx
  402129:	00 
  40212a:	0f b6 05 3e 0b 00 00 	movzbl 0xb3e(%rip),%eax        # 402c6f <array.3311+0x50f>
  402131:	39 c2                	cmp    %eax,%edx
  402133:	75 af                	jne    4020e4 <submitr+0x661>
  402135:	0f b6 94 24 52 60 00 	movzbl 0x6052(%rsp),%edx
  40213c:	00 
  40213d:	0f b6 05 2c 0b 00 00 	movzbl 0xb2c(%rip),%eax        # 402c70 <array.3311+0x510>
  402144:	39 c2                	cmp    %eax,%edx
  402146:	75 9c                	jne    4020e4 <submitr+0x661>
  402148:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  40214f:	00 
  402150:	ba 00 20 00 00       	mov    $0x2000,%edx
  402155:	e8 4f f8 ff ff       	callq  4019a9 <rio_readlineb>
  40215a:	48 85 c0             	test   %rax,%rax
  40215d:	0f 8f 91 00 00 00    	jg     4021f4 <submitr+0x771>
  402163:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  40216a:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  402171:	43 
  402172:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402179:	6e 
  40217a:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  402181:	6e 
  402182:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402189:	65 
  40218a:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  402191:	20 
  402192:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402199:	64 
  40219a:	41 c7 46 1c 20 73 74 	movl   $0x61747320,0x1c(%r14)
  4021a1:	61 
  4021a2:	41 c7 46 20 74 75 73 	movl   $0x20737574,0x20(%r14)
  4021a9:	20 
  4021aa:	41 c7 46 24 6d 65 73 	movl   $0x7373656d,0x24(%r14)
  4021b1:	73 
  4021b2:	41 c7 46 28 61 67 65 	movl   $0x20656761,0x28(%r14)
  4021b9:	20 
  4021ba:	41 c7 46 2c 66 72 6f 	movl   $0x6d6f7266,0x2c(%r14)
  4021c1:	6d 
  4021c2:	41 c7 46 30 20 41 75 	movl   $0x74754120,0x30(%r14)
  4021c9:	74 
  4021ca:	41 c7 46 34 6f 6c 61 	movl   $0x62616c6f,0x34(%r14)
  4021d1:	62 
  4021d2:	41 c7 46 38 20 73 65 	movl   $0x72657320,0x38(%r14)
  4021d9:	72 
  4021da:	41 c7 46 3c 76 65 72 	movl   $0x726576,0x3c(%r14)
  4021e1:	00 
  4021e2:	44 89 ef             	mov    %r13d,%edi
  4021e5:	e8 86 e8 ff ff       	callq  400a70 <close@plt>
  4021ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021ef:	e9 9a 01 00 00       	jmpq   40238e <submitr+0x90b>
  4021f4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  4021fb:	00 
  4021fc:	4c 89 f7             	mov    %r14,%rdi
  4021ff:	e8 cc e9 ff ff       	callq  400bd0 <strcpy@plt>
  402204:	44 89 ef             	mov    %r13d,%edi
  402207:	e8 64 e8 ff ff       	callq  400a70 <close@plt>
  40220c:	4d 89 f0             	mov    %r14,%r8
  40220f:	45 0f b6 0e          	movzbl (%r14),%r9d
  402213:	0f b6 05 4e 0a 00 00 	movzbl 0xa4e(%rip),%eax        # 402c68 <array.3311+0x508>
  40221a:	41 39 c1             	cmp    %eax,%r9d
  40221d:	75 30                	jne    40224f <submitr+0x7cc>
  40221f:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  402224:	0f b6 05 3e 0a 00 00 	movzbl 0xa3e(%rip),%eax        # 402c69 <array.3311+0x509>
  40222b:	39 c2                	cmp    %eax,%edx
  40222d:	75 20                	jne    40224f <submitr+0x7cc>
  40222f:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  402234:	0f b6 05 2f 0a 00 00 	movzbl 0xa2f(%rip),%eax        # 402c6a <array.3311+0x50a>
  40223b:	39 c2                	cmp    %eax,%edx
  40223d:	75 10                	jne    40224f <submitr+0x7cc>
  40223f:	41 0f b6 56 03       	movzbl 0x3(%r14),%edx
  402244:	0f b6 05 20 0a 00 00 	movzbl 0xa20(%rip),%eax        # 402c6b <array.3311+0x50b>
  40224b:	39 c2                	cmp    %eax,%edx
  40224d:	74 46                	je     402295 <submitr+0x812>
  40224f:	4c 89 f6             	mov    %r14,%rsi
  402252:	bf 6c 2c 40 00       	mov    $0x402c6c,%edi
  402257:	b9 05 00 00 00       	mov    $0x5,%ecx
  40225c:	fc                   	cld    
  40225d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40225f:	0f 97 c2             	seta   %dl
  402262:	0f 92 c0             	setb   %al
  402265:	38 c2                	cmp    %al,%dl
  402267:	74 2c                	je     402295 <submitr+0x812>
  402269:	0f b6 05 01 0a 00 00 	movzbl 0xa01(%rip),%eax        # 402c71 <array.3311+0x511>
  402270:	41 39 c1             	cmp    %eax,%r9d
  402273:	75 2a                	jne    40229f <submitr+0x81c>
  402275:	41 0f b6 50 01       	movzbl 0x1(%r8),%edx
  40227a:	0f b6 05 f1 09 00 00 	movzbl 0x9f1(%rip),%eax        # 402c72 <array.3311+0x512>
  402281:	39 c2                	cmp    %eax,%edx
  402283:	75 1a                	jne    40229f <submitr+0x81c>
  402285:	41 0f b6 50 02       	movzbl 0x2(%r8),%edx
  40228a:	0f b6 05 e2 09 00 00 	movzbl 0x9e2(%rip),%eax        # 402c73 <array.3311+0x513>
  402291:	39 c2                	cmp    %eax,%edx
  402293:	75 0a                	jne    40229f <submitr+0x81c>
  402295:	b8 00 00 00 00       	mov    $0x0,%eax
  40229a:	e9 ef 00 00 00       	jmpq   40238e <submitr+0x90b>
  40229f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022a4:	e9 e5 00 00 00       	jmpq   40238e <submitr+0x90b>
  4022a9:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  4022b0:	00 
  4022b1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4022b6:	48 89 04 24          	mov    %rax,(%rsp)
  4022ba:	4c 8d 8c 24 50 40 00 	lea    0x4050(%rsp),%r9
  4022c1:	00 
  4022c2:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  4022c7:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  4022cc:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  4022d1:	be c8 2b 40 00       	mov    $0x402bc8,%esi
  4022d6:	48 89 ef             	mov    %rbp,%rdi
  4022d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4022de:	e8 3d e8 ff ff       	callq  400b20 <sprintf@plt>
  4022e3:	48 89 ef             	mov    %rbp,%rdi
  4022e6:	fc                   	cld    
  4022e7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022ee:	b8 00 00 00 00       	mov    $0x0,%eax
  4022f3:	f2 ae                	repnz scas %es:(%rdi),%al
  4022f5:	48 f7 d1             	not    %rcx
  4022f8:	49 89 cc             	mov    %rcx,%r12
  4022fb:	49 83 ec 01          	sub    $0x1,%r12
  4022ff:	0f 84 a8 fc ff ff    	je     401fad <submitr+0x52a>
  402305:	4c 89 e3             	mov    %r12,%rbx
  402308:	e9 fb fb ff ff       	jmpq   401f08 <submitr+0x485>
  40230d:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  402314:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  40231b:	43 
  40231c:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402323:	6e 
  402324:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  40232b:	6e 
  40232c:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402333:	65 
  402334:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  40233b:	20 
  40233c:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402343:	64 
  402344:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  40234b:	61 
  40234c:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  402353:	73 
  402354:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  40235b:	6f 
  40235c:	41 c7 46 28 6d 20 41 	movl   $0x7541206d,0x28(%r14)
  402363:	75 
  402364:	41 c7 46 2c 74 6f 6c 	movl   $0x616c6f74,0x2c(%r14)
  40236b:	61 
  40236c:	41 c7 46 30 62 20 73 	movl   $0x65732062,0x30(%r14)
  402373:	65 
  402374:	41 c7 46 34 72 76 65 	movl   $0x72657672,0x34(%r14)
  40237b:	72 
  40237c:	41 c6 46 38 00       	movb   $0x0,0x38(%r14)
  402381:	44 89 ef             	mov    %r13d,%edi
  402384:	e8 e7 e6 ff ff       	callq  400a70 <close@plt>
  402389:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40238e:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  402395:	5b                   	pop    %rbx
  402396:	5d                   	pop    %rbp
  402397:	41 5c                	pop    %r12
  402399:	41 5d                	pop    %r13
  40239b:	41 5e                	pop    %r14
  40239d:	41 5f                	pop    %r15
  40239f:	c3                   	retq   

00000000004023a0 <driver_post>:
  4023a0:	53                   	push   %rbx
  4023a1:	48 83 ec 10          	sub    $0x10,%rsp
  4023a5:	48 89 cb             	mov    %rcx,%rbx
  4023a8:	85 d2                	test   %edx,%edx
  4023aa:	74 1f                	je     4023cb <driver_post+0x2b>
  4023ac:	bf 74 2c 40 00       	mov    $0x402c74,%edi
  4023b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b6:	e8 95 e6 ff ff       	callq  400a50 <printf@plt>
  4023bb:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4023c0:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4023c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4023c9:	eb 47                	jmp    402412 <driver_post+0x72>
  4023cb:	48 85 ff             	test   %rdi,%rdi
  4023ce:	74 34                	je     402404 <driver_post+0x64>
  4023d0:	0f b6 17             	movzbl (%rdi),%edx
  4023d3:	0f b6 05 96 08 00 00 	movzbl 0x896(%rip),%eax        # 402c70 <array.3311+0x510>
  4023da:	39 c2                	cmp    %eax,%edx
  4023dc:	74 26                	je     402404 <driver_post+0x64>
  4023de:	48 89 0c 24          	mov    %rcx,(%rsp)
  4023e2:	49 89 f1             	mov    %rsi,%r9
  4023e5:	41 b8 8b 2c 40 00    	mov    $0x402c8b,%r8d
  4023eb:	48 89 f9             	mov    %rdi,%rcx
  4023ee:	ba 93 2c 40 00       	mov    $0x402c93,%edx
  4023f3:	be 50 00 00 00       	mov    $0x50,%esi
  4023f8:	bf 78 2b 40 00       	mov    $0x402b78,%edi
  4023fd:	e8 81 f6 ff ff       	callq  401a83 <submitr>
  402402:	eb 0e                	jmp    402412 <driver_post+0x72>
  402404:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402409:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40240d:	b8 00 00 00 00       	mov    $0x0,%eax
  402412:	48 83 c4 10          	add    $0x10,%rsp
  402416:	5b                   	pop    %rbx
  402417:	c3                   	retq   

0000000000402418 <sigalrm_handler>:
  402418:	48 83 ec 08          	sub    $0x8,%rsp
  40241c:	ba 00 00 00 00       	mov    $0x0,%edx
  402421:	be 28 2c 40 00       	mov    $0x402c28,%esi
  402426:	48 8b 3d 1b 1d 20 00 	mov    0x201d1b(%rip),%rdi        # 604148 <stderr@@GLIBC_2.2.5>
  40242d:	b8 00 00 00 00       	mov    $0x0,%eax
  402432:	e8 a9 e7 ff ff       	callq  400be0 <fprintf@plt>
  402437:	bf 01 00 00 00       	mov    $0x1,%edi
  40243c:	e8 5f e6 ff ff       	callq  400aa0 <exit@plt>
  402441:	90                   	nop
  402442:	90                   	nop
  402443:	90                   	nop
  402444:	90                   	nop
  402445:	90                   	nop
  402446:	90                   	nop
  402447:	90                   	nop
  402448:	90                   	nop
  402449:	90                   	nop
  40244a:	90                   	nop
  40244b:	90                   	nop
  40244c:	90                   	nop
  40244d:	90                   	nop
  40244e:	90                   	nop
  40244f:	90                   	nop

0000000000402450 <__libc_csu_fini>:
  402450:	f3 c3                	repz retq 
  402452:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402460 <__libc_csu_init>:
  402460:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402465:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40246a:	4c 8d 25 0b 0d 20 00 	lea    0x200d0b(%rip),%r12        # 60317c <__fini_array_end>
  402471:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402476:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  40247b:	49 89 f6             	mov    %rsi,%r14
  40247e:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402483:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402488:	48 83 ec 38          	sub    $0x38,%rsp
  40248c:	41 89 ff             	mov    %edi,%r15d
  40248f:	49 89 d5             	mov    %rdx,%r13
  402492:	e8 91 e5 ff ff       	callq  400a28 <_init>
  402497:	48 8d 05 de 0c 20 00 	lea    0x200cde(%rip),%rax        # 60317c <__fini_array_end>
  40249e:	49 29 c4             	sub    %rax,%r12
  4024a1:	49 c1 fc 03          	sar    $0x3,%r12
  4024a5:	4d 85 e4             	test   %r12,%r12
  4024a8:	74 1e                	je     4024c8 <__libc_csu_init+0x68>
  4024aa:	31 ed                	xor    %ebp,%ebp
  4024ac:	48 89 c3             	mov    %rax,%rbx
  4024af:	90                   	nop
  4024b0:	48 83 c5 01          	add    $0x1,%rbp
  4024b4:	4c 89 ea             	mov    %r13,%rdx
  4024b7:	4c 89 f6             	mov    %r14,%rsi
  4024ba:	44 89 ff             	mov    %r15d,%edi
  4024bd:	ff 13                	callq  *(%rbx)
  4024bf:	48 83 c3 08          	add    $0x8,%rbx
  4024c3:	49 39 ec             	cmp    %rbp,%r12
  4024c6:	75 e8                	jne    4024b0 <__libc_csu_init+0x50>
  4024c8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4024cd:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4024d2:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4024d7:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4024dc:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4024e1:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4024e6:	48 83 c4 38          	add    $0x38,%rsp
  4024ea:	c3                   	retq   
  4024eb:	90                   	nop
  4024ec:	90                   	nop
  4024ed:	90                   	nop
  4024ee:	90                   	nop
  4024ef:	90                   	nop

00000000004024f0 <__do_global_ctors_aux>:
  4024f0:	55                   	push   %rbp
  4024f1:	48 89 e5             	mov    %rsp,%rbp
  4024f4:	53                   	push   %rbx
  4024f5:	bb 80 31 60 00       	mov    $0x603180,%ebx
  4024fa:	48 83 ec 08          	sub    $0x8,%rsp
  4024fe:	48 8b 05 7b 0c 20 00 	mov    0x200c7b(%rip),%rax        # 603180 <__CTOR_LIST__>
  402505:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402509:	74 14                	je     40251f <__do_global_ctors_aux+0x2f>
  40250b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402510:	48 83 eb 08          	sub    $0x8,%rbx
  402514:	ff d0                	callq  *%rax
  402516:	48 8b 03             	mov    (%rbx),%rax
  402519:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40251d:	75 f1                	jne    402510 <__do_global_ctors_aux+0x20>
  40251f:	48 83 c4 08          	add    $0x8,%rsp
  402523:	5b                   	pop    %rbx
  402524:	c9                   	leaveq 
  402525:	c3                   	retq   
  402526:	90                   	nop
  402527:	90                   	nop

Disassembly of section .fini:

0000000000402528 <_fini>:
  402528:	48 83 ec 08          	sub    $0x8,%rsp
  40252c:	e8 2f e7 ff ff       	callq  400c60 <__do_global_dtors_aux>
  402531:	48 83 c4 08          	add    $0x8,%rsp
  402535:	c3                   	retq   
