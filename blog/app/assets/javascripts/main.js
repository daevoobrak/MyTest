$(document).ready(function(){
  $('.emotion').on('click',function(){
    var article_id = $(this).attr('id').split("_")[1];
    var comment_id = $(this).attr('id').split("_")[2];
    var emo = $(this).attr('id').split("_")[0];
    var like="";
    var dislike = "";
    $(this).html('<i class="fa fa-spinner"></i>');
    if(emo == 'like'){
      like = 'like';
    }else{
      dislike = "dislike";
    }

    $.ajax({
      url:'/likes/like',
      data:{like:{like:like,dislike:dislike},article_id:article_id,comment_id:comment_id},
      dataType:"script",
      success: function(result){
        //console.log('hi');
      }
    });
  });
  $("#new_article").on('click',function(){
    $.ajax({
      url:'/articles/new',
      dataType:"script",
      success: function(result){
        console.log('hisss');
      }
    });
  });
});