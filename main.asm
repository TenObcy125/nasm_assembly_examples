section .data
  star db "*"
  nl db 0xA
  space db 0x20

section .text
  global _start

_start:
  mov esi, 1

_outer_loop:
  mov edi, 0

_inner_loop:
  call _print_star

  inc edi
  cmp edi, esi
  jl _inner_loop

  mov eax, 4
  mov ebx, 1
  mov ecx, nl
  mov edx, 1
  int 0x80

  inc esi
  cmp esi, 11
  jl _outer_loop

  mov eax, 1
  xor ebx, ebx
  int 0x80

_print_star:
  mov eax, 4
  mov ebx, 1
  mov ecx, star
  mov edx, 1
  int 0x80
  ret

