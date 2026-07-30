# frozen_string_literal: true

# Settlement < PlatformRecord requires a platform association, but this table
# was created (20260415010000) before core CE's Joatu exchange platform_id
# retrofit (20260605003002_add_platform_id_to_joatu_exchanges.rb) — and that
# retrofit's hardcoded table list predates this gem's settlements table, so it
# was never included. Mirrors that migration's column shape.
class AddPlatformIdToJoatuSettlements < ActiveRecord::Migration[7.2]
  def change
    return unless table_exists?(:better_together_joatu_settlements)
    return if column_exists?(:better_together_joatu_settlements, :platform_id)

    add_reference :better_together_joatu_settlements, :platform,
                  type: :uuid,
                  null: true,
                  foreign_key: { to_table: :better_together_platforms },
                  index: true
  end
end
