require 'spec_helper'
require 'random_string'

describe RandomString do
  it "should generate a random string to a reasonable degree of randomness" do
    run_1 = (0..9).to_a.map { RandomString.generate(8) }
    run_2 = (0..9).to_a.map { RandomString.generate(8) }
    expect(run_1 & run_2).to eq([])
  end
end