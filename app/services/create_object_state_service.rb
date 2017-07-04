class CreateObjectStateService

  attr_reader :csv

  def initialize(params = {})
    @csv ||= params[:csv]
  end

   #read csv in chuck dont load big csv in memory
  def perform
    return unless valid?
    options = {:chunk_size => 100}
    SmarterCSV.process(csv.path, options) do |chunk|
      CsvWorker.perform_async(chunk)
    end
  end

  def valid?
    headers = CSV.open(csv.path, &:readline)
    headers.present? ? (headers & ['object_id', 'object_type', 'timestamp', 'object_changes']).present? : false
  end

end
