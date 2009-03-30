class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.column :first_name,                      :string
      t.column :middle_name,                     :string
      t.column :last_name,                       :string
      t.column :arrival_date,                    :date
      t.column :date_of_birth,                   :date
      t.column :gender,                          :string
      t.column :address,                         :string
      t.column :city,                            :string
      t.column :state,                           :string
      t.column :zip,                             :string
      t.column :father_first_name,               :string
      t.column :father_last_name,                :string
      t.column :mother_first_name,               :string
      t.column :mother_last_name,                :string
      t.column :telephone,                       :string
      t.column :emergency_contact_name,          :string
      t.column :emergency_contact_relationship,  :string
      t.column :emergency_contact_number,        :string
      t.column :patient_remarks,                 :string

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
