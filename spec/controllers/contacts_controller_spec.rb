require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_params) do
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      company: Faker::Company.name,
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      group_id: Group.create(name: "Client")
    }
  end

  let(:invalid_params) do
    {
      name: nil,
      email: Faker::Internet.email,
      company: Faker::Company.name,
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      group_id: nil
    }
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'assigns new contact' do
      get :new, params: {}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    before do
      @contact = FactoryBot.create(:contact)
    end
    it 'retrieves contact for editing' do
      get :edit, params: { id: @contact.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new contact' do
      expect do
        post :create, params: { contact: valid_params }
      end.to change(Contact, :count).by(1)
    end

    it 'fails to create new contact' do
      expect do
        post :create, params: { contact: invalid_params }
      end.to change(Contact, :count).by(0)
    end
  end

  describe 'PUT #update' do
    let(:new_params) do
      {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        company: Faker::Company.name,
        phone: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.street_address,
        group_id: Group.all.find_by(name: "Family").id
      }
    end
    it 'updates a valid record' do
      contact = FactoryBot.create(:contact)
      put :update, params: { id: contact.to_param, contact: new_params }
      contact.reload
      expect(contact.updated_at).to be > contact.created_at
    end

    it 'rerenders :edit due to invalid params' do
      contact = FactoryBot.create(:contact)
      put :update, params: { id: contact.to_param, contact: invalid_params }
      expect(response).to render_template(:edit)
    end
  end
end
