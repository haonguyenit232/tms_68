class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.references :user_course, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
