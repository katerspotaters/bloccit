class User < ActiveRecord::Base

   before_save { self.email = email.downcase }
   before_save :user_name

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

   has_secure_password

   def user_name
     if name
       name_array = []
       name.split.each do |first_last|
       name_array << first_last.capitalize
     end

     self.name = name_array.join(" ")
   end
 end
end
