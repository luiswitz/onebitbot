require 'pg_search'
include PgSearch

class Link < ActiveRecord::Base
  has_many :link_hashtags
  has_many :hashtags, through: :link_hashtags
  belongs_to :company
end
