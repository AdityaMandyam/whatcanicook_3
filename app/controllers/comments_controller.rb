class CommentsController < ApplicationController
  def create
    @recipe = set_recipe
    @comment = @recipe.comments.create(comment_params)
    if @comment.save
      redirect_to @recipe
    else
      flash.now[:danger] = "error"
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:description)
  end
end
