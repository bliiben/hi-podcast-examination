ъќ
ГЏ
9
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
Ш
ArgMax

input"T
	dimension"Tidx
output"output_type"
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
ґ
AsString

input"T

output"
Ttype:
	2	
"
	precisionint€€€€€€€€€"

scientificbool( "
shortestbool( "
widthint€€€€€€€€€"
fillstring 
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeintИ
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
A
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
К
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
<
Mul
x"T
y"T
z"T"
Ttype:
2	Р

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
A
Relu
features"T
activations"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
/
Sigmoid
x"T
y"T"
Ttype:	
2
8
Softmax
logits"T
softmax"T"
Ttype:
2
ц
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
9
Sub
x"T
y"T
z"T"
Ttype:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.4.02v1.4.0-rc1-11-g130a514‘Щ

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 
П
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
≤
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
p
PlaceholderPlaceholder*
dtype0*(
_output_shapes
:€€€€€€€€€ј*
shape:€€€€€€€€€ј
}
2dnn/input_from_feature_columns/input_layer/x/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:
К
@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
М
Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
М
Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Џ
:dnn/input_from_feature_columns/input_layer/x/strided_sliceStridedSlice2dnn/input_from_feature_columns/input_layer/x/Shape@dnn/input_from_feature_columns/input_layer/x/strided_slice/stackBdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_1Bdnn/input_from_feature_columns/input_layer/x/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1Const*
value
B :ј*
dtype0*
_output_shapes
: 
ц
:dnn/input_from_feature_columns/input_layer/x/Reshape/shapePack:dnn/input_from_feature_columns/input_layer/x/strided_slice<dnn/input_from_feature_columns/input_layer/x/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
…
4dnn/input_from_feature_columns/input_layer/x/ReshapeReshapePlaceholder:dnn/input_from_feature_columns/input_layer/x/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:€€€€€€€€€ј
~
<dnn/input_from_feature_columns/input_layer/concat/concat_dimConst*
value	B :*
dtype0*
_output_shapes
: 
¶
1dnn/input_from_feature_columns/input_layer/concatIdentity4dnn/input_from_feature_columns/input_layer/x/Reshape*(
_output_shapes
:€€€€€€€€€ј*
T0
≈
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB"ј  А   *
dtype0*
_output_shapes
:
Ј
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *тк≠љ*
dtype0*
_output_shapes
: 
Ј
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *тк≠=*
dtype0*
_output_shapes
: 
†
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
јА*

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2 
Ъ
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
Ѓ
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub* 
_output_shapes
:
јА*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
†
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0* 
_output_shapes
:
јА
Ћ
dnn/hiddenlayer_0/kernel/part_0
VariableV2*
shared_name *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
	container *
shape:
јА*
dtype0* 
_output_shapes
:
јА
Х
&dnn/hiddenlayer_0/kernel/part_0/AssignAssigndnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform* 
_output_shapes
:
јА*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
validate_shape(
∞
$dnn/hiddenlayer_0/kernel/part_0/readIdentitydnn/hiddenlayer_0/kernel/part_0*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0* 
_output_shapes
:
јА
∞
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes	
:А*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
valueBА*    
љ
dnn/hiddenlayer_0/bias/part_0
VariableV2*
shared_name *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
	container *
shape:А*
dtype0*
_output_shapes	
:А
€
$dnn/hiddenlayer_0/bias/part_0/AssignAssigndnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*
_output_shapes	
:А*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(
•
"dnn/hiddenlayer_0/bias/part_0/readIdentitydnn/hiddenlayer_0/bias/part_0*
_output_shapes	
:А*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0
u
dnn/hiddenlayer_0/kernelIdentity$dnn/hiddenlayer_0/kernel/part_0/read*
T0* 
_output_shapes
:
јА
»
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*(
_output_shapes
:€€€€€€€€€А*
transpose_a( *
transpose_b( 
l
dnn/hiddenlayer_0/biasIdentity"dnn/hiddenlayer_0/bias/part_0/read*
_output_shapes	
:А*
T0
†
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*(
_output_shapes
:€€€€€€€€€А
l
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:€€€€€€€€€А
[
dnn/zero_fraction/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Г
dnn/zero_fraction/EqualEqualdnn/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*(
_output_shapes
:€€€€€€€€€А
y
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*(
_output_shapes
:€€€€€€€€€А*

DstT0*

SrcT0

h
dnn/zero_fraction/ConstConst*
_output_shapes
:*
valueB"       *
dtype0
Н
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
†
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Ђ
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 
У
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
≈
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB"А       *
dtype0*
_output_shapes
:
Ј
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *шKFЊ*
dtype0*
_output_shapes
: 
Ј
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *шKF>
Я
Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
seed2 *
dtype0*
_output_shapes
:	А *

seed *
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ъ
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
≠
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
:	А 
Я
:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
:	А 
…
dnn/hiddenlayer_1/kernel/part_0
VariableV2*
	container *
shape:	А *
dtype0*
_output_shapes
:	А *
shared_name *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
Ф
&dnn/hiddenlayer_1/kernel/part_0/AssignAssigndnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*
_output_shapes
:	А *
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(
ѓ
$dnn/hiddenlayer_1/kernel/part_0/readIdentitydnn/hiddenlayer_1/kernel/part_0*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
:	А 
Ѓ
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
valueB *    
ї
dnn/hiddenlayer_1/bias/part_0
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container 
ю
$dnn/hiddenlayer_1/bias/part_0/AssignAssigndnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
validate_shape(*
_output_shapes
: 
§
"dnn/hiddenlayer_1/bias/part_0/readIdentitydnn/hiddenlayer_1/bias/part_0*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
t
dnn/hiddenlayer_1/kernelIdentity$dnn/hiddenlayer_1/kernel/part_0/read*
_output_shapes
:	А *
T0
ђ
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Reludnn/hiddenlayer_1/kernel*
T0*'
_output_shapes
:€€€€€€€€€ *
transpose_a( *
transpose_b( 
k
dnn/hiddenlayer_1/biasIdentity"dnn/hiddenlayer_1/bias/part_0/read*
T0*
_output_shapes
: 
Я
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€ 
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*'
_output_shapes
:€€€€€€€€€ *
T0
]
dnn/zero_fraction_1/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ж
dnn/zero_fraction_1/EqualEqualdnn/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*'
_output_shapes
:€€€€€€€€€ 
|
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*'
_output_shapes
:€€€€€€€€€ *

DstT0*

SrcT0

j
dnn/zero_fraction_1/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
У
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
†
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
≠
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
Е
$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 
У
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
_output_shapes
: *
T0
Ј
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB"       *
dtype0*
_output_shapes
:
©
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *JQЏЊ*
dtype0*
_output_shapes
: 
©
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *JQЏ>*
dtype0*
_output_shapes
: 
Й
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

: *

seed *
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
seed2 
ю
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 
Р
7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

: 
В
3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

: 
є
dnn/logits/kernel/part_0
VariableV2*
shared_name *+
_class!
loc:@dnn/logits/kernel/part_0*
	container *
shape
: *
dtype0*
_output_shapes

: 
ч
dnn/logits/kernel/part_0/AssignAssigndnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*
_output_shapes

: *
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(
Щ
dnn/logits/kernel/part_0/readIdentitydnn/logits/kernel/part_0*
_output_shapes

: *
T0*+
_class!
loc:@dnn/logits/kernel/part_0
†
(dnn/logits/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*)
_class
loc:@dnn/logits/bias/part_0*
valueB*    
≠
dnn/logits/bias/part_0
VariableV2*
dtype0*
_output_shapes
:*
shared_name *)
_class
loc:@dnn/logits/bias/part_0*
	container *
shape:
в
dnn/logits/bias/part_0/AssignAssigndnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*)
_class
loc:@dnn/logits/bias/part_0
П
dnn/logits/bias/part_0/readIdentitydnn/logits/bias/part_0*
T0*)
_class
loc:@dnn/logits/bias/part_0*
_output_shapes
:
e
dnn/logits/kernelIdentitydnn/logits/kernel/part_0/read*
_output_shapes

: *
T0
Ю
dnn/logits/MatMulMatMuldnn/hiddenlayer_1/Reludnn/logits/kernel*'
_output_shapes
:€€€€€€€€€*
transpose_a( *
transpose_b( *
T0
]
dnn/logits/biasIdentitydnn/logits/bias/part_0/read*
_output_shapes
:*
T0
К
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€
]
dnn/zero_fraction_2/zeroConst*
valueB
 *    *
dtype0*
_output_shapes
: 
В
dnn/zero_fraction_2/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_2/zero*'
_output_shapes
:€€€€€€€€€*
T0
|
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*'
_output_shapes
:€€€€€€€€€*

DstT0
j
dnn/zero_fraction_2/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
У
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
Т
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 
Я
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 
Б
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: *
T0
s
!dnn/head/predictions/logits/ShapeShapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
n
,dnn/head/predictions/logits/assert_rank/rankConst*
value	B :*
dtype0*
_output_shapes
: 
^
Vdnn/head/predictions/logits/assert_rank/assert_type/statically_determined_correct_typeNoOp
O
Gdnn/head/predictions/logits/assert_rank/static_checks_determined_all_okNoOp
√
/dnn/head/predictions/logits/strided_slice/stackConstH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
≈
1dnn/head/predictions/logits/strided_slice/stack_1ConstH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
≈
1dnn/head/predictions/logits/strided_slice/stack_2ConstH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
Е
)dnn/head/predictions/logits/strided_sliceStridedSlice!dnn/head/predictions/logits/Shape/dnn/head/predictions/logits/strided_slice/stack1dnn/head/predictions/logits/strided_slice/stack_11dnn/head/predictions/logits/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
ґ
*dnn/head/predictions/logits/assert_equal/xConstH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
value	B :*
dtype0*
_output_shapes
: 
ѓ
.dnn/head/predictions/logits/assert_equal/EqualEqual*dnn/head/predictions/logits/assert_equal/x)dnn/head/predictions/logits/strided_slice*
T0*
_output_shapes
: 
ї
.dnn/head/predictions/logits/assert_equal/ConstConstH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
_output_shapes
: *
valueB *
dtype0
»
,dnn/head/predictions/logits/assert_equal/AllAll.dnn/head/predictions/logits/assert_equal/Equal.dnn/head/predictions/logits/assert_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
Ѓ
6dnn/head/predictions/logits/assert_equal/Assert/AssertAssert,dnn/head/predictions/logits/assert_equal/All!dnn/head/predictions/logits/Shape*

T
2*
	summarize
р
dnn/head/predictions/logitsIdentitydnn/logits/BiasAddH^dnn/head/predictions/logits/assert_rank/static_checks_determined_all_ok7^dnn/head/predictions/logits/assert_equal/Assert/Assert*
T0*'
_output_shapes
:€€€€€€€€€
w
dnn/head/predictions/logisticSigmoiddnn/head/predictions/logits*
T0*'
_output_shapes
:€€€€€€€€€
{
dnn/head/predictions/zeros_like	ZerosLikednn/head/predictions/logits*'
_output_shapes
:€€€€€€€€€*
T0
l
*dnn/head/predictions/two_class_logits/axisConst*
value	B :*
dtype0*
_output_shapes
: 
в
%dnn/head/predictions/two_class_logitsConcatV2dnn/head/predictions/zeros_likednn/head/predictions/logits*dnn/head/predictions/two_class_logits/axis*
T0*
N*'
_output_shapes
:€€€€€€€€€*

Tidx0
Ж
"dnn/head/predictions/probabilitiesSoftmax%dnn/head/predictions/two_class_logits*
T0*'
_output_shapes
:€€€€€€€€€
g
%dnn/head/predictions/ArgMax/dimensionConst*
_output_shapes
: *
value	B :*
dtype0
ј
dnn/head/predictions/ArgMaxArgMax%dnn/head/predictions/two_class_logits%dnn/head/predictions/ArgMax/dimension*
T0*
output_type0	*#
_output_shapes
:€€€€€€€€€*

Tidx0
s
"dnn/head/predictions/classes/shapeConst*
valueB"€€€€   *
dtype0*
_output_shapes
:
®
dnn/head/predictions/classesReshapednn/head/predictions/ArgMax"dnn/head/predictions/classes/shape*
T0	*
Tshape0*'
_output_shapes
:€€€€€€€€€
Џ
 dnn/head/predictions/str_classesAsStringdnn/head/predictions/classes*

scientific( *
width€€€€€€€€€*'
_output_shapes
:€€€€€€€€€*
	precision€€€€€€€€€*
shortest( *
T0	*

fill 
k
dnn/head/ShapeShapednn/head/predictions/logistic*
T0*
out_type0*
_output_shapes
:
f
dnn/head/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
h
dnn/head/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
h
dnn/head/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
¶
dnn/head/strided_sliceStridedSlicednn/head/Shapednn/head/strided_slice/stackdnn/head/strided_slice/stack_1dnn/head/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
h
dnn/head/AsString/inputConst*
valueB"       *
dtype0*
_output_shapes
:
є
dnn/head/AsStringAsStringdnn/head/AsString/input*

scientific( *
width€€€€€€€€€*
_output_shapes
:*
	precision€€€€€€€€€*
shortest( *
T0*

fill 
Y
dnn/head/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
В
dnn/head/ExpandDims
ExpandDimsdnn/head/AsStringdnn/head/ExpandDims/dim*
_output_shapes

:*

Tdim0*
T0
[
dnn/head/Tile/multiples/1Const*
value	B :*
dtype0*
_output_shapes
: 
М
dnn/head/Tile/multiplesPackdnn/head/strided_slicednn/head/Tile/multiples/1*
T0*

axis *
N*
_output_shapes
:
З
dnn/head/TileTilednn/head/ExpandDimsdnn/head/Tile/multiples*'
_output_shapes
:€€€€€€€€€*

Tmultiples0*
T0
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Д
save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_1ce9241f1a784215ad6a4466184127f8/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
ч
save/SaveV2/tensor_namesConst*™
value†BЭBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/logits/biasBdnn/logits/kernelBglobal_step*
dtype0*
_output_shapes
:
Ј
save/SaveV2/shape_and_slicesConst*g
value^B\B	128 0,128B704 128 0,704:0,128B32 0,32B128 32 0,128:0,32B1 0,1B32 1 0,32:0,1B *
dtype0*
_output_shapes
:
„
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices"dnn/hiddenlayer_0/bias/part_0/read$dnn/hiddenlayer_0/kernel/part_0/read"dnn/hiddenlayer_1/bias/part_0/read$dnn/hiddenlayer_1/kernel/part_0/readdnn/logits/bias/part_0/readdnn/logits/kernel/part_0/readglobal_step*
dtypes
	2	
С
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
Э
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
T0*

axis *
N*
_output_shapes
:
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
z
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:*+
value"B Bdnn/hiddenlayer_0/bias
q
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB	128 0,128
У
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes	
:А*
dtypes
2
≈
save/AssignAssigndnn/hiddenlayer_0/bias/part_0save/RestoreV2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(*
_output_shapes	
:А
~
save/RestoreV2_1/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_0/kernel*
dtype0*
_output_shapes
:
}
!save/RestoreV2_1/shape_and_slicesConst*(
valueBB704 128 0,704:0,128*
dtype0*
_output_shapes
:
Ю
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices* 
_output_shapes
:
јА*
dtypes
2
“
save/Assign_1Assigndnn/hiddenlayer_0/kernel/part_0save/RestoreV2_1*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
validate_shape(* 
_output_shapes
:
јА
|
save/RestoreV2_2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_1/bias*
dtype0*
_output_shapes
:
q
!save/RestoreV2_2/shape_and_slicesConst*
valueBB32 0,32*
dtype0*
_output_shapes
:
Ш
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
: *
dtypes
2
»
save/Assign_2Assigndnn/hiddenlayer_1/bias/part_0save/RestoreV2_2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
validate_shape(*
_output_shapes
: 
~
save/RestoreV2_3/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_1/kernel*
dtype0*
_output_shapes
:
{
!save/RestoreV2_3/shape_and_slicesConst*&
valueBB128 32 0,128:0,32*
dtype0*
_output_shapes
:
Э
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:	А *
dtypes
2
—
save/Assign_3Assigndnn/hiddenlayer_1/kernel/part_0save/RestoreV2_3*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(*
_output_shapes
:	А 
u
save/RestoreV2_4/tensor_namesConst*$
valueBBdnn/logits/bias*
dtype0*
_output_shapes
:
o
!save/RestoreV2_4/shape_and_slicesConst*
valueBB1 0,1*
dtype0*
_output_shapes
:
Ш
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
Ї
save/Assign_4Assigndnn/logits/bias/part_0save/RestoreV2_4*
use_locking(*
T0*)
_class
loc:@dnn/logits/bias/part_0*
validate_shape(*
_output_shapes
:
w
save/RestoreV2_5/tensor_namesConst*&
valueBBdnn/logits/kernel*
dtype0*
_output_shapes
:
w
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB32 1 0,32:0,1
Ь
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes

: *
dtypes
2
¬
save/Assign_5Assigndnn/logits/kernel/part_0save/RestoreV2_5*
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(*
_output_shapes

: 
q
save/RestoreV2_6/tensor_namesConst* 
valueBBglobal_step*
dtype0*
_output_shapes
:
j
!save/RestoreV2_6/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2	
†
save/Assign_6Assignglobal_stepsave/RestoreV2_6*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
И
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp
+

group_depsNoOp^init^init_all_tables
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Ж
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_b6791ee08dc9437b9deff9ebdf913ac8/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_1/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
Е
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
щ
save_1/SaveV2/tensor_namesConst*™
value†BЭBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/logits/biasBdnn/logits/kernelBglobal_step*
dtype0*
_output_shapes
:
є
save_1/SaveV2/shape_and_slicesConst*
_output_shapes
:*g
value^B\B	128 0,128B704 128 0,704:0,128B32 0,32B128 32 0,128:0,32B1 0,1B32 1 0,32:0,1B *
dtype0
я
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices"dnn/hiddenlayer_0/bias/part_0/read$dnn/hiddenlayer_0/kernel/part_0/read"dnn/hiddenlayer_1/bias/part_0/read$dnn/hiddenlayer_1/kernel/part_0/readdnn/logits/bias/part_0/readdnn/logits/kernel/part_0/readglobal_step*
dtypes
	2	
Щ
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
£
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*
_output_shapes
:*
T0*

axis *
N
Г
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(
В
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints*
_output_shapes
: *
T0
|
save_1/RestoreV2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_0/bias*
dtype0*
_output_shapes
:
s
!save_1/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB	128 0,128
Ы
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes	
:А
…
save_1/AssignAssigndnn/hiddenlayer_0/bias/part_0save_1/RestoreV2*
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
validate_shape(*
_output_shapes	
:А
А
save_1/RestoreV2_1/tensor_namesConst*-
value$B"Bdnn/hiddenlayer_0/kernel*
dtype0*
_output_shapes
:

#save_1/RestoreV2_1/shape_and_slicesConst*(
valueBB704 128 0,704:0,128*
dtype0*
_output_shapes
:
¶
save_1/RestoreV2_1	RestoreV2save_1/Constsave_1/RestoreV2_1/tensor_names#save_1/RestoreV2_1/shape_and_slices* 
_output_shapes
:
јА*
dtypes
2
÷
save_1/Assign_1Assigndnn/hiddenlayer_0/kernel/part_0save_1/RestoreV2_1*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
validate_shape(* 
_output_shapes
:
јА
~
save_1/RestoreV2_2/tensor_namesConst*+
value"B Bdnn/hiddenlayer_1/bias*
dtype0*
_output_shapes
:
s
#save_1/RestoreV2_2/shape_and_slicesConst*
valueBB32 0,32*
dtype0*
_output_shapes
:
†
save_1/RestoreV2_2	RestoreV2save_1/Constsave_1/RestoreV2_2/tensor_names#save_1/RestoreV2_2/shape_and_slices*
_output_shapes
: *
dtypes
2
ћ
save_1/Assign_2Assigndnn/hiddenlayer_1/bias/part_0save_1/RestoreV2_2*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
А
save_1/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_1/kernel
}
#save_1/RestoreV2_3/shape_and_slicesConst*&
valueBB128 32 0,128:0,32*
dtype0*
_output_shapes
:
•
save_1/RestoreV2_3	RestoreV2save_1/Constsave_1/RestoreV2_3/tensor_names#save_1/RestoreV2_3/shape_and_slices*
_output_shapes
:	А *
dtypes
2
’
save_1/Assign_3Assigndnn/hiddenlayer_1/kernel/part_0save_1/RestoreV2_3*
use_locking(*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
validate_shape(*
_output_shapes
:	А 
w
save_1/RestoreV2_4/tensor_namesConst*
_output_shapes
:*$
valueBBdnn/logits/bias*
dtype0
q
#save_1/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
†
save_1/RestoreV2_4	RestoreV2save_1/Constsave_1/RestoreV2_4/tensor_names#save_1/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
Њ
save_1/Assign_4Assigndnn/logits/bias/part_0save_1/RestoreV2_4*
use_locking(*
T0*)
_class
loc:@dnn/logits/bias/part_0*
validate_shape(*
_output_shapes
:
y
save_1/RestoreV2_5/tensor_namesConst*&
valueBBdnn/logits/kernel*
dtype0*
_output_shapes
:
y
#save_1/RestoreV2_5/shape_and_slicesConst*"
valueBB32 1 0,32:0,1*
dtype0*
_output_shapes
:
§
save_1/RestoreV2_5	RestoreV2save_1/Constsave_1/RestoreV2_5/tensor_names#save_1/RestoreV2_5/shape_and_slices*
_output_shapes

: *
dtypes
2
∆
save_1/Assign_5Assigndnn/logits/kernel/part_0save_1/RestoreV2_5*
use_locking(*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
validate_shape(*
_output_shapes

: 
s
save_1/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBglobal_step
l
#save_1/RestoreV2_6/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
Ю
save_1/RestoreV2_6	RestoreV2save_1/Constsave_1/RestoreV2_6/tensor_names#save_1/RestoreV2_6/shape_and_slices*
dtypes
2	*
_output_shapes
:
§
save_1/Assign_6Assignglobal_stepsave_1/RestoreV2_6*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step
Ш
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8" 
legacy_init_op


group_deps"В
	summariesф
с
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0"√	
trainable_variablesЂ	®	
Ё
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign&dnn/hiddenlayer_0/kernel/part_0/read:0"*
dnn/hiddenlayer_0/kernelјА  "јА2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:0
≈
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign$dnn/hiddenlayer_0/bias/part_0/read:0"#
dnn/hiddenlayer_0/biasА "А21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:0
џ
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign&dnn/hiddenlayer_1/kernel/part_0/read:0"(
dnn/hiddenlayer_1/kernelА   "А 2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:0
√
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign$dnn/hiddenlayer_1/bias/part_0/read:0"!
dnn/hiddenlayer_1/bias  " 21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:0
ґ
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assigndnn/logits/kernel/part_0/read:0"
dnn/logits/kernel   " 25dnn/logits/kernel/part_0/Initializer/random_uniform:0
†
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assigndnn/logits/bias/part_0/read:0"
dnn/logits/bias "2*dnn/logits/bias/part_0/Initializer/zeros:0" 
global_step

global_step:0"У

	variablesЕ
В

X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
Ё
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign&dnn/hiddenlayer_0/kernel/part_0/read:0"*
dnn/hiddenlayer_0/kernelјА  "јА2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:0
≈
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign$dnn/hiddenlayer_0/bias/part_0/read:0"#
dnn/hiddenlayer_0/biasА "А21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:0
џ
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign&dnn/hiddenlayer_1/kernel/part_0/read:0"(
dnn/hiddenlayer_1/kernelА   "А 2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:0
√
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign$dnn/hiddenlayer_1/bias/part_0/read:0"!
dnn/hiddenlayer_1/bias  " 21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:0
ґ
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assigndnn/logits/kernel/part_0/read:0"
dnn/logits/kernel   " 25dnn/logits/kernel/part_0/Initializer/random_uniform:0
†
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assigndnn/logits/bias/part_0/read:0"
dnn/logits/bias "2*dnn/logits/bias/part_0/Initializer/zeros:0*∞
predict§
*
x%
Placeholder:0€€€€€€€€€јB
	class_ids5
dnn/head/predictions/classes:0	€€€€€€€€€L
probabilities;
$dnn/head/predictions/probabilities:0€€€€€€€€€D
classes9
"dnn/head/predictions/str_classes:0€€€€€€€€€>
logits4
dnn/head/predictions/logits:0€€€€€€€€€B
logistic6
dnn/head/predictions/logistic:0€€€€€€€€€tensorflow/serving/predict