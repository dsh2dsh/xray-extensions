include global_ns_reg_macro2.asm

global_space_ext2: ; �������, ����������� ������� �������� ���������� �������
	; ����� ������ ��, ��� ��������
	call    register__gs_sell_condition__fl_fl
	pop     ecx
	pop     ecx
	; ��������� ���� ���
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetGameTime, "set_game_time"
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetFloatArgs12, "set_float_args_12"
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetFloatArgs34, "set_float_args_34"
	; ��� �������
	jmp back_from_global_space_ext2
;

global_space_ext2_additional:
	; ����� ������ ��, ��� ��������
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	; ��������� ���� ���
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	; ��� �������
	jmp back_from_global_space_ext2_additional



SetGameTime proc
time        = dword ptr 8
time_factor = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ecx
	
	mov     ecx, ds:g_pGamePersistent
	mov     ecx, [ecx]
	mov     ecx, [ecx+46Ch] ; _DWORD
	
	mov     eax, [ebp+time]
	push    eax
	mov     eax, [ebp+time_factor]
	push    eax
	call    ds:CEnvironment__SetGameTime
	
	pop     ecx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn
SetGameTime endp

g_float_arg1 dd 0.0
g_float_arg2 dd 0.0
g_float_arg3 dd 0.0
g_float_arg4 dd 0.0

stub_test dd 9 dup(0)

SetFloatArgs12 proc
arg1 = dword ptr 4h
arg2 = dword ptr 8h
	mov eax, [esp+arg1]
;PRINT_FLOAT "arg1=%f", eax
	mov [g_float_arg1], eax
	mov eax, [esp+arg2]
;PRINT_FLOAT "arg2=%f", eax
	mov [g_float_arg2], eax
	retn
SetFloatArgs12 endp

SetFloatArgs34 proc
arg3 = dword ptr 4h
arg4 = dword ptr 8h
	mov eax, [esp+arg3]
;PRINT_FLOAT "arg3=%f", eax
	mov [g_float_arg3], eax
	mov eax, [esp+arg4]
;PRINT_FLOAT "arg4=%f", eax
	mov [g_float_arg4], eax
	retn
SetFloatArgs34 endp
