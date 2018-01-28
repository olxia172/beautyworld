$(document).ready(function () {
  $('#product_brand_tokens').tokenInput('/brands.json', {
    theme: 'facebook',
    queryParam: "brand",
    prePopulate: $('#product_brand_tokens').data('load')
  })
})


$(document).ready(function () {
  $('#product_ingredient_tokens').tokenInput('/ingredients.json', {
    theme: "facebook",
    queryParam: "ingr",
    prePopulate: $('#product_ingredient_tokens').data('load'),
    hintText: "Type in an ingredient",
    searchingText: "Searching...",
    minChars: 4,
    animateDropdown: true,
    preventDuplicates: true
  })
})
