require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess::FixtureFile

  test "Create New Document" do
    doc_image = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'Ekanek.png'),'image/png')
    document = Document.new
    document.title = 'Docs'
    document.description = 'Doc test'
    document.doc = doc_image
    document.user = User.last
    assert_equal document.save, true
  end

  test "Throw An Error Without Mandatory Fields" do
    document = Document.new
    assert_equal document.save, false
    assert_equal document.errors.full_messages, ["Title can't be blank", "Description can't be blank", "User can't be blank", "User must exist"]
  end

  test "Title must be Uniq" do
    document = Document.last.dup
    assert_equal document.save, false
    assert_equal document.errors.full_messages, ['Title has already been taken']
  end

  test 'Validate File Size' do
    fixture_path = File.join(Rails.root, 'test', 'fixtures', 'files', 'Ekanek.png')
    fixture_file = File.open(fixture_path)
    fixture_file.stubs(:size).returns(2000.megabytes)
    document = Document.new
    document.title = 'Docs'
    document.description = 'Doc test'
    document.user = User.last
    document.doc.attach(io: fixture_file, filename: 'Ekanek.png')
    assert_equal document.save, false
    assert_equal document.errors.full_messages, ["Doc File Size Is Too Big. Max size is 1Gb."]
  end
end
