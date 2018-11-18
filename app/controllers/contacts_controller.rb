class ContactsController < ApplicationController
  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Group.find(params[:group_id]).contacts.page(params[:page])
    else
      @contacts = Contact.page(params[:page])
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
        flash[:danger] = "Contact couldn't be added"
        format.html {render :new }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:company,:email,:phone,:address,:group_id)
  end
end
