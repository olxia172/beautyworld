$(document).ready(function () {
  // console.log('Strona się załadowała, podpinam input, które są na stronie')
  $('.product_sub_products_ingredient_tokens input').each(function() {
    var ingredientsTokenInput = $(this)
    // console.log('Podpinam po załadowaniu', ingredientsTokenInput)
    ingredientsTokenInput.tokenInput('/ingredients.json', {
      theme: "facebook",
      queryParam: "ingr",
      prePopulate: ingredientsTokenInput.data('load'),
      hintText: "Type in an ingredient",
      searchingText: "Searching...",
      minChars: 2,
      animateDropdown: true,
      preventDuplicates: true
    })
  })

  // console.log('Rozpoczynam nasłuch na dodawanie nowych subproduct')
  $('#sub_products').on('cocoon:after-insert', function(e, insertedSubProduct) {
    var ingredientsTokenInput = insertedSubProduct.find('.product_sub_products_ingredient_tokens input')
    // console.log('Podpinam po dodaniu nowego subproduktu', ingredientsTokenInput)
    ingredientsTokenInput.tokenInput('/ingredients.json', {
      theme: "facebook",
      queryParam: "ingr",
      prePopulate: ingredientsTokenInput.data('load'),
      hintText: "Type in an ingredient",
      searchingText: "Searching...",
      minChars: 2,
      animateDropdown: true,
      preventDuplicates: true
    })
  })
})
