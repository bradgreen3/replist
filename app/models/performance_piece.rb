class PerformancePiece < ApplicationRecord
  belongs_to :performance
  belongs_to :piece

  alias_attribute :title, :piece_id

end
