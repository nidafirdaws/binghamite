; Program template
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword



DAYS = 7     ; constant representing the number of days in a week
HOURS = 24   ; constant representing the number of hours in a day
MINUTES = 60  ; constant representing the number of minutes in an hour
SECONDS = 60  ; constant representing the number of seconds in a minute

.data
date_time DWORD ? ; byte 0000 stores the DAY, byte 0001 stores the HOUR, byte 0002 stores the MINUTE, and byte 0003 stores the SECOND
num_of_iters DWORD 0  ; counts the total number of iterations
day BYTE DAYS   ; used to restore cl to the current day value
hour BYTE HOURS  ; used to restore cl to the current hour value
minute BYTE MINUTES  ; used to restore cl to the current minute value


.code
main proc

mov ecx, SECONDS
jmp s

d: 
 mov esi,OFFSET date_time+1 ;Comment 1: This will get the address of the day within the date_time DWORD, which is stored in BYTE 0000. We access this value from esi and store 0 in it as the beginning value. 
 mov BYTE PTR [esi], 0
 dec day ;Comment 2: The day constant defined in the first few lines of code is decremented to signify that we've begun processing the first day of 7 days. 
 mov esi, OFFSET date_time ;Comment 3: To prepare for the next loop, esi will now store the address of the BYTE storing the hour in date_time. 
 inc BYTE PTR [esi] ;Comment 4: Increment the number of days we stored in esi from 0 to 1.
 mov day, cl ;Comment 5: When we enter the d loop again, day will store the value we are currently at in the loop.
 mov cl, HOURS ;Comment 6: cl will now currently store the value for the next loop , which is hours. 

 ;Comment 7: The same process is repeated in the following three loops, accessing the appropriate values in the BYTES of date_time. 
h: 
 mov esi, OFFSET date_time+2
 mov BYTE PTR [esi], 0
 dec hour
 mov esi, OFFSET date_time+1
 inc BYTE PTR [esi]
 mov hour, cl
 mov cl, MINUTES

m: 
 mov esi, OFFSET date_time+3
 mov BYTE PTR [esi],0
 dec minute
 mov esi, OFFSET date_time + 2
 inc BYTE PTR [esi]
 mov minute, cl 
 mov cl, SECONDS

s: 
 inc num_of_iters ;Comment 8: One full iteration of all loops is completed at this point, so we increment num_of_iters after reaching seconds. 
 mov esi, OFFSET date_time+3 ;Comment 9: Proceed normally like in previous loops, storing the address of the seconds byte in date_time to esi. Then, increment number of seconds by 1. 
 inc BYTE PTR [esi]

 loop s
mov cl, minute ;Comment 10: Each of these moves back to the inner loops. For example, right after seconds terminates, minutes will begin and terminate, then hours will begin and terminate, and then days will begin and terminate. 
loop m
mov cl, hour
loop h
mov cl, day
loop d

 mov esi, OFFSET date_time+3 ;Comment 11: Final value stores one hour, minute, and second than wanted, so the values are decremented here to account for that. 
 dec BYTE PTR [esi]
 mov esi, OFFSET date_time+2
 dec BYTE PTR [esi]
 mov esi, OFFSET date_time+1
 dec BYTE PTR [esi]
 

invoke ExitProcess,0
main endp
end main