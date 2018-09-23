class AttachmentControlController < ApplicationController

  before_action :author_must_be_signed_in_to_access

  def delete_attachment
    ActiveStorage::Attachment.find(params[:id]).purge
    redirect_back fallback_location: posts_url
  end

end
