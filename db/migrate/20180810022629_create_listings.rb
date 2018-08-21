class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|

      t.belongs_to :user, index: true 
      t.string :title, null:false
      t.text :description, null:false
      t.string :address, null:false
      t.string :city, null:false
      t.string :country, null:false
      t.string :postcode, null:false
      t.string :home_type, null:false
      t.string :room_type, null:false
      t.string :images
      t.text :tags, array:true, default:[] 
      t.integer :price, null:false
      t.integer :max_guests, null:false
      t.integer :beds, null:false
      t.integer :baths, null:false
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end

 
end
