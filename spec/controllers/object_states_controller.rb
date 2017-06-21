require 'rails_helper'

RSpec.describe ObjectStatesController, type: :controller do

  describe 'POST #create' do
    context 'upload CSV' do
      before :each do
        file = fixture_file_upload('test_file.csv', 'text/csv')
        post :create, file_upload: { csv: file }
      end
      it { is_expected.to redirect_to(object_states_path) }
    end
  end

end
