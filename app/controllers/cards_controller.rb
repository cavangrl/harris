class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]
  before_action :set_project, only: [:index, :show, :new, :create, :update]
  before_action :authenticate_user!

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new(card_params)
    @card.project = @project
    max = @project.cards.order(position: :asc).last.position
    @card.position = max + 1
    @card.body = "Something brilliant goes here..."

    respond_to do |format|
      if @card.save
        format.html { redirect_to project_path(@project), notice: 'Card was successfully created.' }
        format.json { render :create }
        format.js
      else
        format.html { render :new }
        format.json { respond_with_bip(@card) }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to project_path(@project), notice: 'Card was successfully updated.' }
        format.json { respond_with_bip(@card) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@card) }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.js { head :no_content }
    end
  end

  def sort
    params[:card].each_with_index do |id, index|
      Card.find(id).update position: (index+1)
    end
    render nothing: true
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def card_params
      params.require(:card).permit(:title, :body, :order, :user_id)
    end
end
