class Category < ActiveRecord::Base
	belongs_to :typecate

	scope :of_type, lambda{ |cate_id|
		where(["typecate_id = ? ", cate_id])
	}
end
