class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def enough_tickets?
    if user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets for the #{attraction.name}."
    end
  end

  def tall_enough?
    if user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def take_ride
    if enough_tickets? && tall_enough?
      "Sorry. You do not have enough tickets for the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif enough_tickets?
      enough_tickets?
    elsif tall_enough?
      tall_enough?
    else
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_tickets =  self.user.tickets - self.attraction.tickets

      self.user.update(happiness: new_happiness, nausea: new_nausea, tickets: new_tickets)
    end
  end
end
