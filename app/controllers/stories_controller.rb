class StoriesController < ApplicationController
  def index
    @stories = Story.root
  end

  def show
  	@story = Story.find(params[:id])
  end

  def new
  	@story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def add_continuation
    @parent = Story.find(params[:id])
    @story = @parent.children.build story_params

    if @story.save
      flash[:notice] = "Has creado tu historia correctamente"
      redirect_to @story
    else
      flash[:error] = "No se ha podido crear tu historia. Revisa los campos"
      redirect_to @parent
    end 
  end

  def create
  	@story = Story.new story_params

  	if @story.save
			flash[:notice] = "Has creado tu historia correctamente"
			redirect_to @story
		else
			flash[:error] = "No se ha podido crear tu historia. Revisa los campos"
			render 'new'
		end	
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
  end

  def delete
    @story = Story.destroy(params[:id])
  end

protected
  def story_params
  	params.require(:story).permit(:title, :text)
  end
end
