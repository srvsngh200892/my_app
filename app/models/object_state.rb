class ObjectState < ActiveRecord::Base

  validates :object_id, :object_type, :timestamp, presence: true

  def self.object_product_options
    pluck(:object_type).uniq
  end

  def self.object_id_options
    pluck(:object_id).uniq
  end

end
