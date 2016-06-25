class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = weekday.products.group_by(&:category)
  end

  def new
    @product = weekday.products.build
  end

  def create
    @product = weekday.products.build(product_params)

    if @product.save
      flash[:success] = 'Product was created.'
      redirect_to weekday_products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product was updated.'
      redirect_to weekday_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to weekday_products_path, notice: 'Product was deleted'
  end

  private

  def weekday
    @weekday ||= Weekday.find(params[:weekday_id])
  end
  helper_method :weekday

  def product_params
    params.require(:product).permit(:title, :price, :category_id)
  end

  def find_product
    @product = weekday.products.find(params[:id])
  end
end
