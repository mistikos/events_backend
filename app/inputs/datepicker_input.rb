class DatepickerInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options)
    @builder.text_field(attribute_name, merge_wrapper_options(input_html_options, wrapper_options))
  end
end