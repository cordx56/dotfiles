#!/usr/bin/env perl

$latex = 'uplatex -interaction=nonstopmode %O %S';
$bibtex = 'upbibtex %O %B';
$dvipdf = 'dvipdfmx -o %D %O %S';
$pdf_mode = 3;
