//
//
//     // Нахожу нужные поля чтобы потом с ними работать через переменные!
//     // ПРИВЯЗЫВАЮСЬ К КНОПКЕ МОИ ДИАЛОГИ!
//
//
//  // ************************************************
//  // ЭТО КОГДА У НАС БУДУТ ЧАТЫ
//
//
// // $('#button').on('click',null, function(){
// //     var getID = function(){
// //                 $.ajax({
// //                     type: "POST",
// //                     dataType:"json",
//
// //                         // !!!!!!!!!!!!!!!!!!!!!!!!!!!!**********************************************
// //                         // ЗДЕСЬ НАДО ДОПИСАТЬ НЕ ЗНАЮ КАКОЙ URL
// //                     url: '/url/',
// //                     data: get2Ids,
// //                 complete: function(data){ // data - ответ полученный с сервера
// //                    var objId =  $.parseJSON(data); // записала  полученные данные  data
// //                  }
// //                  });
// //             return objId; // возвратила   полученное значение ajax-запроса
// //      }
// // });
// // ********************************************************
//
//
//
// var getID = function(){
//     var objId=[];
//                 $.ajax({
//                     type: "POST",
//                     dataType:"json",
//                         // !!!!!!!!!!!!!!!!!!!!!!!!!!!!**********************************************
//                         // ЗДЕСЬ НАДО ДОПИСАТЬ НЕ ЗНАЮ КАКОЙ URL
//                     url: '/api/getMessage',
//                     data: 'get2Ids',
//                 complete: function(data){ // data - ответ полученный с сервера
//                    objId =  $.parseJSON(data); // записала  полученные данные  data
//                  }
//                  });
//             return objId; // возвратила   полученное значение ajax-запроса
//      }
//
//  var final = getID();
//  var idSelf=final[0];
// var idFriend=final[1];
    var refreshButton = $('h1 img'),
        shoutboxForm = $('.shoutbox-form'),
        form = shoutboxForm.find('form'),
        closeForm = shoutboxForm.find('h2 span'),
        nameElement = form.find('#shoutbox-name'),
        commentElement = form.find('#shoutbox-comment'),
        ul = $('ul.shoutbox-content');


  // Понимает смайлик

    // emojione.ascii = true;

    // Загрузка коментариев
    load();
    
    // Если все хорошо отправить сообщение в чат (Если заполнены поля)
    
    var canPostComment = true;

    form.submit(function(e){
        e.preventDefault();

        if(!canPostComment) return;
        
        var comment = commentElement.val().trim();

        if(comment.length && comment.length < 240) {
        
            publish(idSelf, comment);

            // ПОСТ Коментария

            canPostComment = false;

            // Разрешение постить через пять секунд (чтобы не было спама)

            setTimeout(function(){
                canPostComment = true;
            }, 5000);

        }

    });
    
    // Видимость формы (раскрытие и закрытие)
    
    shoutboxForm.on('click', 'h2', function(e){
        
        if(form.is(':visible')) {
            formClose();
        }
        else {
            formOpen();
        }
        
    });
    
    // В случае группового чата (ЕГО вроде не так сложно реализовать)
    ul.on('click', '.shoutbox-comment-reply', function(e){
        
        var replyName = $(this).data('name');
        
        formOpen();
        commentElement.val('@'+replyName+' ').focus();

    });
    
    // Обновление чата (пока не автоматом) Пока посмотреть работает ли так
    
    var canReload = true;

    refreshButton.click(function(){

        if(!canReload) return false;
        
        load();
        canReload = false;

        // Через 2 секунды можно обновлять дальше
        setTimeout(function(){
            canReload = true;
        }, 2000);
    });

    // Попробовала сделать автоматический запрос на обновление каждые 20 сек
    // без тебя не знаю работает ли
    setInterval(load,10000);


    function formOpen(){
        
        if(form.is(':visible')) return;

        form.slideDown();
        closeForm.fadeIn();
    }

    function formClose(){

        if(!form.is(':visible')) return;

        form.slideUp();
        closeForm.fadeOut();
    }

    // Отправка сообщение в БД
    
    function publish(name,comment){

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/greenapp/api/putMessage',
            data: {comment: comment},
            success: function () {
                nameElement.val("");
                commentElement.val("");
                load();
            },
            error: function (xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });

    }
    
    // Вытащить последние сообщения
    // URL над добавить откуда тащить
function load() {
    $.get("http://localhost:8080/greenapp/api/getMessage")
        .done(function (data) {
            var res = data;


            res = JSON.parse(data);


            appendComments(res);
        });
}

// Добавление в DOM

function appendComments(res) {
    console.log(res.message);
    ul.empty();
    ul.append(res);


    for (var i = 0; i < res.history.length; i++) {
        var msg = res.history[i];

        ul.append('<li>' +
            '<span class="shoutbox-username">' + msg.sender +': '+ '</span>' +

            '<span class="shoutbox-username">' + msg.message + '</span>' +


            '</li>');
    }

}


