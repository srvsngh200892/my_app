# == Schema Information
#
# Table name: object_states
#
#  id                              :integer          not null, primary key
#  object_id                       :integer
#  object_type                     :string(255)
#  object_changes                  :json
#  timestamp                       :binint
#  created_at                      :datetime
#  updated_at                      :datetime
#
# Indexes
#
#  index_object_states_on_object_states_object_changes  (object_changes, object_type)
#

class ObjectState < ActiveRecord::Base

  validates :object_id, :object_type, :timestamp, presence: true

  def self.object_product_options
    pluck(:object_type).uniq
  end

  def self.object_id_options
    pluck(:object_id).uniq
  end

end
