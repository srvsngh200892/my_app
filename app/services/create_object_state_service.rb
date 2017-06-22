class CreateObjectStateService

  attr_reader :csv

  def initialize(params = {})
    @csv ||= params[:csv]
  end

  # convert array of hashes
  def hash_obj
    return unless valid?
    CSV.foreach(csv.path, headers: true).entries.map(&:to_hash)
  end

  #save data through sidekiq as it may take log time to upload (depend on size so please form the job thorugh backgroundj_ob)
  def perform
    CsvWorker.perform_async(hash_obj)
  end

  def valid?
    headers = CSV.open(csv.path, &:readline)
    headers.present? ? (headers & ['object_id', 'object_type', 'timestamp', 'object_changes']).present? : false
  end


end
