class CsvWorker
  include Sidekiq::Worker
  include ActiveModel::Model

  def perform(object_states)
    # tranction is used to gurnatee atomic behaviour in db
    # if destroy_all fails it will not commit changes to db
    ActiveRecord::Base.transaction do
      ObjectState.create!(object_states)
    end
  end
end
