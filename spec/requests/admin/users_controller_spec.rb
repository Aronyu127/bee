require 'rails_helper'

describe Admin::UsersController, type: :request do
  before { signin_user(admin: true) }
  describe '#index' do
    subject! { get '/admin/users' }

    it {
      expect(response).to be_success
      expect(response.body).to match(current_user.email)
    }
  end

  describe '#update' do
    let(:user) { create :user }
    subject { put "/admin/users/#{user.id}", params: { user: { admin: true } } }

    it {
      expect { subject }.to change { user.reload.admin }
      expect(response).to be_redirect
      expect(user.admin).to eq(true)
    }
  end
end
