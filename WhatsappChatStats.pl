#!/usr/bin/env perl
# Author : Hatim Bookwala
# Date : 15th October 2017

%hash_date_string;
%hash_month_string;
%hash_person;

$filename = @ARGV[0];

open(my $infile, '<:encoding(UTF-8)', $filename) || die "Cannot open file $filename";
my $datekey = "";
my $monthkey = "";
my $day = "";
my $month = "";
my $year = "";
my $time = "";
my $name = "";
my $conv = "";
while (my $row = <$infile>) 
{
	chomp $row;
	if($row =~ m/^(\d+)\/(\d+)\/(\d+),\s(\d+:\d+\s\w\w)\s-\s(.+?):\s(.+)$/)
	{
	   $month = $1;
	   $day = $2;
	   $year = $3;
	   $time = $4;
	   $name = $5;
	   $conv = $6;
	      
	   $len = length($conv);
	   $datekey = $month . '/' . $day . '/' . $year;
	   $monthkey = $month . '/' . $year;
	}
	else
	{
		$conv = $row;
		$len = length($conv);
	}
	
	if(!defined $hash_date_string{$datekey} && $datekey ne "")
    {
		$hash_date_string{$datekey} = $len;
    }
    else
    {
		$hash_date_string{$datekey} += $len;
    }
	
	if(!defined $hash_month_string{$monthkey} && $monthkey ne "")
    {
		$hash_month_string{$monthkey} = $len;
    }
    else
    {
		$hash_month_string{$monthkey} += $len;
    }
   
    if(!defined $hash_person{$name} && $name ne "") 
    {
		$hash_person{$name} = $len;
    }
    else
    {
		$hash_person{$name} += $len;
    }	
}


open(DAY, '>:encoding(UTF-8)', "daywise.txt") or die"Cannot open output file";
open(PER, '>:encoding(UTF-8)', "personwise.txt")or die"Cannot open output file";
open(MTH, '>:encoding(UTF-8)', "monthwise.txt")or die"Cannot open output file";

while (my ($key, $value) = each(%hash_date_string)) 
{
   if($key ne "" && $value != 0) { print(DAY "$key:$value\n"); }
}

while (my ($key, $value) = each(%hash_person))
{
  if($key ne "" && $value != 0) { print(PER "$key:$value\n"); }
}

while (my ($key, $value) = each(%hash_month_string))
{
  if($key ne "" && $value != 0) { print(MTH "$key:$value\n"); }
}

