# app/models/role.rb

class Role < ActiveRecord::Base
  # field :company,        :type => String
  # field :date_submitted, :type => Date
  # field :notes,          :type => String
  # field :title,          :type => String
  # field :url,            :type => String

  belongs_to :recruiter

  validates :company, :presence => true
  validates :title, :presence => true
end # class
