require 'spec_helper'

describe Commit do
  it { should belong_to(:user) }
end
