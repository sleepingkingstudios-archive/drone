# app/models/recruiter.rb

class Recruiter
  include Mongoid::Document

  field :agency,       :type => String
  field :email,        :type => String
  field :name,         :type => String
  field :phone_number, :type => String

  has_many :roles

  validates :name, :presence => true
end # class
