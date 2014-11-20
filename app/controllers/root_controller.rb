class RootController < ApplicationController
  clear_respond_to

  before_action :enforce_https

  respond_to :html

  def ember
    index = Rails.root + 'public/manager/index.html'
    send_file index, type: 'text/html', disposition: 'inline'
  end

  private

  def enforce_https
    return true unless Rails.env.production?
    return true if https?

    redirect_to 'https://' + request.host + request.original_fullpath

    false
  end
end
