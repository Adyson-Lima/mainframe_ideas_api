class Api::V1::IdeasController < ApplicationController

  #before_action :set_idea, only: %i[] #show update destroy

  def index
    @ideas = Idea.all 
    render json: @ideas
  end

private

def set_idea
  @idea = Idea.find(params[:id])
end

def idea_params
  params.require(:idea).permit(:name, description)
end

end