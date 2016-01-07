class User < ActiveRecord::Base


attr_accessor :password
before_save :encrypt_password
has_many :comments
has_many :properties
has_many :bookings
    
    
	validates :email, :password, :username, presence:true
	validates :email, :username, uniqueness:true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :password, length: { minimum: 6 }



def encrypt_password
      self.encrypted_password = BCrypt::Password.create(password)
    end

    

def authenticate(password)

		BCrypt::Password.new(self.encrypted_password)==password
	end
end
