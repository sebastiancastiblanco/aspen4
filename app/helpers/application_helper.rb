module ApplicationHelper
  def fechaFormato1(date)
    if (!date.nil?)
    date.strftime("%B %d, %Y")
    end
  end
  def fechaFormatoActualizado(date)
    if (!date.nil?)
    date.strftime("%d %B %Y, %I:%M %p")
    end
  end
  def fechaDia(date)
    if (!date.nil?)
    date.strftime("%d")
  end
  end
  def fechaMes(date)
    if (!date.nil?)
      date.strftime("%B")
    end
  end
  def fechaDiaSemana(date)
    if (!date.nil?)
    date.strftime("%A")
  end
  end

  def fechalog(date)
    if (!date.nil?)
      date.strftime("%d %B %Y")
    end
  end

  def campoFecha(date)
    if (!date.nil?)
      date.strftime("%d %B %Y")
    end
  end

  def horalog(date)
    if (!date.nil?)
      date.strftime("%I:%M %p")
    end
  end


end