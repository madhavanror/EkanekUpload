require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post '/login', params: { email: 'Madhavan@gmail.com', password: 'Test123' }
    @controller = DocumentsController.new
  end

  test 'create document with png' do
    doc_image = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'Ekanek.png'),'image/png')
    post '/documents', params: { document: { title: 'test', description: 'tesing png', doc: doc_image } }
    assert_response :success
    assert_equal 'test', Document.last.title
    assert_equal 'Ekanek.png', Document.last.doc.filename.to_s
  end

  test '#index' do
    get '/documents'
    assert_response :success
  end

  test '#new' do
    get '/documents/new'
    assert_response :success
    assert_template 'documents/new'
  end

  test '#download success' do
    get "/document/#{Document.last.id}/download"
    assert_response :success
  end

  test '#download failure' do
    get '/document/:id/download'
    assert_response :not_found
  end

  test '#destroy failure' do
    delete '/documents/:id'
    assert_response :not_found
  end

  test '#destroy Success' do
    delete "/documents/#{Document.last.id}"
    assert_response :redirect
  end
end
