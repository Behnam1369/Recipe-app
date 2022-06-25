class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def shopping_list
    sql = 'Select b.name, b.measurement_unit, b.price, sum(a.quantity) as quantity from
      recipy_foods as a
      inner join foods as b on a.food_id = b.id
      inner join recipies as c on a.recipy_id = c.id
      where c.user_id = ' + current_user.id.to_s + '
      group by b.name, b.measurement_unit, b.price
      '
    @foods = ActiveRecord::Base.connection.execute(sql)
    # @foods = ('select * from foods')
    # RecipyFood.joins(:food).where(recipy: current_user.recipies).includes(:food).group('foods.name')
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      @food.user = current_user
      if @food.save
        format.html { redirect_to '/foods', notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
