class Project < ActiveRecord::Base
  has_many :tasks
  after_initialize :set_defaults

  validates_presence_of :title, :description, :percent_complete

  scope :almost_completed, -> { where('percent_complete > 50.0')}
  scope :stiill_needs_some_work, -> { where('percent_complete <75')}

  def set_defaults  
    self.percent_complete ||= 0.0
  end
end
