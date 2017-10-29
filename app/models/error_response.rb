class ErrorResponse
  include Swagger::Blocks

  swagger_schema :ErrorResponse do
    key :required, [:message, :errors]
    property :message do
      key :type, :string
    end
    property :errors do
      key :type, :array
      items do
        key :type, :string
      end
    end
  end

end
