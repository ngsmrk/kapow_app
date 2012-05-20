class SessionsController < ApplicationController
  def failed
    render :text => request.env.inspect
  end  
  
  def create
    render :text => 'huzzah'
  end
end
