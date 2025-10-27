load Rails.root.join('app', 'models', 'budget', 'investment.rb')

class Budget::Investment < ApplicationRecord
    ZONES_OPTIONS = %w[
      zona_1
      zona_2
      zona_3
      zona_4
      zona_5
    ].freeze

    validates :zone, inclusion: { in: ZONES_OPTIONS }, allow_blank: true

    def zones
      ZONES_OPTIONS
    end
end
