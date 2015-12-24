#!/usr/bin/perl -w

use Test::More;

use BibTeX::Parser;
use IO::File;


my $fh = new IO::File "t/bibs/01.bib", "r" ;

my $parser = new BibTeX::Parser $fh;


while (my $entry = $parser->next) {
    if($entry->key eq 'key01') {
	my $result='@ARTICLE{key01,
    month = {January~1},
    title = {Title text},
    author = {Duck, Donald and Else, Someone},
    year = {1950},
}';
    is($entry->to_string,$result);
    }

}

done_testing();
