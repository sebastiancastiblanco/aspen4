require 'date'

class Date
MONTHNAMES = [nil] + %w(Ene Feb Mar Abr May Jun Jul Ago Sept Oct Nov Dic)
DAYNAMES = %w(Domingo, Lunes, Martes, Miercoles, Jueves, Viernes,
Sabado)
module Format
    MONTHS = {
      'Enero'=>1,'Febrero'=>2,'Marzo'=> 3,'Abril'=> 4,
      'Mayo'=> 5,'Junio'=>6,'Julio'=>7,'Agosto'=> 8,
      'Septiembre'=>9, 'Octubre'=>10, 'Noviembre'=>11, 'Diciembre'=>12
    }

    DAYS = {
      'Domingo'   => 0, 'Lunes'   => 1, 'Martes'  => 2, 'Miercoles'=> 3,
      'Jueves' => 4, 'Viernes'   => 5, 'Sabado' => 6
    }
end

end

class Time
  alias :strftime_nolocale :strftime

  def strftime(format)
    format = format.dup
    format.gsub!(/%a/, Date::ABBR_DAYNAMES[self.wday])
    format.gsub!(/%A/, Date::DAYNAMES[self.wday])
    format.gsub!(/%b/, Date::ABBR_MONTHNAMES[self.mon])
    format.gsub!(/%B/, Date::MONTHNAMES[self.mon])
    self.strftime_nolocale(format)
  end
end


# Load the rails application
require File.expand_path('../application', __FILE__)



# Initialize the rails application
AspenVersion3::Application.initialize!


