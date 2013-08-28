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
  attr_accessible :title,:starttime,:endtime,:all_day,:description

  has_many :usuario_eventos
  has_many :usuarios, through: :usuario_eventos

  scope :between, lambda {|start_time, end_time| 
  {
    :conditions => ["? < starttime < ?", Event.format_date(start_time), Event.format_date(end_time)] } 
  } 
  
  def self.format_date(date_time) 
    Time.at(date_time.to_i).to_formatted_s(:db) 
  end

  #Transformacion del JSON a retornar para recuperar la informacion de la agenda 
  def as_json(options = {}) 
    { :id => self.id, 
      :title => self.title,
      :description => self.description || "", 
      :start => starttime.rfc822, 
      :end => endtime.rfc822, 
      :all_day => self.all_day, 
      :recurring => false, 
    } 
  end 

  
end
