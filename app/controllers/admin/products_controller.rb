module Admin
  class ProductsController < BaseController
    before_action :product, except: [:index]

    def index
      @products = Product.all.order('id DESC').page(params[:page]).per(30)
    end

    def new
      @product.pics.build
    end

    def create
      if @product.save
        redirect_to admin_products_path, flash: { success: 'product create success' }
      else
        flash.now[:error] = @product.errors.full_messages
        render :new
      end
    end

    def edit
      @product.pics.build
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, flash: { success: 'product update success' }
      else
        flash.now[:error] = @product.errors.full_messages
        render :edit
      end
    end

    def destroy
      if @product.destroy
        redirect_to admin_products_path, flash: { success: 'product delete success' }
      else
        flash.now[:error] = @product.errors.full_messages
        render :index
      end
    end

    private

    def product
      @product ||= params[:id] ? Product.find(params[:id]) : Product.new(product_params)
    end

    def product_params
      params.fetch(:product, {}).permit(:name, :description, :price, :vip_price, pics_attributes: [:file, :_destroy, :id])
    end
  end
end
