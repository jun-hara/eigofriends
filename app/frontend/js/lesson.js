function enableSectionToggle() {
  const section_toggle_links = $(".js-section-toggle");
  section_toggle_links.on( "click", function() {
    const current_active_section = $(".active-section");
    current_active_section.addClass("d-none");

    const new_active_section = $(this).attr("data-section-header").
      replaceAll(" ","-"); // headers with spaces won't be selected properly
    $("." + new_active_section).removeClass("d-none").addClass("active-section");
  });
}

function setDefaultActiveSection() {
  // Since all sections are hidden by default
  // we want to set the active section (to overview)
  if ($(".active-section").length === 0) {
    $(".Overview" ).removeClass("d-none").addClass("active-section");
  }
}

function passwordVisibilityToggle() {
  const password_visibility_icons = $(".js-toggle-password");
  password_visibility_icons.on("click", function() {    
    const password = $("input[placeholder='password']");
    const attr_type = (password.attr("type") === "password" ? "text" : "password");
    
    password.attr("type", attr_type);
    password_visibility_icons.toggleClass("fa-eye-slash");
  })
}

function autoHideAlert() {
  if ($(".alert").length > 0) {
    setTimeout(function() {
      $(".alert").addClass("d-none")
    }, 3000);
  }
}

// This may not be the best approach to implementing replies
function tagActiveCommentBtn() {
  const reply_btns = $(".js-comment-btn");
  reply_btns.on("click", function() {
    const active_btns = $(this);
    active_btns.attr("id", "active-reply-btn").removeClass("js-comment-btn");

    const parentDiv = $(this).parents("div").first();
    parentDiv.addClass("comment-parent-div");

    const unused_btns = $(".js-comment-btn");
    unused_btns.addClass("d-none");
  })
}


function main() {
  enableSectionToggle();
  setDefaultActiveSection();
  passwordVisibilityToggle();
  autoHideAlert();
  tagActiveCommentBtn();
}


$(document).on("turbolinks:load", function () {
  main();
});