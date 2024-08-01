module HasPersonName
  extend ActiveSupport::Concern

  included do
    has_person_name

    normalizes :first_name, :last_name,  with: -> { _1.downcase.titleize }
  end
end