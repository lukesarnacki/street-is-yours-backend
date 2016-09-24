if Settings.paperclip.storage.to_s == 'fog'
  config.paperclip_defaults = {
    storage: :fog,
    fog_credentials: { fog_directory: ENV['fog_directory'] || 'street-is-yours' }
  }
end
