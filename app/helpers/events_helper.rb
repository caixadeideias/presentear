#encoding: utf-8
module EventsHelper
  def show_dates_distance_with_today(date)
    if date.today?
      "hoje"
    elsif date == Date.tomorrow
      "amanhã"
    else
      "em " + time_ago_in_words(date)
    end
  end
end
