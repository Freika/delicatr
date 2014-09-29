$(document).ready(function(){
  $('.post-body').readmore({
    speed: 100,
    maxHeight: 600,
    moreLink: '<a class="btn btn-success" href="#">Развернуть пост</a>',
    lessLink: '<a class="btn btn-success" href="#">Свернуть пост</a>'
  });
  $('.container img').addClass("img-responsive")
});