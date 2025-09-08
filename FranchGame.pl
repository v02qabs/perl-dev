#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use open ':std', ':encoding(UTF-8)';
use Time::HiRes qw( time );
use List::Util qw(shuffle);

# Configuration
my $rounds = 8;            # number of prompts per run
my $show_answer = 1;       # show correct answer after wrong entry (1/0)
my $phrases_ref = [
    # single words, short phrases, and landmark names (UTF-8)
    "bonjour",
    "merci",
    "au revoir",
    "s'il vous plaît",
    "liberté égalité fraternité",
    "tour Eiffel",
    "Louvre",
    "Notre-Dame",
    "champs-Élysées",
    "baguette",
    "fromage",
    "vin rouge",
    "croissant",
    "pâtisserie",
    "montmartre",
    "provence",
    "côte d'azur",
    "île de la Cité",
    "métro",
    "bonjour madame",
    "bonsoir",
    "à bientôt",
    "quelle heure est-il ?",
    "j'adore la France",
    "je m'appelle",
];

# Welcome / instructions
print "=" x 60, "\n";
print "FRANCE TYPING CHALLENGE — Perl edition\n";
print "Type the phrase exactly as shown (accents count). Press Enter when done.\n";
print "Rounds: $rounds. Try to be both fast and accurate!\n";
print "Tip: make sure your terminal encoding is UTF-8.\n";
print "=" x 60, "\n\n";

# Prepare game items
my @items = shuffle(@$phrases_ref);
# Ensure enough items
if (@items < $rounds) {
    push @items, shuffle(@$phrases_ref);
}
@items = @items[0 .. $rounds-1];

my $total_chars = 0;
my $total_typed_chars = 0;
my $total_errors = 0;
my $total_time = 0;

for (my $i = 0; $i < $rounds; $i++) {
    my $target = $items[$i];
    $total_chars += length($target);

    printf "Round %d/%d\n", $i+1, $rounds;
    print ">>> $target\n";
    print "Your input: ";
    STDOUT->flush;

    my $t0 = time();
    my $input = <STDIN>;
    chomp $input;
    my $t1 = time();
    my $elapsed = $t1 - $t0;
    $total_time += $elapsed;
    $total_typed_chars += length($input);

    # Compute simple char-by-char errors (case-sensitive)
    my $errors = char_diff_count($target, $input);
    $total_errors += $errors;

    my $correct = ($errors == 0) ? "✅ Correct" : "❌ Incorrect";
    printf "%s — time: %.2f s — errors: %d\n", $correct, $elapsed, $errors;
    if ($errors && $show_answer) {
        print "Expected: $target\n";
        print "Got     : $input\n";
    }
    print "-" x 40, "\n";
}

# Score summary
my $accuracy = 0;
if ($total_chars > 0) {
    $accuracy = 100 * (1 - $total_errors / $total_chars);
    $accuracy = 0 if $accuracy < 0;
}
my $wpm = 0;
if ($total_time > 0) {
    # Standard WPM: 5 chars per word
    $wpm = ($total_typed_chars / 5) / ($total_time / 60);
}

print "\n", "=" x 60, "\n";
print "RESULTS\n";
printf "Total time: %.2f s\n", $total_time;
printf "Total chars (targets): %d\n", $total_chars;
printf "Total chars typed: %d\n", $total_typed_chars;
printf "Total errors: %d\n", $total_errors;
printf "Accuracy: %.2f %%\n", $accuracy;
printf "Estimated WPM: %.1f\n", $wpm;
print "=" x 60, "\n";

# Helper: count char differences (naive)
sub char_diff_count {
    my ($a, $b) = @_;
    # Compare as sequences of characters (Unicode aware because Perl's UTF-8)
    my @a = split //, $a;
    my @b = split //, $b;
    my $len = @a > @b ? @a : @b;
    my $errs = 0;
    for (my $i = 0; $i < $len; $i++) {
        my $ca = defined $a[$i] ? $a[$i] : '';
        my $cb = defined $b[$i] ? $b[$i] : '';
        $errs++ if $ca ne $cb;
    }
    return $errs;
}
