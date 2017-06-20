// Popup for Music===============================================================================
var addTrack = document.getElementById('playlist');

function hide_modal() {
    $('#track-modal').modal('hide');
}

addTrack.onclick = function () {
    $('#track-modal').modal();
}

var createPlaylistModal = document.getElementById('createPlaylistModal');

createPlaylistModal.onclick = function () {
    $('#playlist-modal').modal();
}

// Upload  Music(Single Track)===============================================================================
var isMp3 = function (name) {
    return name.match(/mp3$/i)
};

$(document).ready(function () {
    var file = $('[name="onefileaudio"]');

    var audioContaineraudio = $('#containeraudiolist');
    var audioplaylist = "";

    $('#uploadtrack').on('click', function () {
        hide_modal();
        var filename = $.trim(file.val());
        if (!(isMp3(filename))) {
            alert("Please browse a Mp3/Wav file to upload");
            return;
        }
        $.ajax({
            url: "http://localhost:8080/greenapp/api/profile/putSingleAudio",
            type: "POST",
            data: new FormData(document.getElementById("formaddmusic")),
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function (data) {
            console.log("good");
            var sound = data["id"];
            var deleteLi="sound"+sound;
            audioplaylist = '<li style="margin:3%; width: 100%;border-radius: 10px; background-color: #fafafa;" id='+deleteLi+' class="list-group-item list-group-item-success"><i class="fa fa-trash-o" aria-hidden="true" onclick=deleteSound('+sound+') ></i><span style="display: block">' + data["name"] + '</span><audio preload="none" src=' + data["path"] + ' controls/> </li>';
            audioContaineraudio.append(audioplaylist);
        }).fail(function (xhr) {
            console.log("error: " + xhr.response);

        });
        ;
    });
});

var isJpg = function (name) {
    return name.match(/jpg$/i)
};
var isPng = function (name) {
    return name.match(/png$/i)
};

var idImageByPlaylist = 0;

$(document).ready(function () {
    var file = $('[name="filefoto"]');
    $('#uploadimgtrack').on('click', function () {
        var filename = $.trim(file.val());
        if (!(isJpg(filename) || isPng(filename))) {
            alert("Please browse a Jpg/png file to upload");
            return;
        }
        $.ajax({
            url: "http://localhost:8080/greenapp/api/profile/loadPhoto",
            type: "POST",
            data: new FormData(document.getElementById("formimglist")),
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false
        }).done(function (data) {
            console.log("sata: " + data);
            idImageByPlaylist = data.image_id;
            $("#baseimgplaylist").attr("src", "data:" + data.contenttype + ";base64," + data.base64);

        });
    });
});


function call() {
    var map = {
        name: $("input[name='name_playlist']").val(),
        description: $("input[name='description_playlist']").val(),
        image_id: idImageByPlaylist
    };
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/profile/playlist/',
        data: map,
        success: function (data) {
            window.location.href = data["path"];
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}

function deleteAlbum(id) {
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/playlist/remove',
        data: {id_playlist: id},
        success: function (data) {
            var elem = document.getElementById(id);
            elem.remove();
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}


function deleteSound(id) {
    console.log("id: " + id);
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/greenapp/api/playlist/sound/remove',
        data: {id_sound: id},
        success: function (data) {
            var elem = document.getElementById('sound' + id);
            elem.remove();
        },
        error: function (xhr, str) {
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}




document.addEventListener('play', function(e){
    var audios = document.getElementsByTagName('audio');
    for(var i = 0, len = audios.length; i < len;i++){
        if(audios[i] != e.target){
            audios[i].pause();
        }
    }
}, true);
