# frozen_string_literal: true

module ApplicationHelper
	def day(date)
		date.strftime('%d')
	end

	def time_zone_date(time)
		time.strftime('%d/%m/%Y às %H:%M')
	end

	def time_date(date)
		date.strftime('%d/%m/%Y')
	end

	def time_date_year(date)
		date.strftime('%Y')
	end

	def hour(hour)
		hour.strftime('%H:%M')
	end

	def flash_message
    messages = ''

    flash.each do |name, msg|
      if msg.is_a? Hash
        if msg['type'] == 'error'
          messages += "<div class=\"alert alert-danger\"><button type='button' class='close' data-dismiss='alert'>&times;</button><span class='material-symbols-outlined'>priority_high</span><span class='hash'>#{msg['text']}</span></div>"
        elsif msg['type'] == 'success'
          messages += "<div class=\"alert alert-success\"><button type='button' class='close' data-dismiss='alert'>&times;</button><span class='material-symbols-outlined'>done</span><span class='hash'>#{msg['text']}</span></div>"
        else
          messages += "<div class=\"alert alert-info\"><button type='button' class='close' data-dismiss='alert'>&times;</button><i class=\"fa fa-info\"></i><span class='hash'>#{msg['text']}</span></div>"
        end
      elsif msg.is_a? String
        if name == 'error'
          messages += "<div class=\"alert alert-danger\"><button type='button' class='close' data-dismiss='alert'>&times;</button><span class='material-symbols-outlined'>priority_high</span><span class='string'>#{msg}</span></div>"
        elsif name == 'success'
          messages += "<div class=\"alert alert-success\"><button type='button' class='close' data-dismiss='alert'>&times;</button><span class='material-symbols-outlined'>done</span><span class='string'>#{msg}</span></div>"
        else
          messages += "<div class=\"alert alert-info\"><button type='button' class='close' data-dismiss='alert'>&times;</button></i><span class='material-symbols-outlined'>priority_high</span><span class='string'>#{msg}</span></div>"
        end
      end
    end

    messages.html_safe
  end
end
