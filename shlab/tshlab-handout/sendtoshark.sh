#!/bin/bash
expect -c "
spawn scp $1 cruan@bambooshark.ics.cs.cmu.edu:~/shlab/
expect {
    \"*assword\" {set timeout 300; send \"Siyu0916!\r\";}
      }
expect eof
            "
