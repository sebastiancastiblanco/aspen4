module ApplicationHelper
  def fechaFormato1(date)
    date.strftime("%B %d")
  end
  def fechaFormatoActualizado(date)
    date.strftime("%d %B, %I:%M %p")
  end
  def fechaDia(date)
    date.strftime("%d")
  end
  def fechaMes(date)
    date.strftime("%B")
  end
  def fechaDiaSemana(date)
    date.strftime("%A")
  end

  def fechalog(date)
    date.strftime("%d %B %Y")
  end

    def campoFecha(date)
    date.strftime("%d %B %Y")
  end

  def horalog(date)
    date.strftime("%I:%M %p")
  end


end