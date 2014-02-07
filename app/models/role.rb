# app/models/role.rb

class Role
  include Mongoid::Document

  field :company, :type => String
  field :notes,   :type => String
  field :title,   :type => String
  field :url,     :type => String

  validates :company, :presence => true
  validates :title, :presence => true
end # class
