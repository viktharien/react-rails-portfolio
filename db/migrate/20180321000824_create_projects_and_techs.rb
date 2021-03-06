class CreateProjectsAndTechs < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.timestamps
    end

    create_table :technologies do |t|
      t.string :name
      t.timestamps
    end

    create_table :projects_technologies, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :technology, index: true
    end
  end
end
