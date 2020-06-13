ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :_destroy

  ## 入力フォーム
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.actions
    end
  end

end
