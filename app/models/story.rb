class Story < ActiveRecord::Base
	belongs_to :users
  belongs_to :parent, class_name: 'Story'
  has_many :children, class_name: 'Story', foreign_key: 'parent_id'

  validates :title, presence: true, if: :root?
  validates :text, length:{maximum: 250}, presence: true

  def root?
  	parent.nil?
  end
end
