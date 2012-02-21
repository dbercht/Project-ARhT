class User < ActiveRecord::Base
	ROLES = %w[ Client Therapist ]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname

	has_many :clinics, :foreign_key => 'therapist_id', :dependent => :destroy
	has_many :clients, :through => :clinics, :order => [:surname, :name, :email]
	has_one :inverse_clinic, :class_name => 'Clinic', :foreign_key => 'client_id', :dependent => :destroy
	has_one :therapist, :through => :inverse_clinic

	validates :name, :presence => true, :length => {:minimum => 1}
	validates :surname, :presence => true, :length => {:minimum => 1}

  def self.therapists
    where(role: ROLES[1])
  end

	def therapist?
		!!(role == ROLES[1])
	end

  def self.clients
    where(role: ROLES[0])
  end

	def therapist?
		!!(role == ROLES[0])
	end

	def title
		if name.nil?
			email
		else
			 if surname.nil? || surname == ""
					name 
				else
				[ surname, name].join(", ")
			end
		end
	end
		
end
