// Popup for Music===============================================================================
var addTrack = document.getElementById('playlist');

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
        popupplaylist.style.display = '';
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
            // console.log(data);
            // audioContaineraudio.html(' ');
            // var audio = '<audio src=' + data["path"] + ' controls/>';
            // audioContaineraudio.append(audio);
           // var audioname = "test";

            audioplaylist = '<li style="margin:3%; width: 100%;border-radius: 10px; background-color: #fafafa;" class="list-group-item list-group-item-success"><span style="display: block">' + data["name"] + '</span><audio preload="none" src=' + data["path"] + ' controls/> </li>';
            audioContaineraudio.append(audioplaylist);
        });
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




