class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :default_image, only: [:create]
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    @contacts = current_user.contacts.by_group(params[:group_id])
                            .search(params[:term])
                            .order(created_at: :desc)
                            .page(params[:page])
  end

  def autocomplete
    @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    @contact.image.attach(params[:contact][:image])
    respond_to do |format|
      if @contact.save
        flash[:success] = 'Contact added!'
        format.html { redirect_to contacts_path(previous_query_string) }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        flash[:success] = 'Contact was successfully updated.'
        format.html { redirect_to contacts_path(previous_query_string) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destory
    respond_to do |format|
      flash[:success] = 'Contact was successfully deleted.'
      format.html { redirect_to contacts_path }
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:company,:email,:phone,:address,:group_id, :image)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def default_image
    if self.image?
      @contact.image.attach(io: File.open(Rails.root.join('app',
                                                          'assets',
                                                          'images',
                                                          'default_image.png')),
                            filename: 'default_image.png', 
                            content_type: 'image/png')
    end
  end

  def previous_query_string
    session[:selected_group_id] ? { group_id: session[:selected_group_id] } : {}
  end
end
