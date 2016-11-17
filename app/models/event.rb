class Event < ApplicationRecord
  has_many :participants

  def name_with_edition
    "#{name} - #{edition}"
  end
end
