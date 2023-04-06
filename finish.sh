#!/bin/bash
mytitle="output"
echo -e '\033k'$mytitle'\033\\'
find -empty -type f -delete
mv screenshots parsed_xml.txt *.out *.xml *.gnmap *.nmap ./output
