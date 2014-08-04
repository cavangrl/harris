class Project < ActiveRecord::Base
  belongs_to :user
  has_many :cards, -> { order("position ASC") }, dependent: :destroy
  after_create :create_card
  after_initialize :set_status
 

  STATUS = ["active", "inactive"]

  def print_status
  	STATUS[self.status]
  end

  def create_card
  	self.cards.create(
  		title: "Your first card. Woohoo!", 
  		body:"Click here to edit this card's contents. Hover over the top right of a card and click the 'X' to delete it. Drag cards to the desired position.",
      position: 1)
  end

  def set_status
    self.status = 0
  end
end
