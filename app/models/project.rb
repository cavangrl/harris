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
  		body:"Click here to edit this card's contents.",
      position: 1)
  end

  def set_status
    self.status = 0
  end
end
