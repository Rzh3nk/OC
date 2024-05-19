	.file  "fibbonacci.c"              ; Имя файла
	.text                              ; Секция кода
	.section  .rodata.str1.1,"aMS",@progbits,1
.LC0:  ;Текстовая константа
	.string  "Cannot read all the data" ; Строка "Cannot read all the data"
	.section  .rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:  ;Текстовая константа
	.string  "(SUBPROCESS) Fibbonacci number on position %ld is %ld.\n" ; Строка с форматированием
	.text
	.p2align 4
	.globl  run_fibb                   ; Глобальное объявление run_fibb
	.type  run_fibb, @function         ; Указание типа функции
run_fibb:
.LFB22:
	.cfi_startproc                      ; Начало процедуры
	pushq  %rbx                         ; Сохранение регистра %rbx
	.cfi_def_cfa_offset 16            
	.cfi_offset 3, -16                
	subq  $32, %rsp                     ; Выделение места на стеке
	.cfi_def_cfa_offset 48
	movl  4+p(%rip), %edi               ; Загрузка аргумента в %edi
	movq  %fs:40, %rax                  ; Загрузка адреса защитного стека
	movq  %rax, 24(%rsp)                ; Сохранение адреса защитного стека
	xorl  %eax, %eax                    ; Установка регистра %eax в 0
	movq  $0, 8(%rsp)                   ; Установка значения на стеке
	call  close@PLT                     ; Вызов функции close
	movl  p(%rip), %edi                 ; Загрузка значения в регистр %edi
	leaq  8(%rsp), %rsi                 ; Загрузка адреса в регистр %rsi
	movl  $8, %edx                      ; Загрузка значения в регистр %edx
	call  read@PLT                      ; Вызов функции read
	movl  p(%rip), %edi                 ; Загрузка значения в регистр %edi
	movq  %rax, %rbx                    ; Перемещение значения из %rax в %rbx
	call  close@PLT                     ; Вызов функции close
	cmpq  $8, %rbx                      ; Сравнение значений
	jne  .L6                            ; Переход к L6
	movq  8(%rsp), %rax                 ; Загружаем значение в  %rax
	leaq  -1(%rax), %rdi  
	call  fibb@PLT                      ; Вызываем функцию fibb@PLT
	movq  8(%rsp), %rsi                 ; Загружаем значение в  %rsi
	leaq  .LC1(%rip), %rdi 
	movq  %rax, %rdx                    ; Копируем значение из регистра %rax в регистр %rdx
	movq  %rax, 16(%rsp)                ; Записываем значение из регистра %rax 
	xorl  %eax, %eax                    ; Обнуляем регистр %eax путем выполнения операции XOR с самим собой
	call  printf@PLT                    ; Вызываем функцию printf@PLT
	movl  o(%rip), %edi                 ; Загружаем значение в %edi
	call  close@PLT                     ; Вызываем функцию close@PLT
	movl  4+o(%rip), %edi               ; Загружаем значение в %edi
	leaq  16(%rsp), %rsi  
	movl  $8, %edx                      ; Загружаем значение в  %edx
	call  write@PLT                     ; Вызываем функцию write@PLT
	movl  4+o(%rip), %edi               ; Загружаем значениев регистр %edi
	call  close@PLT                     ; Вызываем функцию close@PLT
	movq  24(%rsp), %rax                ; Загружаем значение в %rax
	subq  %fs:40, %rax    
	jne  .L7                            ; Переход к L7
	addq  $32, %rsp     
	.cfi_remember_state                 ; Сохраняем состояние
	.cfi_def_cfa_offset 16              ; Определяем смещение текущего указателя стека как 16
	popq  %rbx                          ; Извлекаем значение в  %rbx
	.cfi_def_cfa_offset 8               ; Определяем смещение текущего указателя стека как 8
	ret                                 ; Возвращаемся из функции
.L6:
	.cfi_restore_state
	leaq  .LC0(%rip), %rdi              ; Загрузка адреса строки в %rdi
	call  puts@PLT                      ; Вызов функции puts
	movl  $1, %edi                      ; Установка значения в %edi
	call  _exit@PLT                     ; Вызов функции _exit
.L7:
	call  __stack_chk_fail@PLT          ; Вызов функции __stack_chk_fail
	.cfi_endproc
.LFE22:
	.size  run_fibb, .-run_fibb         ; Размер процедуры
	.section  .rodata.str1.1
.LC2:
	.string  "Hello, World!"             ; Строка "Hello, World!"
	.section  .rodata.str1.8
	.align 8
.LC3:.string  "Fibbonacci number on position %ld is %ld. (Taken from child process)\n" ; Строка с форматированием
	.section  .rodata.str1.1
.LC4:
	.string  "A Child process killed."   ; Строка
	.section  .text.startup,"ax",@progbits
	.p2align 4                           
	.globl  main                         ; Глобально видимая метка main
	.type  main, @function               ; Указывает тип метки main как функции
main:                                  ; Метка main
.LFB23:                                ; Локальная метка
	.cfi_startproc                       
	pushq  %rbp                          ; Помещает текущее значение регистра %rbp на стек
	.cfi_def_cfa_offset 16               
	.cfi_offset 6, -16                   
	leaq  .LC2(%rip), %rdi               ; Загружает в %rdi
	pushq  %rbx                          ; Помещает текущее значение регистра %rbx на стек
	.cfi_def_cfa_offset 24               
	.cfi_offset 3, -24                   
	subq  $24, %rsp                      
	.cfi_def_cfa_offset 48               
	movq  %fs:40, %rax                   ; Загружает в %rax
	movq  %rax, 8(%rsp)                  ; Помещает значение %rax на стек
	xorl  %eax, %eax                     ; Обнуляем регистр %eax путем выполнения операции XOR с самим собой
	call  puts@PLT                       ; Вызывает функцию puts
	leaq  p(%rip), %rdi                  ; Загружает адрес p в  %rdi
	call  pipe@PLT                       ; Вызывает функцию pipe
	leaq  o(%rip), %rdi                  ; Загружает адрес o в  %rdi
	call  pipe@PLT                       ; Вызывает функцию pipe
	call  fork@PLT                       ; Вызывает функцию fork
	testl  %eax, %eax                    ; Проверяет, равны ли значения в %eax
	jne  .L9                             ; Переход в метку .L9, если условие истинно
	xorl  %eax, %eax                     ; Обнуляем регистр %eax путем выполнения операции XOR с самим собой
	call  run_fibb                       ; Вызывает функцию run_fibb
.L10:                                  ; Метка .L10
	movq  8(%rsp), %rax                  
	subq  %fs:40, %rax                   
	jne  .L13                            ; Переход в метку .L13, если условие истинно
	addq  $24, %rsp                      
	.cfi_remember_state                  
	.cfi_def_cfa_offset 24               
	xorl  %eax, %eax                     ;  Обнуляем регистр %eax путем выполнения операции XOR с самим собой
	popq  %rbx                           ; Извлекает значение из стека в %rbx
	.cfi_def_cfa_offset 16               
	popq  %rbp                           ; Извлекает значение из стека в %rbp
	.cfi_def_cfa_offset 8                
	ret                                  ; Возвращает из функции 
.L9:                                   ; Метка .L9
	.cfi_restore_state                   
	movl  p(%rip), %edi                  ; Помещает значение p в %edi
	movl  %eax, %ebx                     ; Копирует значение из %eax в %ebx
	movq  %rsp, %rbp                     ; Копирует значение из %rsp в %rbp
	call  close@PLT                      ; Вызывает функцию close
	movl  4+p(%rip), %edi                ; Помещает значение (4+p) в %edi
	movl  $8, %edx                       ; Помещает значение 8 в %edx
	leaq  n(%rip), %rsi                  ; Загружает адрес n в %rsi
	call  write@PLT                      ; Вызывает функцию write
	movl  4+p(%rip), %edi                ; Помещает значение (4+p) в %edi
	call  close@PLT                      ; Вызывает функцию close
	movl  4+o(%rip), %edi                ; Помещает значение (4+o) в %edi
	call  close@PLT                      ; Вызывает функцию close
	movl  o(%rip), %edi                  ; Помещает значение o в %edi
	movq  %rbp, %rsi                     ; Загружает значение %rbp в %rsi
	movl  $8, %edx                       ; Помещает значение 8 в %edx
	call  read@PLT                       ; Вызывает функцию read
	movl  o(%rip), %edi                  ; Помещает значение o в %edi
	call  close@PLT                      ; Вызывает функцию close
	movq  (%rsp), %rdx                   ; Загружает значение из %rsp в %rdx
	movq  n(%rip), %rsi                  ; Загружает адрес n в %rsi
	xorl  %eax, %eax                     ; Обнуляем регистр %eax путем выполнения операции XOR с самим собой
	leaq  .LC3(%rip), %rdi               
	call  printf@PLT                     ; Вызывает функцию printf
	movl  %ebx, %edi                   ; Помещает значение из %ebx в %edi
	xorl  %edx, %edx                     ; Обнуляем регистр %edx путем выполнения операции XOR с самим собой
	movq  %rbp, %rsi                     ; Загружает значение %rbp в %rsi
	call  waitpid@PLT                    ; Вызывает функцию waitpid
	leaq  .LC4(%rip), %rdi               ; Загружает адрес .LC4 в %rdi
	call  puts@PLT                       ; Вызывает функцию puts
	jmp  .L10                            ; Безусловный переход в метку .L10
.L13:                                  ; Метка .L13
	call  __stack_chk_fail@PLT           ; Вызывает функцию __stack_chk_fail
	.cfi_endproc                         
.LFE23:                                ; Локальная метка
	.size  main, .-main                  
	.globl  n                            ; Глобальное объявление переменной n
	.data                                ; Секция инициализированных данных
	.align 8
	.type  n, @object                    ; Указание типа переменной
	.size  n, 8                          ; Размер переменной n
n:
	.quad  12                            ; Инициализация значения
	.globl  o                            ; Глобальное объявление переменной o
	.bss                                 ; Раздел неинициализированных данных
	.align 8
	.type  o, @object                    ; Указание типа переменной
	.size  o, 8                          ; Размер переменной o
o:
	.zero  8                             
	.globl  p                            ; Глобальное объявление переменной p
	.align 8
	.type  p, @object                    ; Указание типа переменной
	.size  p, 8                          ; Размер переменной p
p:
	.zero  8                             
	.ident  "GCC: (GNU) 13.2.1 20230801" 
	.section  .note.GNU-stack,"",@progbits	
