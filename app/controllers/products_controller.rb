class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    # current_user
    @tacos = Product.all
    if params[:sort] && params[:sort_order]
      @tacos = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @tacos = Product.where("price < ?", 50)
    end
    if params[:category]
      @tacos = Category.find_by(name: params[:category]).products
    end
    render :index
  end

  def show
    if params[:id] == "random"
      tacos = Product.all
      @taco = tacos.sample
    else
      @taco = Product.find_by(id: params[:id])
    end
    render :show
  end

  def new
    @taco = Product.new
    @suppliers = Supplier.where(active: true)
  end

  def create
    @taco = Product.new(
      id: params[:id],
      name: params[:name],
      price: params[:price],
      description: params[:description],
      rating: params[:rating],
      user_id: current_user.id,
      supplier_id: params[:supplier][:supplier_id]
    )
    if @taco.save
      flash[:success] = "Taco made!"
      redirect_to "/products/#{@taco.id}"
    else
      render :new
    end
  end

  def edit
    @taco = Product.find_by(id: params[:id])
    render :edit
  end

  def update
    @taco = Product.find_by(id: params[:id])
    if @taco.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
      flash[:success] = "This taco has been updated!"
      redirect_to "/products/#{@taco.id}"
    else
      render :edit
    end
  end

  def destroy
    @taco = Product.find_by(id: params[:id])
    @taco.destroy
    flash[:warning] = "Taco destroyed!"
    redirect_to "/"
  end

  def search
    search_term = params[:input_search]
    @tacos = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

end
