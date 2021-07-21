// Created by Crowbar 0.71

$modelname "81-740_4_physics.mdl"

$surfaceprop "metal"

$contents "solid"

$illumposition 0.16 -0.103 -10.388

$cdmaterials "models\metrostroi_train\81-740\body\"

$cbox 0 0 0 0 0 0

$bbox -365.638 -67.741 -101.093 365.633 67.741 80.473

$definebone "static_prop" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "Object_16" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_12" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_10" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_9" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_3" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_1" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_2" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "Object_4" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0
$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "Object_8" "" -0.000049 -9.09375 -101 0 -0.000229 0 0 0 0 0 0 0


$sequence "idle" {
	"81-740_4_physics_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "81-740_4_physics.smd"
{
	$mass 14000
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave
	$maxconvexpieces 20

}
