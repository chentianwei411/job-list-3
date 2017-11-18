module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "sucess", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sys, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
  
end
