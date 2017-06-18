
//Avatar==============================================================================
// var idUser= document.getElementById("idUser").value;
var isJpg = function(name) {
    return name.match(/jpg$/i)
};
var isPng = function(name) {
    return name.match(/png$/i)
};
$(document).ready(function () {
    var file =$('[name="filefoto"]');
    var imgContainer =$('#imgContainer');
    $('#uploadphoto').on('click', function () {
        var filename =$.trim(file.val());
        if (!(isJpg(filename)|| isPng(filename))){
            alert("Please browse a Jpg/png file to upload");
            return;
        }
        $.ajax({
            url:"http://localhost:8080/greenapp/api/profile/updatePhoto",
            type: "POST",
            data: new FormData(document.getElementById("formaddphoto")),
            enctype:'multipart/form-data',
            processData:false,
            contentType:false
        }).done(function (data) {
            imgContainer.html(' ');
            var img = '<img width="120px" height="120px" class="img-circle" src="data:'+ data.contenttype + ';base64,'+data.base64+'"/>';
            $('#baseimg').remove();
            imgContainer.append(img);
        });
    });
});
