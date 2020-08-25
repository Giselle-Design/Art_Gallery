class LikesController < ApplicationController

      before_action :authenticate_user!, only: [:create, :destroy]
    def create 
       art = Art.find params[:art_id]
       like = Like.new(art: art, user: current_user)
       if !can?(:like, art)
           flash[:danger] = "You can't like your own art"
       elsif like.save 
           flash[:success] = 'Art Liked'
       else
           flash[:danger] = like.errors.full_messages.join(', ')
       end

    redirect_to art_path(art)
    end

    def destroy 
        # like = Like.find params[:id]. with this way a user is able to search all likes
        # this way user can only search his/her own likes
        like = current_user.likes.find params[:id] 
        if !can?(:destroy, like)
            flash[:warning] = "You can't destroy a like you don't own"
        elsif like.destroy 
            flash[:success] = "Art Unliked"
        else 
            flash[:warning] = "Couldn't Unlike the Art"
        end 

        redirect_to art_path(like.art)
    end


end
