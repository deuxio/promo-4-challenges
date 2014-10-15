class Job
  attr_accessor :title, :company, :desc, :income_mth

  def initialize(title, company, desc, income_mth)
    @title = title
    @desc = desc
    @company = company
    @income_mth = income_mth
  end

  def incomesup?(price)
    @income_mth > price
  end

end

# require_relative "lib/job.rb"
# cdp_deuxio = Job.new('chef de projet', 'deuxio', 'blabla ablablabla balbalba', 45000)
# cdp_deuxio.incomesup?(50000)