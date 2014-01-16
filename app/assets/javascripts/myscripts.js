$("tr[data-link]").click(function() {
  window.location = this.dataset.link
})

$("div[data-link]").click(function() {
  window.location = this.dataset.link
})
