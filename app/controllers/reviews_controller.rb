class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @idea = Idea.find(params[:idea_id])
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        if @review.save
            redirect_to idea_path(@idea)
          else
            @ideas = @idea.reviews.order(created_at: :desc)
            render 'ideas/show'
          end

    end

    def destroy
        @review = Review.find(params[:id])
        if can?(:crud, @review)
          @review.destroy
          redirect_to idea_path(@review.idea)
        else
        # head will send an empty HTTP response with a particular reponse code
        # in this case :unauthorized code is 401
        # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
          head:unauthorized
        end
    end


    private
  
    def review_params
      params.require(:review).permit(:description)
    end
end
