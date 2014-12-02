class Spree::ContactsController  < Spree::StoreController
  load_and_authorize_resource :only => [:show]

  def index
    @contact = Contact.new()
  end

  def show

  end

  def create
    @contact = Contact.create(name: params[:contact][:name],email: params[:contact][:email],
                              subject: params[:contact][:subject],message: params[:contact][:message] )
    if @contact.save
      Spree::UserMailer.delay.contact_email(params[:contact][:name],params[:contact][:message],params[:contact][:email],
                               params[:contact][:subject])
      flash[:success] = "Your request is sent we will contact you soon !"
      redirect_to contacts_path
    else
      flash[:error] = "There was an error while submitting your contact request"
      render :index
    end
  end

  private

  def permitted_params
    params.permit(:name,:email,:subject,:message)
  end

end
