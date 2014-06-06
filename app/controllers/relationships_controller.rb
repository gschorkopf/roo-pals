class RelationshipsController < ApplicationController
  def create
    first_name, last_name = relationship_params[:follower_id].split(" ")
    user = User.find_by(first_name: first_name, last_name: last_name)

    if user.present?
      Relationship.create(followed_id: user.id, follower_id: current_user.id)
    end
    flash[:notice] = "You followed #{user.decorate.full_name}"
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id]).decorate
    relationship = Relationship.find_by(followed_id: user.id, follower_id: current_user.id)
    relationship.destroy
    flash[:notice] = "You unfollowed #{user.full_name}"
    redirect_to root_path
  end

  private

  def relationship_params
    params.require(:relationship)
      .permit(:follower_id)
  end
end
