
module ApplicationHelper

  def format_date(date)
    date.strftime("%b %d")
  end

  def format_due_date(date)
    @date = date
    " is due in " + distance_of_time_in_words(Time.now, @date)
  end

  def distance_time(date)
    date.strftime("%d").to_i - Time.now.strftime("%d").to_i
  end

  def add_notifications(user)
    user.notifications.each do |notification|
      notification.destroy
    end
    user.notes.each do |note|
      if note.due_date
        if distance_time(note.due_date) < 3
          n = Notification.new
          n.user_id = user.id
          n.note_id = note.id
          n.text = note.title + format_due_date(note.due_date)
          n.save
          format_due_date(note.due_date)
        end
      end
    end
  end

  REDLINE_API_KEY = "khAGpIjuD0BiqXS6ti15gVWRrh7YjFaEXKknsDR6Esp4piaTAbYQ7VHzcPxwvHat"

  def set_zip_radius_url(zip, distance)
    url = Addressable::URI.new(
      scheme: "http",
        host: "zipcodedistanceapi.redline13.com",
        path: "/rest/#{REDLINE_API_KEY}/radius.json/#{zip}/#{distance}/miles"
    ).to_s
  end

  def get_zips_in_radius(zip, distance)
    RestClient.get(set_zip_radius_url(zip, distance))
  end
end
