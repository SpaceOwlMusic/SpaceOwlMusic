/**
 * Created by Dmitro on 30.05.2017.
 */

$(document).ready(function () {
    var file =$('[name="filefoto"]');
    var imgContainerfoto =$('#containerfoto');
    var conteinerrow= $('#conteinerrow');
    $('#uploadphoto').on('click', function () {
        var filename =$.trim(file.val());
        $.ajax({
            url:"http://localhost:8080/greenapp/api/people/getAllPeople",
            type: "GET",
            data: new FormData(document.getElementById("formaddphoto")),
            enctype:'multipart/form-data',
            processData:false,
            contentType:false
        }).done(function (data) {
            var img ="";

            // for(key in data){
            //     console.log("c: "+data[key]);
            //     imgContainerfoto.html(' ');
            //     conteinerrow.html(' ');
            //     img+='<div class="col-xs-6 col-md-3"><img width="150px" height="150px" class="thumbnail" src="data:'+ data[key].contenttype + ';base64,'+data[key].base64+'"/></div>';
            //     closePopup.style.display = '';
            //     imgContainerfoto.append(conteinerrow);
            //     conteinerrow.append(img);
            // }
        });
    });
});
