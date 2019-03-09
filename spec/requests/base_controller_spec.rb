require 'rails_helper'

describe BaseController, type: :controller do
  describe '#index' do
    subject! { get '/' }

    it {
      expect(response).to be_success
    }
  end
end
