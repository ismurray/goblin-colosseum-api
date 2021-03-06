class PurchasesController < ProtectedController
  before_action :set_purchase, only: [:show, :update, :destroy]

  # GET /purchases
  def index
    @purchases = current_user.purchases.all

    render json: @purchases
  end

  # GET /purchases/1
  def show
    render json: @purchase
  end

  # POST /purchases
  def create
    @item_id = Item.find_by(name: purchase_params[:item_name])[:id]
    @purchase = current_user.purchases.build(item_id: @item_id)
    if @purchase.item.cost > current_user.gold
      render json: 'INSUFFICIENT FUNDS'
    elsif @purchase.save
      current_user.gold -= @purchase.item.cost
      current_user.save
      render json: @purchase, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = current_user.purchases.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :item_id, :item_name)
    end
end
