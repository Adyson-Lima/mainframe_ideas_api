class Api::V1::IdeasController < ApplicationController

  before_action :set_idea, only: %i[show] #show update destroy

  def index
    @ideas = Idea.all 
    render json: @ideas
  end

  def show
    render json: @idea
  end

private

def set_idea
  @idea = Idea.find(params[:id])
end

def idea_params
  params.require(:idea).permit(:name, description)
end

end