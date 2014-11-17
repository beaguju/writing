class StoriesController < ApplicationController
  def index
  end

  def show
  	@story = Story.find(params[:id])
  end

  def new
  	@story = Story.new
  end

  def edit
  end

  def create
  	@story = Story.create story_params

  	if @story.save
			flash[:notice] = "Has creado tu localización correctamente"
			redirect_to @story
		else
			flash[:error] = "No se ha podido crear historia. Revisa los campos"
			render 'new'
		end	
  end

  def update
  end

  def delete
  end

protected
  def story_params
  	params.require(:story).permit(:title, :text)
  end
end
