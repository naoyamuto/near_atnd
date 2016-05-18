Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['DRgF60QeTQ3Xe3ZMjEeoJkCbS'], ENV['ASOsL90ojtjo8zjtjKYzG7DCtNvfOuRxueTgqHLwiI8ytDJKTr']
end
