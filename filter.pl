#!/bin/perl
use strict;
use warnings;
use utf8;
use Encode qw/encode/;

#binmode(STDOUT, ":utf8");
# Unix風のフィルタプログラミングを記述する。
# 今回はカンマ区切りの文字列の一列目を取り出すフィルタプログラムです。

# 特殊な行読み込み演算子<>
my $qp = quotemeta 'プログラム';
my $str = encode('utf8', 'コード');
while (<>) {
  # 読み込まれた行は特殊変数 $_に代入される。
  chomp $_; 
  if ($_ =~ /(UTF8|cp932)/i) {
    print "$&:$_\n";
  }
  
  if ($_ =~ /標準/) {
    print "①$_\n";
  }
  if ($_ =~ /$qp/) {
    print "②$_\n";
  }
  if ($_ =~ /$str/) {
    my $w = $_;
    print "③", encode('utf-8', $w), "\n";
    #print "③$_\n";
  }
}

