class Flight < ApplicationRecord
  belongs_to :airline
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  delegate :code, to: :origin, prefix: true
  delegate :name, to: :origin, prefix: true
  delegate :code, to: :destination, prefix: true
  delegate :name, to: :destination, prefix: true
  delegate :code, to: :airline, prefix: true
  delegate :name, to: :airline, prefix: true
end
