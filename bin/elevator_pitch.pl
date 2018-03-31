#!/usr/bin/env perl

use strict;
use warnings;

use Term::ANSIColor;
use Crypt::Random qw( makerandom_itv );

sub random_choice { my $l = shift; my $i = makerandom_itv(Lower => 1, Upper => scalar @$l); $l->[--$i] }
sub article { shift =~ m/^a|e|i|o|u/i ? 'An' : 'A' }
sub pronoun { $_[0] eq 'man' ? 'his' : $_[0] =~ m/^(?:daughter|mother|widow|woman|mistress)$/ ? 'her' : 'their' }

my $A = ['edge-of-your-seat', 'keenly observed', 'lyrical', 'profound', 'erotic', 'inspiring', 'razor-sharp',
         'heartrending', 'dreamlike', 'darkly comic', 'uncompromising', 'courageous', 'compulsively readable',
         'unflinching', 'fiercely honest', 'richly drawn', 'unforgettable', 'rivesting', 'high-voltage',
         'psyco-sexual', 'riotously funny', 'passionate', 'surreal', 'dystopian', 'hysterical',
         'meditative'];

my $B = ['thriller', 'meditation', 'coming-of-age story', 'family drama', 'war epic', 'epistolary novel',
         'romance', 'tragedy', 'story', 'tour-de-force', 'comedy', 'noir', 'instant classic', 'fairy tale',
         'autobiographical novel', 'romp', 'fictional memoir', 'trilogy', 'detective novel',
         'page-turner', 'tragicomedy', 'murder mystery', 'novel in stories', 'historyical novel',
         'graphic novel', 'saga'];

my $C = ['depressed', 'wealthy', 'doomed', 'exuberant', 'agoraphobic', 'maladjusted', 'misanthropic',
         'alcoholic', 'young', 'philosophical', 'hopelessly romantic', 'hypersexual', 'precocious',
         'unlucky', 'quixotic', 'desperate', 'refugee', 'dissatisfied', 'bored', 'morally compromised',
         'lovesick', 'drug-addled', 'jilted', 'vengeful', 'overbearing', 'closeted'];

my $D = ['man', 'orphan', 'daughter', 'mother', 'adolescent', 'soldier', 'student', 'widow', 'woman',
         'professor', 'divorcee', 'adventurer', 'extended family', 'child', 'mistress', 'dictator',
         'vampire', 'ghost', 'starship captain', 'doctor', 'writer', 'private-investigator', 'couple',
         'coven', 'murder detective', 'octogenarian'];

my $E = ['adventure', 'commitment', 'desire', 'devotion', 'dream', 'effort', 'strategy', 'pains', 'failure',
         'inability', 'journey', 'mission', 'not-so-secret desire', 'quest', 'endeavour', 'secret longing',
         'struggle', 'vacation', 'wish', 'expedition', 'plan', 'scheme', 'resolve', 'project', 'promise',
         'battle'];

my $F = ['reawaken', 'come to grips with', 'grapple with', 'understand', 'explore', 'accept', 'overcome',
         'avenge', 'pursue', 'defend', 'undertake', 'discover', 'contemplte', 'transcend', 'withdraw from',
         'avoid', 'betray', 'circumvent', 'confront', 'expose', 'give up', 'investigate', 'navigate',
         'reconnect with', 'embrace', 'reconcile to'];

my $G = ['fear of spiders', 'adoption', 'traumatic childhood',"mother's death",'sexless marriage',
         'Oedipal complex', 'feminism', 'religious upbringing', 'political apathy', 'biological clock',
         'ugly divorce',"writer's block",'toxic friendships', 'eating disorder', 'own birth', 'cancer',
         '23andMe results', 'privilege', 'untimely death', 'social media addiction',
         'spiritual evolution', 'secret second family', 'sexual awakening', 'Amazon reviews',
         "father's murder", 'disinheritance'];

my ($a, $b, $c, $d, $e, $f, $g);
if(my $name = lc join('', @ARGV)) {
    print STDERR color('bold red');
    die "Error: Name is too short! (must be at least 7 characters long)\n" unless length($name) > 6;
    die "Error: Name contains invalid characters!\n" if $name =~ m/[^a-z]/;
    print STDERR color('reset');
    my %alpha2num; @alpha2num{'a' .. 'z'} = (0 .. 25);
    ($a, $b, $c, $d, $e, $f, $g) = map { $alpha2num{$_} } split(//, $name);
}

$a = defined $a ? $A->[$a] : random_choice($A);
$b = defined $b ? $B->[$b] : random_choice($B);
$c = defined $c ? $C->[$c] : random_choice($C);
$d = defined $d ? $D->[$d] : random_choice($D);
$e = defined $e ? $E->[$e] : random_choice($E);
$f = defined $f ? $F->[$f] : random_choice($F);
$g = defined $g ? $G->[$g] : random_choice($G);

# A/an $a $b about a/an $c $d $e to $f his/her/their $g
print article($a) . " $a $b about " . lc(article($c)) . " $c $d\'s $e to $f " . pronoun($d) . " $g.\n";
