require 'rails_helper'

RSpec.describe "contacts/index.html.erb", type: :view do

  context 'No contacts' do
    before do
      @contacts = Contact.destroy_all
      @contacts = Contact.all.page(params[:page])
    end
    it "renders the word Record not found" do
      render :template => "contacts/index"
      expect(rendered).to match /Record not found/
    end
  end

  context 'All Contacts' do
    before do
      13.times do
        FactoryBot.create(:contact)
      end
      @contacts = Contact.all.page(params[:page])
    end
    it 'renders the symbol @' do
      render :template => 'contacts/index'
      expect(rendered).to match /@/
    end
  end

end
