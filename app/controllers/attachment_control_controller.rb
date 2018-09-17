class AttachmentControlController < ApplicationController

  def delete_attachment
    ActiveStorage::Attachment.find(params[:id]).purge
    redirect_back fallback_location: posts_url
  end

end
