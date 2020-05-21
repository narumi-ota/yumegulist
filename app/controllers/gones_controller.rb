class GonesController < ApplicationController
    before_action :set_variables

  def gone
    gone = current_user.gones.new(post_id: @post.id)
    gone.save
  end
  
  def ungone
    gone = current_user.gones.find_by(post_id: @post.id)
    gone.destroy
  end
  
  private

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#gone-link-#{@post.id}"
  end
end