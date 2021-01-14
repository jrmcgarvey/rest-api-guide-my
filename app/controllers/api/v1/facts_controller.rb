class Api::V1::FactsController < ApplicationController
  before_action :set_fact, only: [:show, :update, :destroy]

  # GET /users/:customer_id/facts
  def index
    @user = User.find(params[:user_id])
    render json: @user.facts
  end

  # GET /users/:user_id/fact/:id
  def show
    render json: @fact
  end

  # POST /users/:user_id/facts
  def create
    @fact = Fact.new(fact_params)
    if @fact.save
      render json: @fact, status: 201
    else
      render json: { error:
        "Unable to create fact: #{@fact.errors.full_messages.to_sentence}"},
        status: 400
    end
  end

  # PUT /users/:user_id/facts/:id
  def update
    if @fact.update(fact_params)
      render json: @fact, status: 200
    else
      render json: { error:
        "Unable to update fact: #{@fact.errors.full_messages.to_sentence}"},
        status: 400
    end
  end

  # DELETE /users/:user_id/facts/:id
  def destroy
    @fact.destroy
    render json: { message: 'Fact record successfully deleted.'}, status: 200
  end

  private

  def fact_params
    params.permit(:fact, :likes, :user_id)
  end

  def set_fact
    @fact = Fact.find(params[:id])
  end

end
