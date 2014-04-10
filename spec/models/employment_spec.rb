require 'spec_helper'

describe Employment do
    it { should belong_to(:profile) }
end