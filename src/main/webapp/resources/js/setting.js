/**
 * Created by Dmitro on 13.06.2017.
 */

function callFirstBlock() {
    var gender = "";

    var radioValue = $("input[name='gender']:checked").val();
    if (radioValue) {
        gender = radioValue;
    }

    var realation = $("#sel1 option:selected").text();


    var map = {
        name: $("input[name='email']").val(),
        first_name: $("input[name='first_name']").val(),
        last_name: $("input[name='last_name']").val(),
        gender: gender,
        relation: realation
    };
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/settings/update_first_block',
        data: map,
        success: function (data) {
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}

function callSecondBlock() {
    var map = {
        favorite_music: $("textarea[name='favorite_music']").val(),
        hobbies: $("textarea[name='hobbies']").val(),
        about_yourself: $("textarea[name='about_yourself']").val(),

    };

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/settings/update_second_block',
        data: map,
        success: function (data) {
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}

function callThirdBlock() {
    var map = {
        inspiration: $("textarea[name='inspiration']").val(),
        you_compose: $("textarea[name='you_compose']").val(),
        other: $("textarea[name='other']").val(),

    };

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/settings/update_third_block',
        data: map,
        success: function (data) {
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}