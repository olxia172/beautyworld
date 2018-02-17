$(document).ready(function () {
  $('.product_sub_products_ingredient_tokens input').each(function() {
    $(this).tokenInput('/ingredients.json', {
      theme: "facebook",
      queryParam: "ingr",
      prePopulate: $(this).data('load'),
      hintText: "Type in an ingredient",
      searchingText: "Searching...",
      minChars: 2,
      animateDropdown: true,
      preventDuplicates: true
    })
  })
})
