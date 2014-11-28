class Url < ActiveRecord::Base
  before_create :shortify
  validates :short_url, uniqueness: {case_sensitive: true}

  private
  def shortify
    self.shortened_url = SecureRandom.hex(6)
  end

end