class Video < ActiveRecord::Base
    validates :titulo, :presence => true
    validates :descricao, :presence => true
    validates :url, :presence => true
end