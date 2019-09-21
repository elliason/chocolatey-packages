# bash script to create a list of locally installed Chocolatey packages
# run this like: 
# $ sh .\Export-Chocolatey.sh > packages.config
echo '<?xml version="1.0" encoding="utf-8"?>'
echo '<packages>'
choco list --localonly --limitoutput --yes | while read line; do
    # substring id from current line
    id0=${line%%|*}
    # substring version from current line
    version0=${line#*|}
    # remove carriage return character
    id=${id0//$'\r'}
    # remove carriage return character
    version=${version0//$'\r'}
    echo "<package id=\"$id\" version=\"$version\" />"  
done
echo '</packages>'
