class BackfillTagsFromRaces < ActiveRecord::Migration[8.1]
  def up
    Race.find_each do |race|
      tag = Tag.find_or_create_by!(name: race.name, user_id: race.user_id)

      race.runs.each do |run|
        RunTag.find_or_create_by!(run_id: run.id, tag_id: tag.id)
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
