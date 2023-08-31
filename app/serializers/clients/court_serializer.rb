class Clients::CourtSerializer < ActiveModel::Serializer
  attributes :id, :establishment_id, :unavailable_dates


  def unavailable_dates
    dates_times = object.matches.map{ |match| match.date_time } 

    format_datetime(dates_times)
  end

  def format_datetime(dates_times)
    date_arrays = {}

    dates_times.sort.each do |date_time|
      day_key = date_time.strftime("%d/%m")

      date_arrays[day_key] ||= []
      date_arrays[day_key] << date_time.strftime("%H:%M")
    end

    [date_arrays]
  end
end

