#!/usr/bin/env perl
use strict;
use warnings;

use Amazon::SQS::Simple;

die "Usage: $0 http://sqs-endpoint:port" unless $ARGV[0];

my $sqs = Amazon::SQS::Simple->new(
  $ENV{AWS_ACCESS_KEY} || 'fake', 
  $ENV{AWS_SECRET_KEY} || 'fake',
  Endpoint => $ARGV[0],
  MAX_GET_MSG_SIZE => 512, # force POST when sending messages > .5KB
  _Debug => $ENV{DEBUG} ? \*STDERR : undef,
  );

print STDERR "Creating queue\n";
my $queue = $sqs->CreateQueue('my-new-queue');


print STDERR "Sending large message via POST... "; 
print STDERR $queue->SendMessage('lotsa Xs: ' . ('X' x 512))->MessageId . "\n";

print STDERR "Sending small message via GET... ";
print STDERR $queue->SendMessage('small message')->MessageId . "\n";


