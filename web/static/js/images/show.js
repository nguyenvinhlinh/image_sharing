var Image = {
  initial_image_show_page: function(){
    var clipboard = new Clipboard("button[for='copy-clipboard']");
    clipboard.on('success', function(e) {
      $(".image-container").notify("Copied", {
        className: "success",
        position: 'bottom right'
      });
    });
  }
}

module.exports = {
  Image: Image
}
