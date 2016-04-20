class Job < ActiveRecord::Base
  def filled?
    available == false
  end

  # display the jobs that were created <= 30 days ago

  def self.within_range
    Job.where("created_at <= ?", 30.days.ago)
  end
end
