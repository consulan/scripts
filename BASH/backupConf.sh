#!/bin/bash
tar -cvf /TFTP/35602P/Bck_$(date '+%Y')_$(date '+%B')_$(date '+%d').tar /TFTP/35602P
rm -fr /TFTP/35602P/c*
