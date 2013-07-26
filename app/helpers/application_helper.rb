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
end