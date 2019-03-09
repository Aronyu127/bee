require 'rails_helper'

describe BaseController, type: :request do
  describe '#index' do
    subject! { get '/' }

    it {
      expect(response).to be_success
    }

    context 'vip user can see vip price' do
      let!(:product) { create :product }
      before {
        signin_vip_user
        follow_redirect!
      }
      it {
        expect(response).to be_success
        expect(response.body).to match('Vip price')
      }
    end
  end
end
