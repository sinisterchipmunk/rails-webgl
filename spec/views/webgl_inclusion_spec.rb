require 'spec_helper'

#   describe "widgets/index.html.erb" do
#     it "renders the @widgets" do
#       widgets = [
#         stub_model(Widget, :name => "Foo"),
#         stub_model(Widget, :name => "Bar")
#       ]
#       assign(:widgets, widgets)
#       render
#       rendered.should contain("Foo")
#       rendered.should contain("Bar")
#     end
#   end

describe "webgl_tests/webgl_inclusion.html.erb" do
  def src_for(str)
    File.expand_path(File.join('/javascripts', str))
  end
  
  it "includes all WebGL javascripts" do
    render
    rendered.should have_selector(:script, :src => src_for('control/keycodes.js'))
#    rendered.should have_tag(:script, :src => "d")
  end
end
