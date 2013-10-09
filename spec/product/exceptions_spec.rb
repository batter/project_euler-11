require 'spec_helper'

describe Product::Exceptions do
  it { should be_instance_of(Module) }

  describe :OutOfBoundsError do
    it { Product::Exceptions.const_defined?(:OutOfBoundsError).should be_true }
    it { Product::Exceptions::OutOfBoundsError.superclass.should == StandardError }
  end
end
