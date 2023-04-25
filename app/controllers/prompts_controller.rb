class PromptsController < ApplicationController
  def index
    if params[:query].present?
      @prompts = Prompt.search(params[:query])
    else
      @prompts = []
    end
  end
end
