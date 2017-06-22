class CsvWorker
  include Sidekiq::Worker
  include ActiveModel::Model

  def perform(object_states)
    ActiveRecord::Base.transaction do
      delete_records!
      ObjectState.create!(object_states)
    end
  end

  private

  def delete_records!
    ObjectState.destroy_all
  end

end
