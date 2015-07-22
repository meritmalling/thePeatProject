class TagsController < ApplicationController

def index
  @tags = Tag.all
end

def new

end

def create

end

def destroy

end

def show
  @tag = Tag.find params[:id]
end

end
