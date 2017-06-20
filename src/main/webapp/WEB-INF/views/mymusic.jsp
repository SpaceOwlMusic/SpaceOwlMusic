<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 28.05.2017
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OwlMusic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <!-- Generic page styles -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mymusic.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">


</head>
<body>
<div id="pagewrap" style="padding-bottom: 50%">
    <!--<ХЕДЕР=================================================================================================>-->
    <header id="header">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
    </header>
    <div id="content">
        <div id="addtrack" class="col-sm-4">
            <section class="usermusic">
                <button data-music="playlist" class="createplaylist" id="playlist">
                    Add track
                </button>
            </section>
            <div id="track-modal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="modal-body">
                            <h2>Add track</h2>
                            <div class="conteineraddtrack">
                                <div id="headerforplaylist" class="row">
                                    <div class="col-md-4">
                                        <img id="baseimgtrack" src="${contextPath}/resources/img/owlchat.png">
                                        <form id="formimgtrack">
                                            <input type="file" name="imgtrack" id="imgplaylist" class="inputfile"/>
                                            <label for="imgtrack"> Choose a file</label>
                                            <button id="uploadimgplaylist" type="button">Upload</button>
                                        </form>
                                    </div>
                                    <div class="col-md-8">
                                        <%--<article>1.Enter the name of the track please</article>--%>
                                        <%--<article>2.Choose the audiofile</article>--%>
                                        <%--<form id="formtrackname">--%>
                                            <%--<input type="text" id="trackname" placeholder=" Enter trackname">--%>
                                        <%--</form>--%>
                                        <form class="settingsprivasy">
                                            <article>Privasy settings</article>
                                            <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="1"
                                                                                  checked>Only I</label>
                                            <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="2">Only
                                                My Friends</label>
                                            <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="3">All
                                                people</label>
                                        </form>
                                        <form id="formtrackdescription">

                                        </form>
                                        <form id="formaddmusic">
                                            <%--<input type="text" id="trackdescription" placeholder=" Add description">--%>
                                            <input type="file" name="onefileaudio" id="addsingletrack" class="inputfile"/>
                                            <label for="addsingletrack"> Choose a file</label>
                                            <button id="uploadtrack" type="button"> Upload</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <div class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            <p>One fine body&hellip;</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->



            <div id="containeraudiolist">
                    <c:forEach items="${sounds.sounds}" var="map">

                    <li  style="margin:3%; width: 100%;border-radius: 10px;  background-color: #fafafa;" id="sound${map.id}"
                        class="list-group-item list-group-item-success">
                        <i class="fa fa-trash-o" aria-hidden="true" onclick="deleteSound(${map.id})" ></i>
                        <span style="display: block">${map.title}</span>
                        <audio src='${map.url}' preload="none" controls></audio>
                    </li>
                </c:forEach>
            </div>
        </div>

        <div class="col-sm-8">
            <section class="usermusic">
                <button id="createPlaylistModal" data-music="track" class="addtrack">
                    Add playlist
                </button>
            </section>

            <div class="row">


                <c:forEach items="${playlists}" var="map">
                    <div class="col-xs-6 col-md-3 img-playlist" id="${map.id}">
                        <i class="fa fa-trash-o" aria-hidden="true" onclick="deleteAlbum(${map.id})" ></i>
                        <div class="option_image_container">
                            <a href="${contextPath}/${username}/playlist/${map.id}" class="thumbnail">
                                <img src="${contextPath}/resources/img/audiotrack10.jpeg" alt="cover">
                                <span class="name-play-list">${map.title}</span>
                            </a>
                        </div>

                        <a class="like" href="${contextPath}/profile/playlist/${map.id}"><img
                                src="${contextPath}/resources/img/heart.png"> Like</a>
                    </div>
                </c:forEach>

            </div>

        </div>

        <!-- POPUP ADD PLAYLIST==================================================================================-->
        <%--<div class="popup" id="track">
            <div class="popup-inner">
                <div class="popup-close">X</div>
                <div class="headerlist">
                    <h2>Create playlist</h2>
                    <img src="${contextPath}/resources/img/earphones.png">
                </div>
                <div class="conteineraddtrack">
                    <div id="headerforaddplaylist" class="row">
                        <div class="col-md-4">
                            <img id="baseimgplaylist" src="${contextPath}/resources/img/owlchat.png">
                            <form id="formimglist">
                                <input type="file" name="filefoto" id="imgtrack" class="inputfile"/>
                                <label for="imgtrack"> Choose a file</label>
                                <button id="uploadimgtrack" type="button">Upload</button>
                            </form>

                        </div>
                        <div class="col-md-8">
                            &lt;%&ndash;<form class="settingsprivasy">&ndash;%&gt;

                            &lt;%&ndash;</form>&ndash;%&gt;


                            <form class="settingsprivasy" method="POST" id="formx" action="javascript:void(null);"
                                  onsubmit="call()">
                                <input name="name_playlist" type="text" id="listname"
                                       placeholder=" Enter playlist name">
                                <article>Privasy settings</article>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="1"
                                                                      checked>Only I</label>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="2">Only
                                    My Friends</label>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="3">All
                                    people</label>
                                <input name="description_playlist" type="text" id="description"
                                       placeholder=" Enter description of playlist">
                                <input id="createplaylist" value="create" type="submit">
                            </form>


                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>--%>




    <div id="playlist-modal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="modal-body playlistHeader">
                    <div class="row">
                    <h2>Create playlist</h2>
                    </div>
                </div>
                <div class="conteineraddtrack">
                    <div id="headerforaddplaylist" class="row">
                        <div class="col-md-4">
                            <img id="baseimgplaylist" src="${contextPath}/resources/img/owlchat.png">
                            <form id="formimglist">
                                <input type="file" name="filefoto" id="imgtrack" class="inputfile"/>
                                <label for="imgtrack"> Choose a file</label>
                                <button id="uploadimgtrack" type="button">Upload</button>
                            </form>

                        </div>
                        <div class="col-md-8">
                            <%--<form class="settingsprivasy">--%>

                            <%--</form>--%>


                            <form class="settingsprivasy" method="POST" id="formx" action="javascript:void(null);"
                                  onsubmit="call()">
                                <input name="name_playlist" type="text" id="listname"
                                       placeholder=" Enter playlist name">
                                <article>Privasy settings</article>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="1"
                                                                      checked>Only I</label>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="2">Only
                                    My Friends</label>
                                <label class="checkbox-inline"><input type="radio" name="privacyRadio" value="3">All
                                    people</label>
                                <input name="description_playlist" type="text" id="description"
                                       placeholder=" Enter description of playlist">
                                <input id="createplaylist" value="create" type="submit">
                            </form>


                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->




</div>
</div>

<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/mymusic.js"></script>
</body>
</html>
