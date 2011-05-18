#!/usr/bin/env perl

use strict;
use warnings;
use Module::Build;

Module::Build->new(

	build_requires => {
		'Test::Command' => 0,
		'Test::Compile' => 0,
		'Test::More' => 0,
	},
	dist_name => 'ssh-forcecommand',
	dist_version_from => 'bin/ssh-forcecommand',
	license => 'unrestricted',
	requires => {
		'perl' => '5.10.0',
	},
	script_files => 'bin/ssh-forcecommand',
	sign => 1,

)->create_build_script();
