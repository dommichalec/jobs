module JobsHelper
  def to_percentage(job)
    number_to_percentage(job.time_spent_in_office, precision: 0)
  end
end
