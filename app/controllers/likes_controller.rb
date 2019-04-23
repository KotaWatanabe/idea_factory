class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @idea = Idea.find params[:idea_id]
        @like = Like.new(user: current_user, idea: @idea)
        
        unless can?(:like, @idea)
          flash[:danger] = "That's a bit narcissistic..."
          return redirect_to root_path
        end
  
        if @like.save
          flash[:success] = "Question Liked!"
        end
    
        redirect_to root_path
    end
    
      def destroy
        idea = Idea.find params[:idea_id]
        like = Like.find params[:id]
        
        like.destroy
    
        flash[:success] = "Question Unliked!"
        redirect_to root_path
      end
end
