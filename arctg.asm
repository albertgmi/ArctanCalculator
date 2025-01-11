section .text use32

global _calculate_arctan

_calculate_arctan:
    push ebp
    mov ebp, esp
    sub esp, 8
    mov dword [ebp-4], 0
    mov dword [ebp-8], 0
  
    %idefine arg_value dword [ebp + 8]
    %idefine power_of_ten dword [ebp + 12]   
    mov eax, 1
    mov ecx, dword [ebp + 12]   
    mov ebx, 1
    mov edx, 1
    mov ecx, 0
    finit
    fld1
    fld dword arg_value
    fcomi st1
    fstp st1
    jna check_less_than_one

check_greater_than_one:
    mov dword [ebp-4], 1
    fld1
    fdivrp st1
    fst dword arg_value
    fld1
    fld1
    faddp st1
    fldpi
    fdivrp st1
    fxch
    jmp calculate_series

check_less_than_one:
    fld1
    fchs
    fcomi st1
    fstp st0
    jna calculate_series

check_below_negative_one:
    mov dword [ebp-4], 1
    fld1
    fdivrp st1
    fst dword arg_value
    fld1
    fld1
    faddp st1
    fldpi
    fdivrp st1
    fchs
    fxch

calculate_series:
    add ebx, 2
    mov dword [ebp-8], ebx
    fild dword [ebp-8]
    fld dword arg_value
	
calculate_power_series:    
    fld dword arg_value
    fmulp st1
    inc edx
    cmp edx, ebx
    jne calculate_power_series

    xor edx, edx
    mov edx, 1
    
    fdivrp st1
    
    test ecx, 1
    jz flip_sign
    jnz continue_adding
    
flip_sign:
    fchs
    
continue_adding:
    faddp st1
    
    inc ecx
    cmp ecx, 2000
    jne calculate_series
    
    cmp dword [ebp-4], 1
    jne finish
    
correct_half_pi:
    fsubr st1
    
finish:
    fstp qword [temp]
    mov ecx, dword [ebp + 12]  
    cmp ecx, 0
    je handle_zero_case     
    cmp ecx, 1
    je handle_one_case    
    dec ecx  
    fld qword [ten]
    fld qword [ten]
    
calculate_power_of_ten:
    fmul st0, st1
    dec ecx
    jnz calculate_power_of_ten
    fstp qword [ten]
    jmp end_program
    
handle_zero_case:
    fld1
    fstp qword [ten]
    jmp end_program
    
handle_one_case:
    fld qword [ten]
    fstp qword [ten]
    jmp end_program
    
end_program:
    fld1
    fld qword [ten]
    fdiv st1, st0
    fstp qword [ten_inverted]  
    fstp qword [ten_inverted]
    fld qword [temp]
    fld qword [ten]
    fmul st1
    frndint
    fld qword [ten_inverted]
    fmul st1
    mov esp, ebp
    pop ebp
    ret

ten dq 10.00
ten_inverted dq 1.00
temp dq 1.00