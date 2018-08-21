

class Room < ActiveRecord::Base
    searchkick

    belongs_to :user
    has_many :reservations

    validates :home_type, :room_type, :accomodate, :bedroom, :bathroom, :listing_name, :summary, :address, presence: true
    validates :listing_name, length: {maximum: 50}
    validates :summary, length: {maximum: 500}

    mount_uploaders :photos, PhotoUploader


#     def self.search(params)
#         tire.search(load: true) do
#             query {string params[:query]} if params[:query].present?
#        end
#    end
end