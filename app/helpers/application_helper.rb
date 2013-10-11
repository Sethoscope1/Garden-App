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
end
