module ApplicationHelper
  FLASH_TRANSLATION = {
    notice: "info",
    success: "success",
    error: "error",
    alert: "error"
  }.freeze

  private_constant :FLASH_TRANSLATION

  def flash_class(level)
    "alert alert-#{FLASH_TRANSLATION.fetch(level)}"
  end
end
