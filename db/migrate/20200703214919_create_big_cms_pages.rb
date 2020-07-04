class CreateBigCmsPages < ActiveRecord::Migration[6.0]
  def change
    create_table :big_cms_pages do |t|
      t.string :title
      t.text :content
      t.string :status
      t.integer :version
      t.string :new_title
      t.text :new_content

      t.timestamps
    end
  end
end
