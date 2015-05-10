class Parcel < ActiveRecord::Base
  has_many :reviews
  belongs_to :sender, class_name: "User"
  belongs_to :trip
  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"

  validates :origin_address_id, :destination_address_id, :sender_id, presence: true
  validates :pickup_by, :deliver_by, :volume, presence: true
  validates_associated :origin_address, :destination_address


  def self.build(origin_address_params, destination_address_params, parcel_params)
    origin_address = Address.new(origin_address_params)
    unless origin_address.save
      return origin_address
    end

    destination_address = Address.new(destination_address_params)
    unless destination_address.save
      origin_address.destroy
      return destination_address
    end

    parcel = Parcel.new(parcel_params)
    parcel.origin_address = origin_address
    parcel.destination_address = destination_address

    if parcel.save
      return parcel
    else
      origin_address.destroy
      destination_address.destroy
      parcel.destroy
      return parcel
    end
  end

    def self.match_reviewer(user_id, current_id)
    parcels = Parcel.where(sender_id: user_id)
    match = []
    parcels.each do |parcel|
      if parcel.trip.driver_id == current_id
          match << parcel
      end
    end
    match
  end

end
