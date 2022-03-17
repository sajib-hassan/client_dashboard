class EmployeeImporter
  class InvalidFileError < StandardError; end

  class FileValidationError < StandardError; end

  EXPECTED_HEADER = [
    "first name", "last name", "company", "clients"
  ].freeze

  private_constant :EXPECTED_HEADER

  def initialize(stream)
    @stream = stream
  end

  def call

  end

end
