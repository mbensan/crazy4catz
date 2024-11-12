class CommentsController < ApplicationController
  def create
    # @comment = Comment.new(comment_params)
    # if @comment.save
    #   format.html { redirect_to publications_path, notice: "Comentario creado" }
    # else
    #   format.html { redirect_to publications_path, notice: "Comentario no creado" }
    # end
    content = params[:content]
    publication_id = params[:publication_id]
    @comment
    if current_user != nil
      @comment = Comment.create(content: content, publication_id: publication_id, user: current_user.name)
    else
      @comment = Comment.create(content: content, publication_id: publication_id, user: 'Visita')
    end

    redirect_to publications_path, notice: "Comentario creado"
  end
end
