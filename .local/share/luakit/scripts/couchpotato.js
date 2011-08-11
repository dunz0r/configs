// ==UserScript==
// @name 		CouchPotato UserScript
// @description Add movies to your CouchPotato via external sites like IMDB
// @include		http*://*.imdb.com/title/tt*
// @include		http*://imdb.com/title/tt*
// @include		http*://192.168.1.1:5000*
// ==/UserScript==

GM_addStyle('#mmPopup { opacity: 0.5;width:50px; font-family: "Helvetica Neue", Helvetica, Arial, Geneva, sans-serif; -moz-border-radius-topleft: 6px; -moz-border-radius-topright: 6px; -webkit-border-top-left-radius: 6px; -webkit-border-top-right-radius: 6px; -moz-box-shadow: 0 0 20px rgba(0,0,0,0.5); -webkit-box-shadow: 0 0 20px rgba(0,0,0,0.5); position:fixed; z-index:9999; bottom:0; right:0; font-size:10px; margin: 0; display: block; background:#f5f5f5; } 	#mmPopup:hover { opacity: 1; } 	#mmPopup a#addTo { cursor:pointer; text-align:center; text-decoration:none; color: #000; display:block; padding:5px 0 5px; } 	#mmPopup a#closeBtn { cursor:pointer; float: right; margin-right: 3px; margin-top: 5px; } 	#mmPopup a img { vertical-align: middle; } 	#mmPopup a:hover { color:#000; } 	#mmPopup iframe{ -moz-border-radius-topleft: 8px; background:#f5f5f5; float: left; height:50px; width:190px; overflow:hidden; border:none; white-space: no-break;} ')

var cpLocation = 'http://192.168.1.1:5000';

var version = 1

document.getElementsByClassName = function(cl) {
var retnode = [];
var myclass = new RegExp('\\b'+cl+'\\b');
var elem = this.getElementsByTagName('*');
for (var i = 0; i < elem.length; i++) {
var classes = elem[i].className;
if (myclass.test(classes)) retnode.push(elem[i]);
}
return retnode;
}; 

function create() {
	switch (arguments.length) {
	case 1:
		var A = document.createTextNode(arguments[0]);
		break;
	default:
		var A = document.createElement(arguments[0]), B = arguments[1];
		for ( var b in B) {
			if (b.indexOf("on") == 0)
				A.addEventListener(b.substring(2), B[b], false);
			else if (",style,accesskey,id,name,src,href,which".indexOf(","
					+ b.toLowerCase()) != -1)
				A.setAttribute(b, B[b]);
			else
				A[b] = B[b];
		}
		for ( var i = 2, len = arguments.length; i < len; ++i)
			A.appendChild(arguments[i]);
	}
	return A;
}

if (typeof GM_addStyle == 'undefined')
	GM_addStyle = function(css) {
		var head = document.getElementsByTagName('head')[0], style = document
				.createElement('style');
		if (!head) {
			return
		}
		style.type = 'text/css';
		style.textContent = css;
		head.appendChild(style);
	}

var movieImg = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAZCAYAAABQDyyRAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+9JREFUeNrMVklIXFkUPVWWY5cDccIpMQ444YCi7UJ3KrpUxAkURRAFW6GdMCI0ooKuxIWCIkrc6FYMcYogrgxoEHFeRFRE42w5D/X73dv1i4pUOiGmkly4/u9779c979x7z3sKSZLwK02JX2y/BYCXwmeESybyGV0Mo6YQNTBzf38f09/fj7GxMRwcHPyQnTk5OSEpKQm5ublQqVTvxdCfXwIg9fT0YGBgAO7u7qipqUFAQACurq7Q29uLoaEhXhgdHY3q6mqo1WocHx+jpaUF8/PzPJeamor8/HwKhKWlJbS2tmJ/f5/nsrKyUFhYSK8vhG8+BmD2j7Dm5mZotVqcnp5ibW0N4eHhcHFxQUREBM7OznhsZ2cHu7u7iI2Nhb29PQOi8b29PaysrECpVCIqKgpubm4IDAzE7OwsLi8vsbW1hYyMDIrVK/yTUQDd3d2oqKjgjygFc3NzCAsLg7OzMyIjI3F+fo7V1VVsbm5ie3sbMTExsLW15acMYmFhAbe3twza1dUVwcHB0Gg0WF9fR15eHsXqNAZA3wUJCQkoKipiGilIQ0MDf2xmZsYUJicn87rp6Wmm+OLigpmglIWEhPDc4OAg+vr6cH19zSwUFBR8tVa4BhITE03aauPj4/QIE75gFMBPanmjAFT05ycxYNRU8svo6CiGh4fR2dkJoQvw8PBAXV0dfHx8cHNzw+MjIyO8Ni4uDpWVlbCxseGibWpqwuLiIs9lZ2cjJycHlpaW3DlTU1N6afhfABMTE+jq6uLgnp6eqK+v5+BU2aQTcvD4+HhUVVXB2toaJycnrAdy8MzMTNYDasnl5WUeIzA6eyWc0GiNdkFbWxvvlIKKzvxs57IYGQYnMWpsbNSLEQWibqHgBIiA2dnZIS0tDbW1taxlwm0o3YYp1zNwd3fHSlheXs4MUO+TElJaZCUsKyuDubk5q9xjJaTd02/ISkgAqR1JCw4PD+XNSiZvQysrKygUClhYWDCrpAX+/v7o6OjQiOkA4RpdGi4/Y+Cp5uDggJKSEj5HiAkCQSmU2T06OlILuadikURqbgXAt+K9khlIT0/nc+ApRqceSe63/FZQUBDa29vp9W9mICUlhU/DJ10slP/Vs6+vLx9gZNRRGxsb3JJeXl76td7e3vrPiIEPYmEEtdrk5CRR9V0AHB0dUVpaitDQUD0gOmGJEV0NUAEeGVxU3gn/CwLAS7qUSCYwUf2SOOSk4uJi+vdYuJtwtfA/6AQgpxR81N1WnIU//4EKbP7w8PBGPJ9REersTHTchaE8G3bBvs6fZHJLiwBW4vakJfr9/Py4JIx+IFNhAqf6em2QkT7hysfr/hVgAIhbr+v/xmSzAAAAAElFTkSuQmCC'
var closeImg = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfPtRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAAA5ElEQVR42tRTQYoEIQwsl/2Bl3gQoY9eBKEf5kvyG8G7h4Z+S38gIu5lp5lZ2R7YPm1BDhZJSFWiGmPgDj5wE7cbfD4/mBkAHprUj9yTTyn9OsGIMSLG+Fxwxc8SiAi9d4QQHskjhIDeO4jorQcq5wwiQmsN3nt479FaAxEh5zxJmyZIKalSClprL1FKQUpJXZr4DBH52xqZeRhjICKw1sJaCxGBMQbMPN41GFpriAicc6i1otYK5xxEBFrraQuThGVZAADbtp2amXms6woAOI7j0gO17/t5MN+HNfEvBf//M30NAKe7aRqUOIlfAAAAAElFTkSuQmCC'

// IMDB
if(location.href.indexOf("imdb.com") >= 0){

	var link = "/movie/imdbAdd/";
	var id = 'tt' + location.href.replace(/[^\d+]+/g, '');

	// Ignore if it's a TV Show
	var isMovie = true
	var serie = document.getElementsByTagName('h5'); // old layout
	for (var i = 0; i < serie.length; i++) {
		if (serie[i].innerHTML == 'Seasons:') {
			isMovie = false;
			break;
		}
	}
	
	var serienew = document.getElementsByTagName('h4'); // new layout
	for (var i = 0; i < serienew.length; i++) {
		if (serienew[i].innerHTML == 'Season: ') {
			isMovie = false;
			break;
		}
	}
	
	
	
	if (isMovie == true) {

		var navbar, newElement;
		
		if(!document.getElementById('tn15title')) // new design
			var year = document.getElementById('main').getElementsByTagName('a')[1].text;
		else
			var year = document.getElementById('tn15title').getElementsByTagName('a')[0].text;
	
		var iFrame = create('iframe', {
			src : cpLocation + link + '?id=' + id + '&year=' + year,
			frameborder : 0,
			scrolling : 'no'
		})
		
		var addToText = '<a class="addTo" href="#"></a>'
		var popupId = 'mmPopup'
	
		var popup = create('div', {
			id : popupId,
			innerHTML : addToText
		});
		var addButton = create('a', {
			//innerHTML: '<img src="' + movieImg + '" />Add to CouchPotato',
			innerHTML: '<img src="' + movieImg + '" />',
			id: 'addTo',
			onclick: function(){
				popup.innerHTML = '';
				document.getElementById('mmPopup').style.width='200px';
				popup.appendChild(create('a', {
					innerHTML: '<img src="' + closeImg + '" />',
					id: 'closeBtn',
					onclick: function(){
						popup.innerHTML = '';
						popup.appendChild(addButton);
						document.getElementById('mmPopup').style.width='45px';
					}
				}));
				popup.appendChild(iFrame);
			}
		})
		popup.appendChild(addButton);
	
		document.body.parentNode.insertBefore(popup, document.body);
	}
}
// CP
else if(location.href.indexOf(cpLocation) >= 0){
	
}
