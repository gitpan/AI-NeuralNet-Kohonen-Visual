package Visual_and_RGB_test;
use lib "../../../";
use Test;
BEGIN { plan test => 11}
use AI::NeuralNet::Kohonen::Visual;
ok( 1,1);

goto TEST3;

warn "# Test 1 - basic confirmations that object-properties work correctly\n";

$net = AI::NeuralNet::Kohonen::Visual->new(
	display		=> 'hex',
	map_dim_x	=> 14,
	map_dim_y	=> 10,
	display_scale => 20,
	epochs 		=> 19,
	show_bmu	=> 1,
	targeting	=> 1,
	table=>
"3
1 0 0 red
0 1 0 yellow
0 0 1 green
0 1 1 cyan
1 1 0 yellow
1 .5 0 orange
1 .5 1 pink
",
);
ok( ref $net->{input}, 'ARRAY');
ok( $net->{input}->[0]->{values}->[0],1);
ok( $net->{input}->[0]->{values}->[1],0);
ok( $net->{input}->[0]->{values}->[2],0);
ok( $net->{weight_dim}, 2);

$net->train;
$net->main_loop;
ok(1,1);

TEST3:
warn "# Test 2 ... \n";
$net = AI::NeuralNet::Kohonen::Visual->new(
	display		=> 'hex',
	map_dim	=> 39,
	epochs => 9,
	neighbour_factor => 2,
	targeting	=> 1,
	table=>
"3
1 0 0 red
0 1 0 yellow
0 0 1 blue
0 1 1 cyan
1 1 0 yellow
1 .5 0 orange
1 .5 1 pink
",
);
ok( ref $net->{input}, 'ARRAY');
ok( $net->{input}->[0]->{values}->[0],1);
ok( $net->{input}->[0]->{values}->[1],0);
ok( $net->{input}->[0]->{values}->[2],0);
ok( $net->{weight_dim}, 2);

$net->train;

# Find red and display on the training map
warn "# Best matching unit for the colour blue (&#00F)\n";
my $targets = [[0, 0, 1]];
my $bmu = $net->get_results($targets);
$net->plot_map (bmu_x=>$bmu->[1],bmu_y=>$bmu->[2],hicol=>'white');
# $net->main_loop;

# Create an empty map
# and populate with training data

$net->plot_map;
# $net->main_loop;



warn "# Plotting results\n";
foreach my $bmu ($net->get_results){
	$net->label_map(@$bmu->[1],@$bmu->[2],"+".@$bmu->[3]);
}


warn "# Done\n";
# $net->main_loop;
__END__











