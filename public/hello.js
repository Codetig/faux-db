$(document).ready(function(){
  var userAdded = false;
  function homePage(){
    $.getJSON("http://localhost:4567/", function(data){
    data.forEach(function(n){
    $('ul').append("<li>" + n.first +" " +n.last + "</li><a href='/users/" + n.id + "'");
    });

  });
  }
  $('#add-form').hide();

  if(userAdded){
    homePage();
  }

  $('#add-user').on('click', function(e){
    e.preventDefault();
    $('#add-form').show();
    // $.getJSON(e.target.href, function(data){
    //   if(data.typeOf ==="Array" && data !== undefined){
    //     homePage();
    //   }  
    // });
  });

  $('form-a').on('submit',function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: "http://localhost:4567/users",
      datatype: "JSON",
      success: function(data){
        data.forEach(function(n){
        $('ul').append("<li>" + n.first +" " +n.last + "</li><a href='/users/" + n.id + "'");
        });
      }
    });
    $('#add-form').hide();
  });

  console.log("sup!");
});