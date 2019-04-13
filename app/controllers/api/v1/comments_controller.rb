module Api::V1
  class CommentsController < ApplicationController

    before_action :get_comment, only: [:update, :destroy]

    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: CommentSerializer.new(comment).serialized_json, status: 200
      else
        render json: { errors: comment.errors }, status: 422
      end
    end

    def update
      if @comment.update(comment_params)
        render json: CommentSerializer.new(@comment).serialized_json, status: 200
      else
        render json: { errors: @comment.errors }, status: 422
      end
    end

    def destroy
      @comment.destroy
      head :ok
    end

    private

    def get_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :observation_id)
    end

  end
end
