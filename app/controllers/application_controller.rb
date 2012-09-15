class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :date_time_now
  
  DISABLE_ENABLE  = ["DISABLE", "ENABLE"]
  
  def date_time_now
    t = Time.now
    @date_time_now =  t.strftime('%d/%m/%Y %I:%M')
  end
  
end
