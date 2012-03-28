class ClientSession < ActiveRecord::Base
  belongs_to :clinic
	belongs_to :gesture
	self.table_name = 'sessions'

	METRICS = %w[ effort  ]

	#Will return the effort of the client session based on the clinic id
	def self.find_grouped_by_metric(clinic_id)
		@data = Hash.new
		METRICS.each do |metric|
			@data[metric.to_sym] = ClientSession.find(:all, :conditions => {:clinic_id => clinic_id}, :select => [:created_at, metric.to_sym])
		end
		@data
	end

end
