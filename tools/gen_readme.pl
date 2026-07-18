#!/usr/bin/env perl


# run as perl tools\gen_readme.pl from the root containing tools folder, that also contains lib folder 
use strict;
use warnings;
use utf8;

use Pod::Markdown;
use IO::File;

my @pm_files = (
    'lib/NepaliDateTime.pm'
);

my $markdown = '';

for my $file (@pm_files) {
    print "Parsing: $file\n";

    my $parser = Pod::Markdown->new;

    my $out = '';
    $parser->output_string(\$out);

    eval {
        $parser->parse_file($file);
    };

    die "Error parsing $file: $@" if $@;

    $markdown .= $out;
    $markdown .= "\n\n";

    print "  -> OK\n";
}

my $badges = <<'BADGES';
[![Perl CI](https://github.com/sumanstats/NepaliDateTime/actions/workflows/test.yml/badge.svg)](https://github.com/sumanstats/NepaliDateTime/actions/workflows/test.yml)
[![CPAN version](https://badge.fury.io/pl/NepaliDateTime.svg)](https://metacpan.org/dist/NepaliDateTime)
BADGES

my @lines = split /\n/, $markdown;
my @output;
my $inserted = 0;

for my $line (@lines) {
    push @output, $line;

    if (!$inserted && $line =~ /^#\s+/) {
        push @output, '';
        push @output, $badges;
        push @output, '';
        $inserted = 1;
    }
}

my $fh = IO::File->new('README.md', '>:encoding(UTF-8)')
    or die "Cannot create README.md: $!";

print {$fh} join("\n", @output);

close $fh;

print "Generated README.md\n";