class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  after_action :verify_authorized, except: :home, unless: :skip_pundit?

  def home
  end
end
