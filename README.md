# NAME

[![Perl CI](https://github.com/sumanstats/NepaliDateTime/actions/workflows/test.yml/badge.svg)](https://github.com/sumanstats/NepaliDateTime/actions/workflows/test.yml)
[![CPAN version](https://badge.fury.io/pl/NepaliDateTime.svg)](https://metacpan.org/dist/NepaliDateTime)



NepaliDateTime - Bikram Sambat (B.S.) date and datetime for Perl

# SYNOPSIS

    use NepaliDateTime::Date;
    use NepaliDateTime::DateTime;

    # Today in BS
    my $today = NepaliDateTime::Date->today();
    printf "Today (BS): %s\n", $today->isoformat();

    # Construct a BS date
    my $d = NepaliDateTime::Date->new(2081, 3, 15);
    printf "Weekday: %s\n", $d->day_name();

    # Convert AD → BS
    use Time::Piece;
    my $ad = Time::Piece->strptime('2024-07-15', '%Y-%m-%d');
    my $bs = NepaliDateTime::Date->from_ad($ad->year, $ad->mon, $ad->mday);
    printf "BS: %s\n", $bs;

    # Convert BS → AD
    my ($y, $m, $d2) = $bs->to_ad();
    printf "AD: %04d-%02d-%02d\n", $y, $m, $d2;

    # Arithmetic
    my $tomorrow = $d->add_days(1);
    my $delta    = $tomorrow - $d;    # days difference

    # Formatting
    print $d->strftime('%B %Y'), "\n";          # "Asar 2081"
    print $d->strftime_np('%N %K'), "\n";       # Devanagari month + year
    print $d->format_devanagari(), "\n";        # full Devanagari

    # Fiscal year (Nepal: Shrawan–Ashadh)
    printf "Fiscal year: %d/%d\n", $d->fiscal_year();

    # Datetime
    my $now = NepaliDateTime::DateTime->now();
    printf "Now (BS): %s\n", $now->isoformat();

# DESCRIPTION

NepaliDateTime implements Bikram Sambat (B.S.) date handling for Perl,
mirroring the Python `nepali_datetime` library and extending it with
additional convenience features.

Supported BS date range: 1975-01-01 to 2100-12-30.

The reference anchor is:
  AD 1918-04-13  ≡  BS 1975-01-01

Nepal Standard Time is UTC+05:45.

# MODULES

- [NepaliDateTime::Date](https://metacpan.org/pod/NepaliDateTime%3A%3ADate)     – BS date object
- [NepaliDateTime::DateTime](https://metacpan.org/pod/NepaliDateTime%3A%3ADateTime) – BS datetime object (adds HH:MM:SS)

# AUTHOR

Dr Suman Khanal <suman81765@gmail.com> 

# COPYRIGHT

This software is copyright (c) 2026 by Dr Suman Khanal.

The full text of the license can be found in the LICENSE file included with this distribution.