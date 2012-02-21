class GestureSample < ActiveRecord::Base
	belongs_to :classifier
	belongs_to :gesture
end
