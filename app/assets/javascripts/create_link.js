var CreateLink = {
  submit: function() {
    var url = $("input").val();

    $.ajax({
      url: "/links",
      type: "POST",
      dataType: 'json',
      data: { link: { url } },
      success: function(link) {
        $('p.shortened-url').html(link.url)
        $('p.error').html("")
      }, error: function(data) {
        $('p.shortened-url').html("")
        $('p.error').html(data.responseJSON.errors.url)
      }
    });
  }
}