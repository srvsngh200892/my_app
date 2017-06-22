class ObjectStatesController < ApplicationController

  before_action :set_search_params, only: [:index]

  def index
    @search_result = SearchResultService.new(set_search_params)
  end

  def new
  end

  #create service object and pass params object to it
  def create
    obj_state = CreateObjectStateService.new(object_state_params)
    if obj_state.valid?
      obj_state.perform
      flash[:success] = "Csv Uploaded successfully!!. It may take some time to reflect. Please Refresh Page."
    else
      flash[:notice] = "Please upload valid csv."
    end
    redirect_to object_states_path
  end

  private

  #check params
  def object_state_params
    params.require(:file_upload).permit(:csv)
  end

  def set_search_params
    return {} unless params[:search_data].present?
    params[:search_data].permit(:object_id, :object_type, :timestamp)
  end

end
