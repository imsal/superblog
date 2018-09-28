class InquiriesController < ApplicationController
  before_action :author_must_be_signed_in_to_access, except: [:create]
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  # def show
  # end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # GET /inquiries/1/edit
  # def edit
  # end

  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save

      name = @inquiry.name
      email = @inquiry.email
      message = @inquiry.message

      InquiryMailer.send_automated_inquiry_response(email, name, message).deliver_now
      
      InquiryMailer.alert_company_of_inquiry(email, name, message).deliver_now

      redirect_back fallback_location: root_path, notice: "Thank you for reaching out to us. A member of our team will reach out to you momentarily!"
    else
      redirect_back fallback_location: root_path, alert: "We've encountered an error. Your message was not successfully sent."
    end

  end

  # PATCH/PUT /inquiries/1
  # def update
  #   if @inquiry.update(inquiry_params)
  #     redirect_to @inquiry, notice: 'Inquiry was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /inquiries/1
  def destroy
    @inquiry.destroy
    redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
