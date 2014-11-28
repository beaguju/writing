class Story < ActiveRecord::Base
  belongs_to :users
  belongs_to :parent, class_name: 'Story'
  has_many :children, class_name: 'Story', foreign_key: 'parent_id'

  validates :title, presence: true, if: :root?
  validates :text, presence: true

  scope :root, -> { where parent: nil }

  def root?
  	parent.nil?
  end

  def last_created
  	order(created_at: :desc)
  end

  def parents
  	return [] unless self.parent
  	[self.parent] | self.parent.parents
   end

end
