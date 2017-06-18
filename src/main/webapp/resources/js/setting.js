/**
 * Created by Dmitro on 13.06.2017.
 */

function callFirstBlock() {
    alert("click");
    var e=$('input.gender[type="checkbox"]:checked', this).val();
    console.log("map: "+e);

    var map = {
        name: $("input[name='email']").val(),
        first_name: $("input[name='first_name']").val(),
        last_name: $("input[name='last_name']").val(),
        gender: $("input[name='gender']").val(),

    };
    console.log("map: "+map);
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