class AddCourtIdToMatches < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches, :court, before: :timestamps, foreign_key: true
  end
end
