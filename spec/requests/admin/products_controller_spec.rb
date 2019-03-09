require 'rails_helper'

describe Admin::ProductsController, type: :request do
  before { signin_user(admin: true) }
  let!(:product) { create :product }
  let(:params) { { product: { name: 'new product', description: 'new description', price: 100, vip_price: 90 } } } 
  let(:file) { File.open(Rails.root.join('spec', 'fixtures', ['product_pic.jpg', 'product_pic1.jpg', 'product_pic2.jpg'].sample)) }
  describe '#index' do
    subject! { get '/admin/products' }

    it {
      expect(response).to be_success
      expect(response.body).to match(product.name)
    }
  end

  describe '#new' do
    subject! { get '/admin/products/new' }
    it { expect(response).to be_success }
  end

  describe '#show' do
    subject! { get "/admin/products/#{product.id}" }
    it {
      expect(response).to be_success
      expect(response.body).to match(product.name)
    }
  end

  describe '#edit' do
    subject! { get "/admin/products/#{product.id}/edit" }

    it {
      expect(response).to be_success
      expect(response.body).to match(product.name)
    }
  end

  describe '#update' do
    context 'success' do
      subject { put "/admin/products/#{product.id}", params: params }

      it {
        expect { subject }.to change { product.reload.name }
        expect(product.price).to eq(params[:product][:price])
        expect(product.vip_price).to eq(params[:product][:vip_price])
        expect(response).to be_redirect
      }
    end

    context 'delete pic' do
      let!(:pic) { create :pic, item: product }
      let(:pic_attributes) { { product: { pics_attributes: {'0' => { _destroy: true, id: pic.id } } } } }
      subject { put "/admin/products/#{product.id}", params: params.deep_merge(pic_attributes) }

      it {
        expect { subject }.to change { product.pics.reload.count }.by(-1)
        expect(product.reload.price).to eq(params[:product][:price])
        expect(product.vip_price).to eq(params[:product][:vip_price])
        expect(response).to be_redirect
      }
    end

    context 'add pic' do
      let!(:pic) { create :pic, item: product }
      let(:pic_attributes) { { product: { pics_attributes: {'0' => { file: file } } } } }
      subject { put "/admin/products/#{product.id}", params: params.deep_merge(pic_attributes) }

      it {
        expect { subject }.to change { product.pics.reload.count }.by(1)
        expect(product.reload.price).to eq(params[:product][:price])
        expect(product.vip_price).to eq(params[:product][:vip_price])
        expect(response).to be_redirect
      }
    end
  end

  describe '#create' do
    context 'success' do
      subject { post "/admin/products", params: params }

      it {
        expect { subject }.to change { Product.count }.by(1)
        product = Product.last
        expect(product.reload.price).to eq(params[:product][:price])
        expect(product.vip_price).to eq(params[:product][:vip_price])
        expect(response).to be_redirect
      }
    end

    context 'add pic' do
      let!(:pic) { create :pic, item: product }
      let(:pic_attributes) { { product: { pics_attributes: {'0' => { file: file } } } } }
      subject { post "/admin/products", params: params.deep_merge(pic_attributes) }

      it {
        expect { subject }.to change { Product.count }.by(1)
        product = Product.last
        expect(product.pics.count).to eq(1)
        expect(product.reload.price).to eq(params[:product][:price])
        expect(product.vip_price).to eq(params[:product][:vip_price])
        expect(response).to be_redirect
      }
    end
  end
end
