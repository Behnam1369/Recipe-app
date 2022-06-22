class RecipiesController < ApplicationController
  def index
    @recipies = current_user.recipies
  end

  def public_recipies
    @recipies = Recipy.where(public: true).order(created_at: :desc)
  end

  def show
    @recipy = Recipy.find(params[:id])
  end

  def new
    @recipy = Recipy.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    recipy = Recipy.new(recipy_params)
    recipy.user = current_user
    respond_to do |format|
      format.html do
        if recipy.save
          flash[:success] = 'Recipy created!'
        else
          render :new
          flash[:error] = 'Something went wrong :('
        end
        redirect_to action: :index
      end
    end
  end

  def destroy
    id = params[:id]
    Recipy.destroy(id)
    flash[:success] = 'Deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def recipy_params
    response = params.require(:recipy).permit(:name, :preparation_time, :cooking_time, :description, :public)
    response[:preparation_time] = response[:preparation_time].to_i
    response[:cooking_time] = response[:cooking_time].to_i
    response
  end
end
