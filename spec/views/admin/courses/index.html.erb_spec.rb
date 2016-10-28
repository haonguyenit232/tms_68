require "rails_helper"

RSpec.describe "admin/courses/index", type: :view do
  let(:course) {FactoryGirl.create(:course)}

  it "should display list courses" do
    assign :courses, [course]
    render
    expect(rendered).to include course.name
    expect(rendered).to include l course.start_date, format: :default
    expect(rendered).to include l course.end_date, format: :default
    expect(rendered).to include course.status
  end
end
