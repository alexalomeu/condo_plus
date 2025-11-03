document.addEventListener("DOMContentLoaded", () => {
  const toggleButton = document.getElementById("toggleSidebar");
  const sidebar = document.getElementById("sidebar");

  toggleButton?.addEventListener("click", () => {
    const expanded = sidebar.classList.toggle("expanded");

    if (expanded) {
      sidebar.style.width = "16rem";
      document.querySelectorAll(".sidebar-expanded").forEach(el => el.classList.remove("d-none"));
    } else {
      sidebar.style.width = "4rem";
      document.querySelectorAll(".sidebar-expanded").forEach(el => el.classList.add("d-none"));
    }
  });
});
