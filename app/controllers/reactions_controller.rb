class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    rtype = params[:rtype]
    publication_id = params[:publication_id]
    publication = Publication.find(publication_id)
    @reaction = publication.reactions.build(rtype: rtype)
    @reaction.user = current_user
    respond_to do |format|
      if @reaction.save
        format.html { redirect_to publication_path(publication_id), notice: "Reaction was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { redirect_to publication_path(publication_id), notice: "Reaction was NOT created." }
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    rtype = params[:rtype]
    publication_id = params[:publication_id]
    publication = Publication.find(publication_id)

    @reactions = Reaction.where(rtype: rtype, publication: publication, user: current_user)
    if @reactions.empty?
      respond_to do |format|
        format.html { redirect_to publication_path(publication_id), notice: "Reaction not found." }
        format.json { render json: {}, status: :not_found }
      end
    else
      @reaction = @reactions.first
      @reaction.destroy
      respond_to do |format|
        format.html { redirect_to publication_path(publication_id), notice: "Reaction was successfully deleted." }
        format.json { head :no_content }
      end
    end
  end
end
