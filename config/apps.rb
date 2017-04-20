require Padrino.root('app/app.rb')

Padrino.mount('Twitter::App', app_file: Padrino.root('app/app.rb')).to('/')
