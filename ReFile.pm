package ReFile;

use strict;
use warnings;

sub new {
 my $class = shift;
 my $self = bless {} , $class;
 return $self;
}

sub set_path {
 my $self = shift;
 my $path = shift;
 if(defined $path){
   $self->{path} = $path;
   return $path;
 }else{
   die('no dir!');
 }
}

sub isdir {
 my $self = shift;

 opendir(DIR,$self->{path});
 my @file = readdir(DIR);
 closedir(DIR);
 return @file;
}

sub readlist {
 my $self = shift;
 my @file = @_;
 my $type = pop(@_);
 my @list;

 foreach my $i (@file){
   my @filename = split(/\./,$i);
   if(defined($filename[1])){
      if($filename[1] eq $type){
       push @list, $i;
      }
   }
 }
 return @list;
}

sub re_str {
 my $self = shift;
 my %poke = @_;
 $self->{pre} = $poke{'pre'};
 $self->{post} = $poke{'post'};
}

sub rewrite {
 my $self = shift;
 my @list = @_;

 foreach my $k (@list){
   open(my $fh , "<" , $k)
     or die  "Cannot open $k: $!";

   my $out_file = "new_".$k;

   open(my $out_fh , ">" , $out_file)
     or die  "Cannot open $k: $!";

   while(my $line = readline $fh){
     if($line =~ /$self->{pre}/){
       $line =~ s/$self->{pre}/$self->{post}/;
       print $out_fh $line;
     }else{
       print $out_fh $line;
     }
   }
 }

}


1;