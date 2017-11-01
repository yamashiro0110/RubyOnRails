class Post < ActiveRecord::Base
  include Swagger::Blocks

  swagger_schema :Post, required: [:id, :title, :text, :created_at] do
    property :id do
      key :type, :integer
      key :format, :int64
    end

    property :title do
      key :type, :string
    end

    property :text do
      key :type, :string
    end

    property :created_at do
      key :type, :string
    end

    property :updated_at do
      key :type, :string
    end
  end

end
