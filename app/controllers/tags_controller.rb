class TagsController < ApplicationController

def index
  @tags = Tag.all
end

def new
  @tag = Tag.new
end

def create
  t = Tag.create(tag_params)
  redirect_to creatures_path
end

def edit
  @tag = Tag.find params[:id]
end

def destroy
   t = Tag.find(params[:id])
   assoc = t.creatures.length
  if t.creatures.empty?
    t.destroy
  else
    flash[:danger] = "You can not delete this tag because #{assoc} creatures are associated with it."
  end
  redirect_to tags_path
end

def show
  @tag = Tag.find params[:id]
end

def update
  t = Tag.find params[:id]
  t.update tag_params
  redirect_to tags_path
end

private

def tag_params
   params.require(:tag).permit(:name)
end

end


