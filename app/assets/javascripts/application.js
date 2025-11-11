// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Se o bootstrap for via Sprockets (não via importmap)
//= require bootstrap
//= require sidebar

document.addEventListener("turbolinks:load", () => {
  if (window.createIcons) {
    window.createIcons({
      icons: {
        LayoutDashboard,
        Settings,
        Building2,
        UserCheck,
        MessageSquare,
        CreditCard,
        LogOut,
        Building,
        Menu,
        X,
      },
    })
  }
});
