require 'rails_helper'

RSpec.describe SearchResultService, type: :service do

  let(:file) do
  {
    csv: fixture_file_upload('test_file.csv', 'text/csv')
  }
  end

  let(:params) { Hash.new }

  before { CreateObjectStateService.new(file).perform }

  subject(:obejct_state) { SearchResultService.new(params) }

  describe '#search' do
    context 'pass invalild timestamp and get empty hash result' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484731
        }
      end

      it { expect(obejct_state.object_changes).to eq({}) }
    end

    context 'pass valild timestamp and get object changes hash result' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484731481
        }
      end

      it { expect(obejct_state.object_changes).to eq({"status"=>"paid", "customer_name"=>"Jack", "customer_address"=>"Trade St.", "ship_date"=>"2017-01-18", "shipping_provider"=>"DHL"}) }
    end
  end

end
