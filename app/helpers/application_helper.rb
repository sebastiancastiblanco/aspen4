module ApplicationHelper
  def fechaFormato1(date)
    date.strftime("%B %d")
  end
  def fechaFormatoActualizado(date)
    date.strftime("%d %B, %H:%M")
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
    date.strftime("%d %b %Y")
  end

  def horalog(date)
    date.strftime("%I:%M %p")
  end


end