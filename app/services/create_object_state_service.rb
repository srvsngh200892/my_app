class CreateObjectStateService

  attr_reader :csv

  def initialize(params = {})
    @csv ||= params[:csv]
  end

  # convert array of hashes
  def hash_obj
    CSV.foreach(csv.path, headers: true).entries.map(&:to_hash)
  end

  #save data through sidekiq as it may take log time to upload (depend on size so please form the job thorugh backgroundj_ob)
  def perform
    CsvImportWorker.perform_async(hash_obj)
  end


end
