require 'spec_helper'

class FooModel
  def self.column_names
    ['amount']
  end

  def self.where(*args)
    FooModel
  end

  def self.includes(*args)
    FooModel
  end
end
