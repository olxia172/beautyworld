$(document).ready(function () {
  $('#product_ingredient_tokens').tokenInput('/ingredients.json', {
    prePopulate: $('#product_ingredient_tokens').data('load'),
    searchingText: "Szukammm",
    minChars: 4
  })
})
