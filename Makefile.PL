use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'AI::NeuralNet::Kohonen::Visual',
    'VERSION_FROM'	=> 'Visual.pm', # finds $VERSION
    'PREREQ_PM'		=> {
		AI::NeuralNet::Kohonen	=> 0.13,
	},
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Visual.pm', # retrieve abstract from module
       AUTHOR     => 'Lee Goddard <lgoddard -at- cpan -dot- org>') : ()),
);


