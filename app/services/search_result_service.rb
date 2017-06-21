class SearchResultService

  attr_accessor :object_id, :object_type, :timestamp

  def initialize(params = {})
    @object_id ||= params[:object_id]
    @object_type ||= params[:object_type]
    @timestamp ||= params[:timestamp]
  end

  # Returns ActiveRecord::Relation based on search params
  def search_result
    ObjectState.where("object_id = ? AND object_type = ? AND timestamp <= ?", object_id, object_type, timestamp).order(:timestamp)
  end

  # Merges all object_changes at a particular timestamp
  def object_changes
    object_changes = search_result.map { |obj| obj.object_changes }
    object_changes.reduce(&:merge) || {}
  end

end
