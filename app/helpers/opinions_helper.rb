module OpinionsHelper
  def show_author(opinion)
    User.find(opinion.user_id).email
  end

  def author(opinion)
    opinion.user_id == current_user.id if current_user
  end

  def current_user_opinion(product)
    Opinion.where(user_id: current_user.id, product_id: product.id)
  end
end
