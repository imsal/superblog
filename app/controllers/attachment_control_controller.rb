class AttachmentControlController < ApplicationController

  http_basic_authenticate_with name: Rails.application.credentials.dig(:admin, :user_name), password: Rails.application.credentials.dig(:admin, :password)

  def delete_attachment
    ActiveStorage::Attachment.find(params[:id]).purge
    redirect_back fallback_location: posts_url
  end

end
