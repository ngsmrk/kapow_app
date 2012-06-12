module ApplicationHelper  
  def format_date_time(date)
    date = Date.parse(date) unless date.respond_to?('strftime')
    date != nil ? date.strftime("%d/%b/%Y") : ""
  end  
end
