require 'rails_helper'

RSpec.describe ObjectState, type: :model do

  before(:all) do
    FactoryGirl.create(:object_state, object_id: 1)
    FactoryGirl.create(:object_state, object_id: 2)
  end

  it { is_expected.to validate_presence_of(:object_id) }
  it { is_expected.to validate_presence_of(:object_type) }
  it { is_expected.to validate_presence_of(:timestamp) }

  describe '.object_option_id' do
    context 'generate list of ids' do
      it { expect(ObjectState.object_id_options.count).to eq(2) }

    end
  end

  describe '.object_product_options' do
    context 'generate list of object type' do
      it { expect(ObjectState.object_product_options.first).to eq('order') }
      it { expect(ObjectState.object_product_options.count).to eq(1) }
    end
  end

end
