require 'rails_helper'

describe Admin::BaseController, type: :request do

  describe '#index' do
    context 'success' do
      before { signin_user(admin: true) }
      subject! { get '/admin' }

      it { expect(response).to be_success }
    end

    context 'not admin user' do
      subject! { get '/admin' }

      it { expect(response).to be_redirect }
    end
  end
end
