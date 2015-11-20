class Api::HistoriesController < ApplicationController
  def index
    @histories = History.all
    render json: @histories
  end
end
