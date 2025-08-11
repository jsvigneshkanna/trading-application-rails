
class PricesController < ApplicationController
    before_action :get_instrument_detail, only: [:show, :update]

    # GET /prices
    def index
        render json: CryptoPrice.all
    end
    
    # GET /prices/:instrument_name
    def show
        render json: @instrument_detail
    end
    
    # UPDATE/PUT /prices/:instument_name
    def update
        if @instrument_detail.nil?
          render json: { error: "Instrument not found" }, status: :not_found
        elsif @instrument_detail.update(instrument_params)
          render json: @instrument_detail
        else
          render json: @instrument_detail.errors, status: :unprocessable_entity
        end
      end

    private
        def get_instrument_detail
            @instrument_detail = CryptoPrice.where(instrument_name: params[:id]).order(timestamp: :desc).first
        end

        def instrument_params
            params.permit(:price)
        end
    end
