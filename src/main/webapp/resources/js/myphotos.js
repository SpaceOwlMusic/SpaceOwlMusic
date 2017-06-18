//Popup for Photo======================================================================
var buttonPhoto= document.querySelectorAll('.userphoto button');
console.log(buttonPhoto);
var popupList = document.querySelectorAll('.popup');
var popupInnerList = document.querySelectorAll('.popup-inner');
var popupCloseList = document.querySelectorAll('.popup-close');

for (var i = 0; i < buttonPhoto.length; i++) {
    buttonPhoto[i].onclick = function() {
        var popupId2 = this.dataset.photo;
        console.log(popupId2);

        document.getElementById(popupId2).style.display = 'block';

    }
}

for (var j = 0; j < popupList.length; j++) {
    popupList[j].onclick = function() {
        this.style.display = '';
    }
}

for (var k = 0; k < popupInnerList.length; k++) {
    popupInnerList[k].onclick = function(event) {
        event.stopPropagation();
    }
}

for (var l = 0; l < popupCloseList.length; l++) {
    popupCloseList[l].onclick = function() {
        this.parentElement.parentElement.style.display = '';
    }
}


//ADD PHOTO============================================================================
var closePopup= document.getElementById('photo');
var isJpg = function(name) {
    return name.match(/jpg$/i)
};
var isPng = function(name) {
    return name.match(/png$/i)
};
$(document).ready(function () {
    var file =$('[name="filefoto"]');
    var imgContainerfoto =$('#containerfoto');
    var conteinerrow= $('#conteinerrow');
    $('#uploadphoto').on('click', function () {
        var filename =$.trim(file.val());
        if (!(isJpg(filename)|| isPng(filename))){
            alert("Please browse a Jpg/png file to upload");
            return;
        }
        $.ajax({
            url:"http://localhost:8080/greenapp/api/profile/createPhotoAlbums",
            type: "POST",
            data: new FormData(document.getElementById("formaddphoto")),
            enctype:'multipart/form-data',
            processData:false,
            contentType:false
        }).done(function (data) {
            var img ="";

            for(key in data){
                console.log("c: "+data[key]);
                imgContainerfoto.html(' ');
                conteinerrow.html(' ');
                img+='<div class="col-xs-6 col-md-3"><img width="150px" height="150px" class="thumbnail" src="data:'+ data[key].contenttype + ';base64,'+data[key].base64+'"/></div>';
                closePopup.style.display = '';
                imgContainerfoto.append(conteinerrow);
                conteinerrow.append(img);
            }
        });
    });
});
