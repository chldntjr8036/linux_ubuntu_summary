#!/bin/bash

# Program to output a system infomation page

TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME,by $USER"
cat << _EOF_
echo "<html>

        <head>
                <TITLE>$TITLE</TITLE>
        </head>
         <body>
                <h1>$TITLE</h1>
                <p>$TIME_STAMP</p>
         </body>
</html>"
_EOF_