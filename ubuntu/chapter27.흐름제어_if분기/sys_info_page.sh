#!/bin/bash

# Program to output a system infomation page

TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME,by $USER"

report_uptime() {
	cat <<- _EOF_
		<h2>System Uptime</h2>
		<pre>$(uptime)</pre>
		_EOF_
	return
}
report_disk_space() {
	cat <<- _EOF_
		<h2>Disk space </h2>
		<pre>$(df -h)</pre>
		_EOF_
	return
}

repot_home_space() {
	if [[ $(id -u) -eq 0 ]]; then
		cat <<- _EOF_
			<h2>Home Space Utilization(All Users)</h2>
			<pre>$(du -sh /home/*)</pre>
			_EOF_
	else
		cat <<-  _EOF_
			<h2>Home Space Utilization($USER)</h2>
			<pre>$(du -sh $HOME)</pre>
			_EOF_
	fi
	return
}
cat << _EOF_
echo "<html>

        <head>
                <TITLE>$TITLE</TITLE>
        </head>
         <body>
                <h1>$TITLE</h1>
                <p>$TIME_STAMP</p>
                $(report_uptime)
                $(report_disk_space)
                $(repot_home_space)
         </body>
</html>"
_EOF_
