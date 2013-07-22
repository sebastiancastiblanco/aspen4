module ApplicationHelper
  def fechaFormato1(date)
    date.strftime("%B %d")
  end
  def fechaFormatoActualizado(date)
    date.strftime("%d %B, %H:%M")
  end
end