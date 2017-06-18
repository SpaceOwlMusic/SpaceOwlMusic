/**
 * Created by Susha on 02.06.17.
 */
var imgstop = document.getElementsByClassName('imgplay'),
    imgtracks = document.getElementsByClassName('imgtracks');
console.log(imgstop);
console.log(imgtracks);
$(document).ready(function () {
    for (var i=0; i<imgtracks.length; i++){
            $(imgtracks[i]).click(function () {
                    var $this = $(this),
                        audio = $this.siblings('audio')[0],
                        istop = $this.children('div')[0];
                            if (audio.paused === false) {
                                audio.pause();
                                istop.style.background = "url('resources/img/Topplaylist/icon.png') no-repeat ";
                                istop.style.position = 'absolute';
                                istop.style.top = '45' + '%';
                                istop.style.left = '37' + '%';
                                istop.style.width = '64' + 'px';
                                istop.style.height = '64' + 'px';
                                // audio.currentTime = 0;
                                $this.removeClass('playing');
                            }
                            //}
                            else {
                                audio.play();
                                istop.style.background = "url('resources/img/Topplaylist/stop.png')no-repeat ";
                                $this.addClass('playing');
                                istop.style.position = 'absolute';
                                istop.style.top = '45' + '%';
                                istop.style.left = '37' + '%';
                                istop.style.width = '64' + 'px';
                                istop.style.height = '64' + 'px';
                            }
            });
    }

});

document.addEventListener('play', function(e){
    var audios = document.getElementsByTagName('audio');
    for(var i = 0, len = audios.length; i < len;i++){
        if(audios[i] != e.target){
            audios[i].pause();
        }
    }
}, true);