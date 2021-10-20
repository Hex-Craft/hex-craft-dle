//monitoring
var elem_monitoring_classic1 = document.getElementById("current_players_classic");
var elem_monitoring_classic2 = document.getElementById("current_players_classic2");
var elem_monitoring_industry1 = document.getElementById("current_players_industry");
var elem_monitoring_industry2 = document.getElementById("current_players_industry2");
var elem_monitoring_magic1 = document.getElementById("current_players_magic");
var elem_monitoring_magic2 = document.getElementById("current_players_magic2");
		
if(isNaN(current_players)) {
	elem_monitoring_classic1.innerHTML = "OFFLINE";
	elem_monitoring_classic1.style.fontSize = '14px';
	elem_monitoring_classic2.innerHTML = "OFFLINE";
}
else {
	elem_monitoring_classic1.innerHTML = current_players + "%";
	elem_monitoring_classic2.innerHTML = current_players;
}
		
if(isNaN(current_players2)) {
	elem_monitoring_industry1.innerHTML = "OFFLINE";
	elem_monitoring_industry1.style.fontSize = '14px';
	elem_monitoring_industry2.innerHTML = "OFFLINE";
}
else {
	elem_monitoring_industry1.innerHTML = current_players2 + "%";
	elem_monitoring_industry2.innerHTML = current_players2;
}		

if(isNaN(current_players3)) {
	elem_monitoring_magic1.innerHTML = "OFFLINE";
	elem_monitoring_magic1.style.fontSize = '14px';
	elem_monitoring_magic2.innerHTML = "OFFLINE";
}
else {
	elem_monitoring_magic1.innerHTML = current_players3 + "%";
	elem_monitoring_magic2.innerHTML = current_players3;
}

document.getElementById("summary_players").innerHTML = parseInt(current_players)+parseInt(current_players2)+parseInt(current_players3);
//swiper
jQuery(document).ready(function($){var swiper=new Swiper('.swiper-container',{pagination:{el:'.swiper-pagination',},loop:true,navigation:{nextEl:'.swiper-button-next',prevEl:'.swiper-button-prev',},slidesPerView: 1,centeredSlides: false,slidesPerGroupSkip: 1,speed:500,autoplay:true,preloadImages:false,lazy:true,loadOnTransitionStart:true});});
//lazy-load
document.addEventListener("DOMContentLoaded", function() {
  var lazyloadImages = document.querySelectorAll("img.lazy");    
  var lazyloadThrottleTimeout;
  
  function lazyload () {
    if(lazyloadThrottleTimeout) {
      clearTimeout(lazyloadThrottleTimeout);
    }    
    
    lazyloadThrottleTimeout = setTimeout(function() {
        var scrollTop = window.pageYOffset;
        lazyloadImages.forEach(function(img) {
            if(img.offsetTop < (window.innerHeight + scrollTop)) {
              img.src = img.dataset.src;
              img.classList.remove('lazy');
            }
        });
        if(lazyloadImages.length == 0) { 
          document.removeEventListener("scroll", lazyload);
          window.removeEventListener("resize", lazyload);
          window.removeEventListener("orientationChange", lazyload);
        }
    }, 20);
  }
  
  document.addEventListener("scroll", lazyload);
  window.addEventListener("resize", lazyload);
  window.addEventListener("orientationChange", lazyload);
});
//circle-progress
(function(factory){if(typeof define==='function'&&define.amd){define(['jquery'],factory);}else if(typeof module==='object'&&module.exports){var $=require('jquery');factory($);module.exports=$;}else{factory(jQuery);}})(function($){function CircleProgress(config){this.init(config);}
CircleProgress.prototype={value:1.0,size:70.0,startAngle:-Math.PI,thickness:'auto',fill:{gradient:['#9bdb01','#62ae19']},emptyFill:'rgba(0, 0, 0, .1)',animation:{duration:2000,easing:'circleProgressEasing'},animationStartValue:0.0,reverse:false,lineCap:'butt',insertMode:'prepend',constructor:CircleProgress,el:null,canvas:null,ctx:null,radius:0.0,arcFill:null,lastFrameValue:0.0,init:function(config){$.extend(this,config);this.radius=this.size/2;this.initWidget();this.initFill();this.draw();this.el.trigger('circle-inited');},initWidget:function(){if(!this.canvas)
this.canvas=$('<canvas>')[this.insertMode=='prepend'?'prependTo':'appendTo'](this.el)[0];var canvas=this.canvas;canvas.width=this.size;canvas.height=this.size;this.ctx=canvas.getContext('2d');if(window.devicePixelRatio>1){var scaleBy=window.devicePixelRatio;canvas.style.width=canvas.style.height=this.size+'px';canvas.width=canvas.height=this.size*scaleBy;this.ctx.scale(scaleBy,scaleBy);}},initFill:function(){var self=this,fill=this.fill,ctx=this.ctx,size=this.size;if(!fill)
throw Error("The fill is not specified!");if(typeof fill=='string')
fill={color:fill};if(fill.color)
this.arcFill=fill.color;if(fill.gradient){var gr=fill.gradient;if(gr.length==1){this.arcFill=gr[0];}else if(gr.length>1){var ga=fill.gradientAngle||0,gd=fill.gradientDirection||[size/2*(1-Math.cos(ga)),size/2*(1+Math.sin(ga)),size/2*(1+Math.cos(ga)),size/2*(1-Math.sin(ga))];var lg=ctx.createLinearGradient.apply(ctx,gd);for(var i=0;i<gr.length;i++){var color=gr[i],pos=i/(gr.length-1);if($.isArray(color)){pos=color[1];color=color[0];}
lg.addColorStop(pos,color);}
this.arcFill=lg;}}
if(fill.image){var img;if(fill.image instanceof Image){img=fill.image;}else{img=new Image();img.src=fill.image;}
if(img.complete)
setImageFill();else
img.onload=setImageFill;}
function setImageFill(){var bg=$('<canvas>')[0];bg.width=self.size;bg.height=self.size;bg.getContext('2d').drawImage(img,0,0,size,size);self.arcFill=self.ctx.createPattern(bg,'no-repeat');self.drawFrame(self.lastFrameValue);}},draw:function(){if(this.animation)
this.drawAnimated(this.value);else
this.drawFrame(this.value);},drawFrame:function(v=10){this.lastFrameValue=v;this.ctx.clearRect(0,0,this.size,this.size);this.drawEmptyArc(v);this.drawArc(v);},drawArc:function(v){if(v===0)
return;var ctx=this.ctx,r=this.radius,t=this.getThickness(),a=this.startAngle;ctx.save();ctx.beginPath();if(!this.reverse){ctx.arc(r,r,r-t/2,a,a+Math.PI*2*v);}else{ctx.arc(r,r,r-t/2,a-Math.PI*2*v,a);}
ctx.lineWidth=t;ctx.lineCap=this.lineCap;ctx.strokeStyle=this.arcFill;ctx.stroke();ctx.restore();},drawEmptyArc:function(v){var ctx=this.ctx,r=this.radius,t=this.getThickness(),a=this.startAngle;if(v<1){ctx.save();ctx.beginPath();if(v<=0){ctx.arc(r,r,r-t/2,0,Math.PI*2);}else{if(!this.reverse){ctx.arc(r,r,r-t/2,a+Math.PI*2*v,a);}else{ctx.arc(r,r,r-t/2,a,a-Math.PI*2*v);}}
ctx.lineWidth=t;ctx.strokeStyle=this.emptyFill;ctx.stroke();ctx.restore();}},drawAnimated:function(v){var self=this,el=this.el,canvas=$(this.canvas);canvas.stop(true,false);el.trigger('circle-animation-start');canvas.css({animationProgress:0}).animate({animationProgress:1},$.extend({},this.animation,{step:function(animationProgress){var stepValue=self.animationStartValue*(1-animationProgress)+v*animationProgress;self.drawFrame(stepValue);el.trigger('circle-animation-progress',[animationProgress,stepValue]);}})).promise().always(function(){el.trigger('circle-animation-end');});},getThickness:function(){return $.isNumeric(this.thickness)?this.thickness:this.size/14;},getValue:function(){return this.value;},setValue:function(newValue){if(this.animation)
this.animationStartValue=this.lastFrameValue;this.value=newValue;this.draw();}};$.circleProgress={defaults:CircleProgress.prototype};$.easing.circleProgressEasing=function(x,t,b,c,d){if((t/=d/2)<1)
return c/2*t*t*t+b;return c/2*((t-=2)*t*t+2)+b;};$.fn.circleProgress=function(configOrCommand,commandArgument){var dataName='circle-progress',firstInstance=this.data(dataName);if(configOrCommand=='widget'){if(!firstInstance)
throw Error('Calling "widget" method on not initialized instance is forbidden');return firstInstance.canvas;}
if(configOrCommand=='value'){if(!firstInstance)
throw Error('Calling "value" method on not initialized instance is forbidden');if(typeof commandArgument=='undefined'){return firstInstance.getValue();}else{var newValue=arguments[1];return this.each(function(){$(this).data(dataName).setValue(newValue);});}}
return this.each(function(){var el=$(this),instance=el.data(dataName),config=$.isPlainObject(configOrCommand)?configOrCommand:{};if(instance){instance.init(config);}else{var initialConfig=$.extend({},el.data());if(typeof initialConfig.fill=='string')
initialConfig.fill=JSON.parse(initialConfig.fill);if(typeof initialConfig.animation=='string')
initialConfig.animation=JSON.parse(initialConfig.animation);config=$.extend(initialConfig,config);config.el=el;instance=new CircleProgress(config);el.data(dataName,instance);}});};});

var currplays = current_players / 100;
var currplays2 = current_players2 / 100;
var currplays3= current_players3 / 100;

(function($) {
	
	if(isNaN(current_players)) {
		$('.second.circle').circleProgress({
			value: 100,
			fill:{color:'#A60000'}
		}).on('circle-animation-progress', function(event, progress) {});
	}
	else {
		$('.second.circle').circleProgress({
			value: currplays
		}).on('circle-animation-progress', function(event, progress) {});
	}
	
	if(isNaN(current_players2)) {
		$('.third.circle').circleProgress({
			value: 100,
			fill:{color:'#A60000'}
		}).on('circle-animation-progress', function(event, progress) {});
	}
	else {
		$('.third.circle').circleProgress({
			value: currplays2
		}).on('circle-animation-progress', function(event, progress) {});
	}
	
	if(isNaN(current_players2)) {
		$('.fourth.circle').circleProgress({
			value: 100,
			fill:{color:'#A60000'}
		}).on('circle-animation-progress', function(event, progress) {});
	}
	else {
		$('.fourth.circle').circleProgress({
			value: currplays3
		}).on('circle-animation-progress', function(event, progress) {});
	}
	
})(jQuery);
//scroll-to-top
document.getElementById('scroll_top').addEventListener('click', scrollToElementTop);

window.onscroll = function ()
{
var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);

if(scrollTop >= 1000)
{
	document.getElementById("scroll_top").classList.add('show_scroller');
}
else
{
	document.getElementById("scroll_top").classList.remove('show_scroller');
}
}
function scrollToElementTop(e) {
element = document.getElementById("scrolltopper")
element.scrollIntoView(true);
}
//menu-underliner
var curr_loc = document.location.href;
switch(curr_loc) {
	case 'https://hex-craft.ru/':
		document.getElementById("nav_button1").classList.add('current');
		break;
					
	case 'https://hex-craft.ru/donate.html':
		document.getElementById("nav_button2").classList.add('current');
		break;	
					
	case 'https://hex-craft.ru/kits.html':
		document.getElementById("nav_button3").classList.add('current');
		break;
					
	case 'https://hex-craft.ru/help.html':
		document.getElementById("nav_button4").classList.add('current');
		break;
					
	default:
		break;
}
//countdown
/*
const endDate = "22 Sep 2021";

function countdown() {
    const countDate = new Date(endDate);
    const currentDate = new Date();

    const totalSeconds = (countDate - currentDate) / 1000;
	if (totalSeconds <= 0) {
		document.getElementById("days").innerHTML = 0;
		document.getElementById("hours").innerHTML = 0;
		document.getElementById("mins").innerHTML = 0;
		document.getElementById("seconds").innerHTML = 0;
	} else {
		const days = Math.floor(totalSeconds / 3600 / 24);
		const hours = Math.floor(totalSeconds / 3600) % 24;
		const mins = Math.floor(totalSeconds / 60) % 60;
		const seconds = Math.floor(totalSeconds) % 60;
	
		document.getElementById("days").innerHTML = days;
		document.getElementById("hours").innerHTML = formatTime(hours);
		document.getElementById("mins").innerHTML = formatTime(mins);
		document.getElementById("seconds").innerHTML = formatTime(seconds);
	}
}

function formatTime(time) {
    return time < 10 ? `0${time}` : time;
}

countdown();

setInterval(countdown, 1000);
*/