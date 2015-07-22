class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    c = Creature.create(creature_params)
    update_tags c
    redirect_to creatures_path
  end

  def destroy
    @c = Creature.find(params[:id])
    @c.destroy
    redirect_to creatures_path
  end

  def edit
    @creature = Creature.find params[:id]
    @tags = Tag.all
  end

  def show
      @creature = Creature.find params[:id]
  end

  def update
    c = Creature.find params[:id]
    c.update creature_params
    c.tags.clear
    update_tags c
    redirect_to c
  end

  private

  def update_tags creature
    creature_tags = params[:creature][:tag_ids]
    creature_tags.each do |id|
      creature.tags << Tag.find(id) unless id.blank?
    end
  end



  def creature_params
    params.require(:creature).permit(:name,:description)
  end

end
