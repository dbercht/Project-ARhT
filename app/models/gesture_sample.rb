class GestureSample < ActiveRecord::Base

	belongs_to :classifier
	has_one :gesture
end
