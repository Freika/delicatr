# SimpleForm.setup do |config|
#   config.wrappers :default, class: :input,
#     hint_class: :field_with_hint, error_class: :field_with_errors do |b|
#     b.use :html5
#     b.use :placeholder
#     b.optional :maxlength
#     b.optional :pattern
#     b.optional :min_max
#     b.optional :readonly
#     b.use :label_input
#     b.use :hint,  wrap_with: { tag: :span, class: :hint }
#     b.use :error, wrap_with: { tag: :span, class: :error }
#   end

#   config.default_wrapper = :default
#   config.boolean_style = :nested
#   config.button_class = 'btn'
#   config.error_notification_tag = :div
#   config.error_notification_class = 'alert alert-error'
#   config.label_class = 'control-label'
#   config.browser_validations = false
# end

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
   # you need an updated simple_form gem for this to work, I'm referring to the git repo in my Gemfile
  config.input_class = "form-control"

  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :group, tag: 'div', class: "form-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input, wrap_with: { class: "input-group" }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
    b.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
