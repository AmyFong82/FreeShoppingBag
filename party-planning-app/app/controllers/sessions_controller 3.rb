class SessionsController < ApplicationController
  # This is required because of a quirk the "developer" authentication
  # strategy. We'll remove this when we move to a "real" provider.
  skip_before_action :verify_authenticity_token, only: :create

  def create
    # Ye olde redirect
    redirect_to parties_path
  end
end
