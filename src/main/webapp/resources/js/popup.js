var linkSignIn = document.querySelector('.header_menu button');
console.log(linkSignIn);
var popup = document.querySelector('.popup');
var popupClose=document.querySelector('.popup-close');
var popupInner= document.querySelector('.popup-inner');

linkSignIn.onclick =function(){
	popup.style.display='block';
}
popup.onclick= function(){
	popup.style.display='';
}
popupClose.onclick= function(){
	popup.style.display='';
}
popupInner.onclick=function(event){
	event.stopPropagation();
}



 //Popup for Music===============================================================================
// var linkSignUP = document.getElementById('signup')
// console.log(linkSignUP)
// var popupList = document.querySelectorAll('.popup');
// var popupInnerList = document.querySelectorAll('.popup-inner');
// var popupCloseList = document.querySelectorAll('.popup-close');

// linkSignUP.onclick =function(){
//   popup.style.display='block';
// }
// popup.onclick= function(){
//   popup.style.display='';
// }
// popupClose.onclick= function(){
//   popup.style.display='';
// }
// popupInner.onclick=function(event){
//   event.stopPropagation();
// }