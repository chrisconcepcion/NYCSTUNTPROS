require 'spec_helper'

describe Wardrobe do
    it { should belong_to(:profile) }
end