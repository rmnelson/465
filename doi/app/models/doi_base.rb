class DoiBase < ActiveRecord::Base
has_many :doi_histories, dependent: :destroy
end
