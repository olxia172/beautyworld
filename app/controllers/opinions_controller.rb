class OpinionsController < ApplicationController

  def new
    @opinion = Opinion.new(opinion_params)
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)

    if @opinion.save
      redirect_to
    else

    end
  end

  def opinion_params
    params.require(:opinion).permit(:title, :body)
  end
end
