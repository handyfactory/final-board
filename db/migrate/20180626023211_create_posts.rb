#DB 설계도. DB 자체는 아니다
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
