module StaticPagesHelper

  def exec_image name
    img = "exec_board/" + name.gsub(" ","_") + ".jpg"
    options = {size: '200x200'}

    if FileTest.exist?("#{Rails.root}/app/assets/images/#{img}")
      image_check = image_tag("#{img}",options)
    else
      image_check = image_tag("exec_board/blank-person.jpg", options)
    end
    image_check
  end
end
