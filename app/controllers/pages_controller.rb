class PagesController < ApplicationController
  def home
    redirect_to job_offers_path if user_signed_in?
  end

end
