# Seems like config gem has problems with rails 5 so I will just do it manually

Config.load_and_set_settings(Config.setting_files(::Rails.root.join("config"), Rails.env))
