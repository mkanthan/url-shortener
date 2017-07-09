var CreateLink = {
  submit: function() {
    var url = $("input").val();

    $.ajax({
      url: "/links",
      type: "POST",
      dataType: 'json',
      data: { link: { url } },
      success: function(link) {
        $("#short-url-content").show();
        $("#error-content").hide();
        $('p.shortened-url').html(link.url)
      }, error: function(data) {
        $("#short-url-content").hide();
        $("#error-content").show();
        $('p.error').html(data.responseJSON.errors.url)
      }
    });
  },

  copy: function() {
    var proxyInput = document.createElement("input");
    proxyInput.setAttribute("value", $('p.shortened-url').html());
    document.body.appendChild(proxyInput);
    proxyInput.select();
    document.execCommand("copy");
    document.body.removeChild(proxyInput);
  }
}