$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(600);
  
});


//Валидация формы

//    var pas1 = document.forms.signupForm.enterpassword.value;
//    var pas2= document.forms.signupForm.enterpassword.value;

// $('document').ready(function(){
//   $('#signform').validate({
    
//     rules:{
//       firstname:{
//         required: true,
//         minlength:2,
//         maxlength:20
//       },
//       //Сообщения
//       messages:{
//         "firstname":{
//           required:"Запоните поле",
//           minlength:"От двух до 20 символов",
//           maxlength:"Не больше 20 символов"
//         },
//     }
//   }
// });
// });