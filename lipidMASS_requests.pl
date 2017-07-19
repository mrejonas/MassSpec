#!/usr/bin/perl

# 1. get m/z from file
# 2. download lipdomics data from lipidMASS db via REST API

@scriptlist = ("LMSDSearch.php", "LMSDRecord.php") ;
# REST URL
$baseurl = "http://www.lipidmaps.org/data/structure/";
($script, $mode, $mass, $outmode, $outtype, $head) = @ARGV ;
$script = $scriptlist[$script];
$mode = "Mode=$mode";
$mass = "ExactMass=$mass";
$outmode = "OutputMode=$outmode";
$outtype = "OutputType=$outtype";
$head = "OutputColumnHeader=$head";

$url = "$baseurl?$script&$mode&$mass&$outmode&$outtype&$head" ;
#wget -O "Test.tsv" "http://www.lipidmaps.org/data/structure/LMSDSearch.php?
#  Mode=ProcessTextSearch&
#  ExactMass=695.566&
#  OutputMode=File&
#  OutputType=TSV&
#  OutputColumnHeader=Yes"
