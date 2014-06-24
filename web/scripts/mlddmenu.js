// This script is not freeware!
//
// Multi-Level Drop-Down Menu 2.25
// You can find and buy latest version of this script 
// at the http://spicebrains.com/multi-level-drop-down-menu/
//
// Copyright 2007 SpiceBrains.com
////////////////////////////////////////////////////////////////////////////////////////////////////

var MLDDM_CLASS		= 'mlddm';		
var obj_menu		= new Array();	

function mlddminit()
{
	var candidates = document.getElementsByTagName('ul');
	var index = 0;
	for(var i=0; i < candidates.length; i++) 
	{
		if(candidates[i].className == MLDDM_CLASS) 
		{
			candidates[i].style.visibility = 'visible';

			var obj = candidates[i];
			var value = obj.getAttribute('params');
		
			obj_menu[index] = new menu(obj, index, value); 
			index++; 
		}
	}
}

function menu(obj, obj_n, params)
{
	var _handler			= obj;			
	var _obj_num			= obj_n;		
	var _me					= this;			
	var _buttons			= new Array();	
											
	this._layers			= new Array(6);	
	this._layers[0]			= new Array();	
	this._layers[1]			= new Array();	
	this._layers[2]			= new Array();	
	this._layers[3]			= new Array();	
	this._layers[4]			= new Array();	
	this._layers[5]			= new Array();	
											
	var _closetimer			= null;			
	var _mouseout			= true;			
	var _currentlayer		= null;			
 
	var _shiftx				= 0;
	var _shifty				= -10;
	var _timeout			= 500;			
	var _effect				= 'slide';		
	var _effect_speed		= 300;
	var _orientation		= 'h';

	var params_array; 
	if(params) 
	{ 
		params_array = params.split(",");
		if(params_array[0]) _shiftx       = params_array[0]*1;	
		if(params_array[1]) _shifty       = params_array[1]*1;
		if(params_array[2]) _timeout      = params_array[2]*1;
		if(params_array[3]) _effect		  = params_array[3];
		if(params_array[4]) _effect_speed = params_array[4]*1;
		if(params_array[5]) _orientation  = params_array[5];

		if(!_effect_speed) _effect_speed = 1000;
	}

	function opacity(num, opacStart, opacEnd, millisec) 
	{ 
		var speed = Math.round(1000/millisec); 
		var timer = 0; 

		if(opacStart > opacEnd) 
		{ 
			for(i = opacStart; i >= opacEnd; i=i-4) 
			{ 
				setTimeout("changeOpac(" + _obj_num + "," + num + "," + i + ")", (timer * speed)); 
				timer++; 
			}
		} 
		else if(opacStart < opacEnd) 
		{ 
			for(i = opacStart; i <= opacEnd; i=i+4) 
			{ 
				setTimeout("changeOpac(" + _obj_num + "," + num + "," + i + ")", (timer * speed)); 
				timer++; 
			} 
		} 
	}

	function slide(num, direction, millisec)
	{
		var speed = Math.round(1000/millisec); 
		var timer = 0; 
		
		if(_orientation == 'h')	_ori = 0;
		else					_ori = 1;

		if(direction == 'show') 
		{ 
			for(i = 0; i <= 100; i=i+2) 
			{ 
				setTimeout("changePOS(" + _obj_num + "," + num + "," + i + "," + _ori + ")", (timer * speed)); 
				timer++; 
			} 
		} 
		else if(direction == 'hide') 
		{ 
			for(i = 100; i >= 0; i=i-2) 
			{ 
				setTimeout("changePOS(" + _obj_num + "," + num + "," + i + "," + _ori + ")", (timer * speed)); 
				timer++; 
			}
		} 
	}
	
	function getlevel(layer)
	{
		var level = 0;
		var currentobj = layer;
		while(currentobj.className != MLDDM_CLASS)
		{
			if(currentobj.tagName == 'UL') level++;
			currentobj = currentobj.parentNode;
		}
		
		return level;
	}
	
	function getbutton(layer)
	{
		var button;
		var currobj = layer;
		var index = 0;
		while(currobj.className != MLDDM_CLASS)
		{	
			if(currobj.tagName == 'LI') 
			{
				index++;
				button = currobj;
			}
			currobj = currobj.parentNode;
		}
		return button;
	}

	function button_on(layer)
	{
		if(getlevel(layer) !=1) return -1;

		var button = getbutton(layer);
		if(button) 
		{
			button = button.getElementsByTagName("a")[0];
			button.id = 'buttonhover';
		}
	}

	function button_off(layer)
	{
		if(getlevel(layer) !=1) return -1;

		var button = getbutton(layer);
		if(button) 
		{
			button = button.getElementsByTagName("a")[0];
			button.id = 'buttonnohover';
		}
	}
	
	function mopen(index)
	{
		if(!_me._layers[1][index])
		{
			if(_effect == 'fade') 
				{opacity(index, 0, 100, _effect_speed);}
			else if(_effect == 'slide') 
				{slide(index, 'show', _effect_speed);}
			else
				{_me._layers[0][index].style.visibility = 'visible';}

			button_on(_me._layers[0][index]);
			_me._layers[1][index] = true;
		}
	}

	function mclose(index)
	{
		if(_me._layers[1][index])
		{
			if(_effect == 'fade') 
				{opacity(index, 100, 0, _effect_speed);}
			else if(_effect == 'slide') 
				{slide(index, 'hide', _effect_speed);}
			else
				{_me._layers[0][index].style.visibility = 'hidden';}
			
			button_off(_me._layers[0][index]);			
			_me._layers[1][index] = false;				
		}
	}

	function closeall()
	{
		for(var i=0; i < _me._layers[0].length; i++) { mclose(i); }
	}

	function mclosetime()
	{	
		_closetimer = window.setTimeout(closeall, _timeout);
	}
	
	function mcancelclosetime()
	{
		if(_closetimer) { window.clearTimeout(_closetimer); _closetimer = null;	}
	}

	function getlayerindex(obj)
	{
		for(var i=0; i < _me._layers[0].length; i++) 
		{ 
			if(_me._layers[0][i] == obj) return i; 
		}
		return -1;
	}

	this.pcloseall = function() { closeall(); };
	this.eventover = function()
	{
		if(_mouseout)
		{	
			_mouseout = false;			
			mcancelclosetime();			
			var currentli = this;		
			
			var layer = currentli.getElementsByTagName("ul")[0];
			var ind = getlayerindex(layer);
			if(ind >= 0) mopen(ind);
			
			var open_layers = new Array();
				
				open_layers[0] = currentli.getElementsByTagName("ul")[0];
				if(!open_layers[0]) open_layers[0] = 0;
				
				var currobj = currentli.parentNode;
				var num = 0;
				while(currobj.className != MLDDM_CLASS)
				{
					if(currobj.tagName == 'UL') 
					{
						num++;
						open_layers[num] = currobj;
					}
					currobj = currobj.parentNode;
				}
			
			var layers_to_hide = new Array(_me._layers[0].length);
			
			for(var i=0; i < layers_to_hide.length; i++) 
				layers_to_hide[i] = false;
			
			for(var i=0; i < open_layers.length; i++)
				layers_to_hide[getlayerindex(open_layers[i])] = true;
			
			for(var i=0; i < layers_to_hide.length; i++)
				if(!layers_to_hide[i] && (_currentlayer != open_layers[0])) mclose(i);
			
			_currentlayer = open_layers[1];
		}
	};
	this.eventout = function() { _mouseout = true; };
	this.allout = function()   { mclosetime(); };
	this.allover = function()  { mcancelclosetime(); }; // new

	var current = _handler.getElementsByTagName("li")[0];
	var i = 0;
	while(current)
	{
		_buttons[i] = current;
		current = node_after(current);
		i++;
	}
	
	var count = 0;
	var all_li = _handler.getElementsByTagName("li");
	for(var i = 0; i < all_li.length; i++)
	{
		var layer = all_li[i].getElementsByTagName("ul")[0];
		if(layer) 
		{	
			this._layers[0][count] = layer;
			this._layers[1][count] = false;
			count++; 
		}
		
		all_li[i].onmouseover = this.eventover;
		all_li[i].onmouseout  = this.eventout;
	}
	_handler.onmouseout  = this.allout;
	_handler.onmouseover = this.allover; 	

	var li_blocks = new Array();
	var right_plus_left_padding;
	
	for(var number = 0; number < this._layers[0].length; number++)
	{
		li_blocks[number] = new Array();

		var current = this._layers[0][number].getElementsByTagName("li")[0];
		var i = 0;
		while(current)
		{
			li_blocks[number][i] = current;
			current = node_after(current);
			i++;
		}


		var maxwidth = 0;			
		var cur;					
		var longest;				

		for(i = 0; i < li_blocks[number].length; i++)
		{
			cur = li_blocks[number][i].getElementsByTagName("a")[0];
			
			if(cur.offsetWidth >= maxwidth)
			{
				maxwidth = cur.offsetWidth;
				longest = cur;
			}
			
			if(cur.offsetWidth >= maxwidth)
			{
				maxwidth = cur.offsetWidth;
			}
		}
		
		right_plus_left_padding = longest.offsetWidth - maxwidth;

		this._layers[3][number] = maxwidth;
		this._layers[4][number] = li_blocks[number].length * longest.offsetHeight;
		
		var obj = this._layers[0][number];
		var top = obj.offsetTop;
		obj.style.marginTop = 0+'px';
		var margintop = top - obj.offsetTop;
		obj.style.marginTop = margintop+'px';
		this._layers[5][number] = margintop;
		
		this._layers[2][number] = getlevel(this._layers[0][number]);
	}
	
	for(index = 0; index < this._layers[0].length; index++)
	{
		var level = 0;
		var currentobj = this._layers[0][index];
		while(currentobj.className != MLDDM_CLASS)
		{
			if(currentobj.tagName == 'UL') level++;
			currentobj = currentobj.parentNode;
		}
		
		if((_orientation == 'h' && level > 1) || (_orientation == 'v'))
		{
			var parent_ul;	
			var parent_a;
			var curr = this._layers[0][index].parentNode;
			
			while(curr.tagName != 'UL') 
			{	
				if(curr.parentNode)
					{curr = curr.parentNode;}
				else
					{return 1;}
			}
			parent_ul = curr;

			var curr = this._layers[0][index].parentNode;
			while(curr.tagName != 'LI') 
			{
				if(curr.parentNode)
					{curr = curr.parentNode;}
				else
					{return 1;}
			}
			parent_a = curr.getElementsByTagName("a")[0];
			
			var a_tags = new Array();
			var i = 0;
			curr = parent_ul.getElementsByTagName("li")[0];
			while(curr)
			{
				if(curr.getElementsByTagName("a")[0]) 
					a_tags[i] = curr.getElementsByTagName("a")[0];

				curr = node_after(curr);
				if(curr) if(curr.tagName == 'LI') i++;
			}
			
			var num = 0;			
			for(var i = 0; i < a_tags.length; i++)
			{
				if(a_tags[i] != parent_a) num++;
				else break;
			}

			var tag_a  = parent_ul.getElementsByTagName("a")[0];

			var width  = tag_a.offsetWidth;
			var height = tag_a.offsetHeight;

			this._layers[0][index].style.left     = width      + _shiftx + 'px';
			this._layers[0][index].style.top      = height*num + _shifty + 'px';
		}
	}
}

function changeOpac(obj_num, layer_num, opacity)
{
	var object = obj_menu[obj_num];
	var layer  = object._layers[0][layer_num];

	layer.style.opacity			= (opacity / 100); 
	layer.style.MozOpacity		= (opacity / 100); 
	layer.style.KhtmlOpacity	= (opacity / 100); 
	layer.style.filter			= "alpha(opacity="+opacity+")";

	if(opacity > 98) layer.style.filter = 'none';			

	if(opacity  > 0) layer.style.visibility='visible';
	if(opacity <= 0) layer.style.visibility='hidden';
}

function changePOS(obj_num, layer_num, pos, ori)
{
	var object		= obj_menu[obj_num];
	var layer		= object._layers[0][layer_num];
	var level		= object._layers[2][layer_num];
	var width		= object._layers[3][layer_num];
	var height		= object._layers[4][layer_num];
	var margintop	= object._layers[5][layer_num];

	if(level == 1 && ori == 0)
	{
		var h = height - pos*height/100; 
		layer.style.clip	  = 'rect('+h+'px 1000px 1000px 0px)';
		layer.style.marginTop = -h+margintop+'px';
	}
	else
	{
		var w = width - pos*width/100; 
		layer.style.clip	  = 'rect(0px 1000px 1000px '+w+'px)';
		layer.style.marginLeft = -w+'px';
	}

	if(pos <= 0) layer.style.visibility = 'hidden';
	if(pos  > 0) layer.style.visibility = 'visible';
	
}

function is_all_ws(nod)
{
  return !(/[^\t\n\r ]/.test(nod.data)); 
}

function is_ignorable(nod)
{
  return ( nod.nodeType == 8) || 
         ((nod.nodeType == 3) && is_all_ws(nod) ); 
}

function node_after(sib)
{
	while((sib = sib.nextSibling)) { if(!is_ignorable(sib)) return sib; }
	return null;
}

_LOADERS = Array();

function callAllLoaders() 
{
	var i, loaderFunc;

	for(i=0; i<_LOADERS.length; i++) 
	{
		loaderFunc = _LOADERS[i];
		if(loaderFunc != callAllLoaders) loaderFunc();
	}
}

function appendLoader(loaderFunc) 
{
	if(window.onload && window.onload != callAllLoaders) _LOADERS[_LOADERS.length] = window.onload;
	window.onload = callAllLoaders;
	_LOADERS[_LOADERS.length] = loaderFunc;
}

appendLoader(mlddminit);

function close() { for(var i=0; i < obj_menu.length; i++) { obj_menu[i].pcloseall(); } }
document.onclick = close;

