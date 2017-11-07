class SampleModel
  include Her::Model

  collection_path "sample"
  attributes :msg, :path, :method

  def self.find_one
    SampleModel.get('sample')
  end

end
