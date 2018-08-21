class ReservationJob < ApplicationJob
  queue_as :default

  def perform_later(user, reservation)
  	#ReservationMailerJob.notify_user(user, reservation) 
    # Do something later
  end
end
