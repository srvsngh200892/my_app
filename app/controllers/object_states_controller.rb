class ObjectStatesController < ApplicationController

  before_action :set_search_params, only: [:index]

  def index
    @search_result = SearchResultService.new(set_search_params)
  end

  def new
  end

  def create
    CreateObjectStateService.new(object_state_params).perform
    redirect_to object_states_path
  end

  private

  def object_state_params
    params.require(:file_upload).permit(:csv)
  end

  def set_search_params
    params[:search_data].present? ? params[:search_data].permit(:object_id, :object_type, :timestamp) : {}
  end

end
