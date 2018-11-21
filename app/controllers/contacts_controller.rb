class ContactsController < ApplicationController
  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Group.find(params[:group_id]).contacts.order(created_at: :desc).page(params[:page])
    else
      @contacts = Contact.order(created_at: :desc).page(params[:page])
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        flash[:success] = "Contact added!"
        format.html { redirect_to root_path }
      else
        format.html {render :new }
      end
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        flash[:success] = "Contact was successfully updated."
        format.html { redirect_to contacts_path }
      else
        format.html { render :edit }
      end
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name,:company,:email,:phone,:address,:group_id)
  end
end
