function disableAttachments() {
  $(document).on("trix-file-accept", function(event) {
    event.preventDefault();
  });
}

function main() {
  disableAttachments();
}

$(document).on("turbolinks:load", function () {
  main();
});