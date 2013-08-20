# == Schema Information
# Schema version: 20100330111833
#
# Table name: events
#
#  id              :integer(4)      not null, primary key
#  title           :string(255)
#  starttime       :datetime
#  endtime         :datetime
#  all_day         :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#  description     :text
#  event_series_id :integer(4)
#

class Event < ActiveRecord::Base
  attr_accessible :starttime,:endtime,:all_day,:description

  scope :between, lambda {|start_time, end_time| 
  {
    :conditions => ["? < starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] } 
  } 
  
  def self.format_date(date_time) 
    Time.at(date_time.to_i).to_formatted_s(:db) 
  end

  def as_json(options = {}) 
    { :id => self.id, 
      :title => self.title,
     :description => self.description || "", 
      :starttime => starts_at.rfc822, 
      :endtime => ends_at.rfc822, 
      :all_day => self.all_day, 
      :recurring => false, 
       
    } 
  end 

  
end
