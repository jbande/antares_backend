module ModelsHelper
  def update_on_changes(**args)
    attrs = {}
    args.each do |key, val|
      attrs[key] = val if val
    end
    self.update_attributes(attrs)
  end
end