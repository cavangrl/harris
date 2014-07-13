class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :projects
	has_many :cards, through: :projects
	after_create :create_project
	validates_presence_of :name

	def create_project
		self.projects.create(title:"Click Here to Edit")
	end
end
