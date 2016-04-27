module ApplicationHelper

  def day_in_words
    Time.now.strftime("%A")
  end
end
