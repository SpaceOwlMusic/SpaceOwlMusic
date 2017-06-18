// var isMp3play = function (name) {
//     return name.match(/mp3$/i)
// };
// $(document).ready(function () {
//     var file = $('[name="fileaudio"]');
//     var audioContaineraudiolist = $('#containeraudiolist');
//     $('#uploadtrack').on('click', function () {
//         var filename = $.trim(file.val());
//         if (!(isMp3play(filename))) {
//             alert('Please browse a Jpg/png file to upload');
//             return;
//         }
//         $.ajax({
//             url: 'http://localhost:8080/greenapp/api/profile/createPlaylist',
//             type: "POST",
//             data: new FormData(document.getElementById("formaddmusic")),
//             enctype: 'multipart/form-data',
//             processData: false,
//             contentType: false
//         }).done(function (data) {
//             audioplaylist = "";
//             var listul = "";
//             var count = 1;
//             for (key in data) {
//                 var audioname = data[key].name;
//                 audioContaineraudiolist.html('');
//                 listul = '<ul class="list-group">';
//                 audioplaylist += '<li style="width: 60%;margin:2%;border-radius: 10px;" class="list-group-item list-group-item-success"><span style="display: block">' + (count++) + ': ' + +audioname + '</span><audio src=' + data[key].path + ' controls/> </li>';
//                 audioContaineraudiolist.append(listul);
//                 audioContaineraudiolist.append(audioplaylist);
//             }
//         });
//     });
// });

var isMp3play = function (name) {
    return name.match(/mp3$/i)
};
$(document).ready(function () {
    var file = $('[name="fileaudio"]');
    var audioContaineraudiolist = $('#containeraudiolist');
    var audioplaylist = "";
    var listul = '<ul class="list-group">';
    audioContaineraudiolist.append(listul);

    $('#uploadtrack').on('click', function () {
        var filename = $.trim(file.val());
        if (!(isMp3play(filename))) {
            alert('Please browse an .mp3 file to upload');
            return;
        }
        $.ajax({
            url: "http://localhost:8080/greenapp/api/playlist/putSounds",
            type: "POST",
            data: new FormData(document.getElementById('formaddmusic')),
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function (data) {
            for (var key in data) {
                var audioname = data[key].name;
                audioplaylist = '<li style="margin:3%; width: 50%;border-radius: 10px;" class="list-group-item list-group-item-success"><i class="fa fa-trash-o" aria-hidden="true" onclick="deleteSound(98)"></i><span style="display: block">' + audioname + '</span><audio preload="none" src= ' + data[key].path + ' controls/> </li>';
                audioContaineraudiolist.append(audioplaylist);
            }
        });
    });
});

//ФОН ВЫБИРАЕТ ПОЛЬЗОВАТЕЛЬ
// var path=window.location.href.split('/');
// var val = path[path.length - 1];
// console.log(val);

var isJpg = function (name) {
    return name.match(/jpg$/i)
};
var isPng = function (name) {
    return name.match(/png$/i)
};
$(document).ready(function () {
    var file = $('[name="filefoto"]');
    var id_playlist = $('#secretValue');

    var imgContainer = $('#imgContainer');
    var background = document.getElementById('conteineraddtrack');
    $('#uploadphoto').on('click', function () {
        console.log("click update photo");
        var filename = $.trim(file.val());
        if (!(isJpg(filename) || isPng(filename))) {
            alert("Please browse a Jpg/png file to upload");
            return;
        }
        $.ajax({
            url: "http://localhost:8080/greenapp/api/profile/loadPhoto",
            type: "POST",
            // {form:form,formname:formname,ipadd:ipadd,FormData:FormData}
            data: new FormData(document.getElementById("formaddphoto")),
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function (data) {

            var url = data;
            background.style.backgroundImage = "url(data:" + data.contenttype + ";base64," + data.base64 + ")";
            background.style.backgroundSize = "cover";
        });
    });
});

function deleteSound(id) {
    var elem = document.getElementById('sound'+id);
    elem.remove();


    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/playlist/sound/remove',
        data: {id_sound: id},
        success: function (data) {
            var elem = document.getElementById(id);
            console.log(elem);
            elem.remove();
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}