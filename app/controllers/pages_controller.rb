class PagesController < ApplicationController
  allow_unauthenticated_access only: [ :home ]
  layout "landing"

  def home
    redirect_to stats_path if Current.user
  end
end
