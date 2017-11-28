class Store < ApplicationRecord
  belongs_to :company
  has_many :wait_times


end
