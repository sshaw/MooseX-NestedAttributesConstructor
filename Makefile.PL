use ExtUtils::MakeMaker;

WriteMakefile(
     NAME          => 'MooseX::NestedAttributesConstructor',
     AUTHOR        => 'Skye Shaw <skye.shaw AT gmail.com>',
     PREREQ_PM     => { Moose => 2 },
     LICENSE       => 'perl',
     VERSION_FROM  => 'lib/MooseX/NestedAttributesConstructor.pm',
     VERSION_FROM  => 'lib/MooseX/NestedAttributesConstructor.pm',
    (eval { ExtUtils::MakeMaker->VERSION(6.46) } ?
       (META_MERGE  => { resources => { 'meta-spec' => { version => 2 },
				        bugtracker  => 'http://github.com/sshaw/MooseX-NestedAttributesConstructor/issues',
				        repository  => { url  => 'git://github.com/sshaw/MooseX-NestedAttributesConstructor.git',
					 	         web  => 'http://github.com/sshaw/MooseX-NestedAttributesConstructor',
						         type => 'git'}}}) : ())
);

# Create README.pod for a repo's GitHub page. Unlike CPAN, GitHub won't
# display the module's POD, it looks for a README.*
sub MY::postamble
{
    my $self = shift;
    return if -r 'README' or ! -r $self->{VERSION_FROM};
    return<<END_MAKE;
README.pod: $self->{VERSION_FROM}
	\@perldoc -uT $self->{VERSION_FROM} > README.pod
END_MAKE
}
