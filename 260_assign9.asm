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
	
; IMPLEMENT THIS
; IMPLEMENT THIS
; IMPLEMENT THIS
; IMPLEMENT THIS
; IMPLEMENT THIS

	invoke ExitProcess,0
main endp
end main