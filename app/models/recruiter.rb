# app/models/recruiter.rb

class Recruiter < ActiveRecord::Base
  # field :agency,       :type => String
  # field :email,        :type => String
  # field :name,         :type => String
  # field :phone_number, :type => String

  has_many :roles

  validates :name, :presence => true
end # class
