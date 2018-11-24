class ContactsController < ApplicationController
  before_action :default_image, only: [:create]
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    if params[:group_id] && !params[:group_id].empty?
      group = Group.find(params[:group_id])
      if params[:term] && !params[:term].empty?
        @contacts = group.contacts.where('name LIKE ?', "%#{params[:term]}%").order(created_at: :desc).page(params[:page])
      else
        @contacts = group.contacts.order(created_at: :desc).page(params[:page])
      end
    else
      @contacts = Contact.where('name LIKE ?', "%#{params[:term]}%").order(created_at: :desc).page(params[:page])
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.image.attach(params[:contact][:image])
    respond_to do |format|
      if @contact.save
        flash[:success] = "Contact added!"
        format.html { redirect_to contacts_path(previous_query_string) }
      else
        format.html {render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        flash[:success] = "Contact was successfully updated."
        format.html { redirect_to contacts_path(previous_query_string) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destory
    respond_to do |format|
      flash[:success] = "Contact was successfully deleted."
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
      @contact.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_image.png')), filename: 'default_image.png', content_type: 'image/png')
    end
  end

  def previous_query_string
    session[:selected_group_id] ? { group_id: session[:selected_group_id] } : {}
  end

end
