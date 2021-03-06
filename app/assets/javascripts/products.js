$(document).ready(function () {
  $('#product_ingredient_tokens').tokenInput('/ingredients.json', {
    theme: "facebook",
    queryParam: "ingr",
    prePopulate: $('#product_ingredient_tokens').data('load'),
    hintText: "Type in an ingredient",
    searchingText: "Searching...",
    minChars: 2,
    animateDropdown: true,
    preventDuplicates: true
  })

  $("#product_brand_id").select2({
    theme: "bootstrap",
    placeholder: "Choose brand",
    allowClear: true
  })

  $("#product_subcategory_id").select2({
    theme: "bootstrap",
    placeholder: "Choose category",
    allowClear: true
  })
})
