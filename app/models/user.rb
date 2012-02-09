class User < ActiveRecord::Base
  validates :latitude, :presence => true#, :numericality => { :in => (0..180) }
  validates :longitude, :presence => true#, :numericality => { :in => (0..360) }
  validates :name, :presence => true, :uniqueness => true

#  before_validation :convert_location

=begin
  def convert_location
    self.latitude = latitude + 90
    self.longitude = longitude + 180
  end

  def location_unique
    User.find(:latitude => self.latitude, :longitude => self.longitude).empty?
  end
=end

  def nearest
    if self.persisted?
      def distance(user1, user2)
        ((user1.latitude - user2.latitude)**2 + (user1.longitude - user2.longitude)**2)**(1/2)
      end

      users = []
      User.all.each do |another_user|
        new_user = { :user => another_user.name, :distance => distance(another_user, self) }
        users << new_user unless (another_user == self)
      end
    end
  end
end
