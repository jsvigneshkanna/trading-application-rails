
class OrdersController < ApplicationController
    before_action :get_open_orders, only: [:show]
    before_action :get_order_detail, only: [:update, :destroy]

    rescue_from ActiveRecord::RecordNotFound do
        render json: {error: "Order with ID: #{params[:id]} not found"}, status: :not_found
    end

    def index
        render json: OrderBook.all
    end
    
    # POST /orders
    def create
        @new_order = OrderBook.new(order_params)
        if @new_order.save
            render json: @new_order, status: :created
        else
            render json: {errors: @new_order.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # GET /orders/:order_status
    def show
        puts "Open order: #{@open_orders}"
        render json: @open_orders
    end

    # PUT /orders/:id
    def update
        if @order_detail.update(order_update_params)
            render json: @order_detail
        else
            render json: {errors: @order_detail.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # DELETE /orders/:id
    def destroy
        @order_detail.destroy
        render json: {message: "Order ID: #{params[:id]} successfully deleted.."}
    end

    private
        def get_open_orders
            @open_orders = OrderBook.where(status: params[:id])
        end
        
        def get_order_detail
            @order_detail = OrderBook.find(params[:id])
        end

        def order_params
            params.permit(:instrument_name, :quantity, :order_type)
        end

        def order_update_params
            params.permit(:status)
        end
    end
