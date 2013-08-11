class Alertum < ActiveRecord::Base
  attr_accessible :comienza, :hora, :nota, :repeticion, :termina, :titulo

  belongs_to :proceso
end
