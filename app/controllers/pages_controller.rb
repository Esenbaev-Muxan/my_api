class PagesController < ApplicationController
  def home
    @application = Doorkeeper::Application.find_by(name: 'Web Client')

    @application = {
      name: @application.name,
      client_id: @application.uid,
      clietn_secret: @application.secret
    }
  end
end
