class School < ApplicationRecord

  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, :allow_blank => true
  before_save :check_format

  def self.filter(params)
    out = []
    if params[:status].blank?
      out = School.all
    else
      out = School.where(['status = ?', params[:status]])
    end

    return out.order(name: :asc)
  end

  private

  def check_format
    format_lat_lng
    format_string_length
  end

  def format_lat_lng
    self.latitude = latitude.to_f
    self.longitude = longitude.to_f
  end

  def format_string_length
    self.name = truncate(name, 255)
    self.address = truncate(address, 255)
    self.zip_code = truncate(zip_code, 6)
    self.city = truncate(city, 255)
    self.opening_hours = truncate(opening_hours, 500)
    self.phone_number = truncate(phone_number, 10)
    self.email = truncate(email, 155)
    self.status = truncate(status, 50)
  end

  def truncate(string, max)
    if string && max
      string.length > max ? "#{string[0...max]}" : string
    end
  end

end
