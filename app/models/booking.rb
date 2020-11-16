class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :flat
end
