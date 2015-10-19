class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :find_appbrowzer, only: :uber_booking
  before_action :set_default_response_format

  def uber_booking
    render json: {
      "_id": "booking.json",
      "_rev": "2-0422df72f968ecfd6a3898ab449868d3",
      "general_configuration": {
        "name": "Cab Booking",
        "logo": "http://www.thetransportllc.com/wp-content/uploads/2013/05/5650631_l.jpg",
        "content_url": "http://128.199.154.12:5984/android/uber_data_card.json",
        "dynamic_ui_url": "http://128.199.154.12:5984/android/uber_request_card.json"
      },
      "navigation_configuration": {
        "categories": [
          {
            "id": "1",
            "name": "Booking",
            "url": "http://128.199.154.12:5984/android/uber_data_card.json"
          }
        ]
      }
    }, status: 2000
  end

  #######
  private
  #######

  def find_appbrowzer
    if request.headers["X-User-Agent"] == "appbrowzer"
      redirect_to '/api/appbrowzer' , status: 302
    end
  end

  def set_default_response_format
    request.format = :json
  end
end
