#! /usr/bin/expect
sleep 1;
set IP [lindex $argv 0];
set user [lindex $argv 1];
set send_human { .3 .4 0.6 .1 3 }
spawn telnet $IP
	expect  {
		 "User " {		
				send -- "$user\r";
				expect {
					"*assword:" { send -- "H3c4t0mb3\r"; }
        				timeout { send -h "timeout connecting \r\r"; }
				}
				interact;
		}
			timeout{ send -- "unable to connect \r"; }
	}
