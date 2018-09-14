#!/bin/bash
html_tmp="../tmp-html/other-type.html"
html="../other-type.html"
name="Other"

head='../tmp-html/head'
menu='../tmp-html/menu'
header='../tmp-html/header'


:>$html_tmp
:>$html


echo '<!DOCTYPE html>' >> $html_tmp
echo '<html>' >> $html_tmp

############################
#
# Genrate the html HEAD tag
#
############################
./head.sh "$name"
cat $head >> $html_tmp
echo ''>> $html_tmp

echo '<body>' >> $html_tmp

###########################
#
# Generate the navigation menu
#
###########################
./menu.sh
cat $menu >> $html_tmp
echo ''>> $html_tmp


##########################################
#
# Generate the content of other-type.html page
#
##########################################
echo '<div class=container>' >> $html_tmp


########################################
#
# Generate the header and about section
#
########################################
./header.sh
cat $header >>  $html_tmp
echo ''>> $html_tmp


echo ' <div id="page-title" class="row title-row">' >> $html_tmp
echo '  <div class="col-sm-4"></div>' >> $html_tmp
echo '  <div class="col-sm-4 center-col"><h1>other-type</h1></div>' >> $html_tmp
echo '  <div class="col-sm-4"></div>' >> $html_tmp
echo '</div>' >> $html_tmp


echo ' <div class="row">' >> $html_tmp
echo '  <div class="col-sm-5"></div>' >> $html_tmp
echo '   <div class="col-sm-2 center-col">' >> $html_tmp
echo "    <img src=\"img/construction.png\" alt=\"under construction\" class=\"center-img\" width=\"200\" />" >> $html_tmp
echo '   </div>' >> $html_tmp
echo '  <div class=col-sm-5></div>' >> $html_tmp
echo ' </div>' >> $html_tmp


###########################################
#
# Close container
#
###########################################
echo '</div>' >> $html_tmp


#Close html and body
echo '</body>' >> $html_tmp
echo '</html>' >> $html_tmp


##########################################
#
# Copy the produced page into the main folder
#
##########################################
cp $html_tmp $html
echo "..$name.html page has been generated"
