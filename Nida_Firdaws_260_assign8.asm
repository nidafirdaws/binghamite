.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


; change NUM to the value that you want to run the program with 
NUM = 12
.data

; do NOT change quadArray here in the data segment!!!
; You will be building this array with your loop

quadArray DWORD NUM DUP(0)

.code
main proc
	
	; initialize esi
mov esi, OFFSET quadArray
mov ecx, NUM
sub ecx, 4 ;Comment 1: Here I am initializing the counter ecx, which keeps track of the number of times the loop will execute. I want ecx to be 4 operations subtracted from the size of the array, found in NUM, since the first four base cases are initialized in the following lines. 

sub eax, eax ;Comment 2: Clearing the registers so I can ensure 1 is the only number in eax. A better way to do this would be to just mov 1 into the eax register. 
mov bx, 1
mov edx, 0
mov eax, NUM
cmp eax, edx ;Comment 3: This check is repeated four times throughout the code so that the code will skip the loop if NUM is found to be less than 4. This ensures that it is flexible with all positive N.
je less_than_four ;Comment 4: Jumps to the line less_than_four which is right before invoke exit process. 
add [esi], bx
mov edx, 1
cmp eax, edx
je less_than_four
add [esi+4], bx
mov edx, 2
cmp eax, edx
je less_than_four
add [esi+8], bx
mov edx, 3
cmp eax, edx
je less_than_four
add [esi+12], bx
mov edx, 4
cmp eax, edx
je less_than_four
sub ebx, ebx
mov ebx, 16 ;Comment 5: This gets ebx ready for indexing in the loop below, so that the previous index will be at ebx-4 which is 12, 8, 4 and 0 respectively. 
sub edx, edx ;Comment 6: This clears edx for use in storing the previous terms in the array. 

l1: 
	
	mov edx, [esi+ebx-4] ;Comment 9: Term before [esi+ebx], which is the current term in the iteration of the array. No immediate operands are being used. 
	add [esi+ebx], edx
	mov edx, [esi+ebx-8] ;Comment 10: Term before [esi+ebx-4]. moving backwards by 4 to access the correct spot. 
	add [esi+ebx], edx
	mov edx, [esi+ebx-12]
	add [esi+ebx], edx
	mov edx, [esi+ebx-16]
	add [esi+ebx], edx
	add ebx, 4 ;Comment 7: Incrementing ebx by 4 each time so we move into the correct spots in memory address 0x00404000 in Memory 1.
	
loop l1

;Comment 8: Label for the je in the first 15 lines of code, which exits the program if a condition n<=4 is met. 
 less_than_four: 
	invoke	ExitProcess,0
main endp
end main