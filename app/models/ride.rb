class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < attraction_tickets && user_height < attraction_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
    if self.user.tickets < attraction_tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user_height < attraction_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
     end
     if self.user.tickets > attraction_tickets
       self.user.tickets -= attraction_tickets
       self.user.save
     end
     self.user.nausea += self.attraction.nausea_rating
     self.user.save
     self.user.happiness += self.attraction.happiness_rating
     self.user.save
  end


  def attraction_tickets
    self.attraction.tickets
  end

  def user_height
    self.user.height
  end

  def attraction_height
    self.attraction.min_height
  end
end
