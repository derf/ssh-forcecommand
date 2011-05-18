#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Test::Command tests => (3 * 8);

sub test_fc {
	my (%conf) = @_;

	$ENV{'SSH_ORIGINAL_COMMAND'} = $conf{'in'};

	my $ret = $conf{'ret'} // 0;
	my $out = ($conf{'out'} ? $conf{'out'} . "\n" : q{});
	my $err = ($conf{'err'} ? $conf{'err'} . "\n" : q{});

	my $cmd = Test::Command->new(cmd => 'bin/ssh-forcecommand t/config');

	$cmd->stdout_is_eq($out);
	$cmd->stderr_is_eq($err);

	if ($ret == 0) {
		$cmd->exit_is_num(0);
	}
	else {
		$cmd->exit_isnt_num(0);
	}
}

test_fc(
	in => undef,
	ret => 1,
	err => 'No command',
);

test_fc(
	in => 'invalid',
	ret => 1,
	err => 'Unknown command',
);

test_fc(
	in => 'simple',
	out => 'foo',
);

test_fc(
	in => 'other',
	out => 'bar',
);

test_fc(
	in => 'nospace',
	out => 'nospace!',
);

test_fc(
	in => 'much space',
	out => 'dude, lots of space',
);

test_fc(
	in => 'spaceout',
	out => 'space   is   beautiful',
);

test_fc(
	in => 'equal',
	out => 'foo = bar a=b',
);
