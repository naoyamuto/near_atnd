Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'DRgF60QeTQ3Xe3ZMjEeoJkCbS', 'ASOsL90ojtjo8zjtjKYzG7DCtNvfOuRxueTgqHLwiI8ytDJKTr'
  provider :facebook, '258603734491025', '2076a71e5715630804f40bddd0faec59',
    scope: 'public_profile', info_fields: 'id,name,link'
end
