class Chef < ActiveRecord::Base
  has_many :recipes
  before_save{self.email = email.downcase }
  validates :chefname, presence: true, length: {minimum: 2, maximum: 25}
  VALID_EMAIL_REGEX =   ^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$
  validates :email, presence :true, length:{maximum: 105},
                                    uniqueness{case_sensitive: false},
                                    format:{with: VALID_EMAIL_REGEX}
                                    
end