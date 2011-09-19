PDFKit.configure do |config|
   config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
   config.default_options = {
     :page_size => 'Legal',
     :print_media_type => true, 
    :disable_smart_shrinking => true,
    :margin_left => "0mm", 
    :margin_right => "0mm", 
    :margin_top => "0mm", 
    :margin_bottom => "0mm"
   }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end