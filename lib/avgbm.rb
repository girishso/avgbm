require "avgbm/version"
require 'benchmark'

module Benchmark

  def self.avgbm(iterations = 5, label_width = 0) # :yield: job
    job = Job.new(label_width)
    yield(job)
    width = job.width + 1

    hash = Hash.new { |hash, key| hash[key] = [] }
 
    # benchmark
    job.list.each { |label,item|
      iterations.times do
        hash[label.to_s] << Benchmark.measure(label, &item)
      end
    }

    # minimum 5 iterations
    iterations = iterations < 5 ? 5 : iterations

    # discard the lowest and highest times
    lower_bound = iterations / 5
    upper_bound = iterations - lower_bound

    hash.each_pair do |label, reports|
      # discard the highest and lowest times
      reports.sort! {|x, y| y.real <=> x.real}
      hash[label] = reports[lower_bound...upper_bound]

      # average the remaining
      hash[label] = hash[label].inject{ |sum, el| sum + el } / hash[label].size
    end

    # print the results
    print ' '*width + CAPTION

    hash.each_pair do |label, reports|
      print label.ljust(width)
      print reports
    end

    hash
  end

end