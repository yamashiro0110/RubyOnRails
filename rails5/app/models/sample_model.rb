class SampleModel
  include Her::Model

  attributes :msg, :path, :method

  def self.find_one
    SampleModel.get('sample')
  end

end
