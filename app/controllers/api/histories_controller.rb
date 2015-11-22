class Api::HistoriesController < ApplicationController
  def index
    @histories = History.all
    render json: @histories, status: 200
  end
end
