// The file is compressed as each char correspond to a floating point value between 0 and 1
function decompress(input){
	var compression = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"
	return input.split('').map( x => compression.indexOf(x)/63 )
}

var MAX_LENGTH = 0;
var MARGIN_SIZE = 20;
for (filename in data){
	MAX_LENGTH = Math.max( data[filename].length, MAX_LENGTH )
	data[filename] = decompress(data[filename])
}
//data = tempData;
var episodes;
var SVG_WIDTH = parseInt(d3.select("#chart").style("width"));
var SCREEN_WIDTH = ( SVG_WIDTH - (2*MARGIN_SIZE))
var BAR_SIZE = (SCREEN_WIDTH / MAX_LENGTH);
var X_scale = d3.scaleLinear().range([0,180]).domain([0,1])
var EPISODE_HEIGHT =15;

function init(){

	d3.select("#chart").style("height",(Object.keys(data).length*EPISODE_HEIGHT+MARGIN_SIZE*2)+"px");


	episodes = d3.select("#chart")
		.selectAll("g")
		.data(d3.entries(data).sort( function(a,b){
			tempA = a.key
			tempB = b.key
			if( tempA.length == 5 ){
				tempA = "0"+tempA;
			}
			if( tempB.length == 5 ){
				tempB = "0"+tempB;
			}
			return tempA < tempB;
		}))
		.enter().append("g")
			.attr("class","episode")
			.attr("transform", function (d,i){ return "translate(0,"+(i*EPISODE_HEIGHT+EPISODE_HEIGHT)+")"; });

	episodes.selectAll("rect")
		.data( function(d){ return d.value } )
		.enter().append("rect")
			.attr("x",function(d,i){ return (BAR_SIZE*i)+MARGIN_SIZE+"px"})
			.attr("y","0px")
			.attr("width",BAR_SIZE+"px")
			.attr("height",EPISODE_HEIGHT+"px")
			.attr("style",function(d,i){
				//console.log("hsl("+Math.round(X_scale(d))+", 100, 63)");
				return "fill:hsl("+Math.round(X_scale(d))+", 100%, 63%)";
			} );

	episodes.append("text")
			.text(function (d,i){return d.key.substr(0,d.key.length-4);})
			.attr("y",(EPISODE_HEIGHT-5)+"px")
			.attr("x","5px");

}
function update(){
	episodes.each( function(d,i){
		var bar_size = (SCREEN_WIDTH / d.value.length);
		this.selectAll("rect")
			.attr("width",bar_size+"px")
			.attr("x", function (d,i){return (bar_size*i)+MARGIN_SIZE+"px"})
	});

}

init()
//update()