module FlashHelper
  def css_class_for_flash(type)
    case type
    when "notice"
      "bg-green-50 text-green-500 dark:bg-gray-900 dark:text-lime-600 dark:backdrop-blur-xl"
    when "alert"
      "bg-amber-100 text-amber-500 dark:bg-gray-900"
    end
  end

  def icon_for_flash(type)
    case type
    when "notice"
      render "shared/svg/check_mark", classes: "size-5 md:size-6"
    when "alert"
      render "shared/svg/info"
    end
  end

  def delay_flash(message)
    (message.length.fdiv(10).ceil * 1000).to_s
  end
end