<center>Lean Twitter API</center>
====================

Run
---

```
$ bundle install
$ rake db:create db:migrate starter:run
$ rackup
```

### Technologies
- Padrinorb
- Grape
- ActiveRecord
- RSpec
- Shoulda Matchers


### Browser API

Add it in a swagger client http://localhost:9292/api/v1/swagger_doc


List Routes
-----------

```
rake routes
```

Routes
-----------
```
POST    /api/v1/oauth/token(.json)
POST    /api/v1/oauth/revoke(.json)
POST    /api/v1/oauth/authorize(.json)
POST    /api/v1/users/signup(.json)
GET     /api/v1/users/timeline(.json)
POST    /api/v1/users/messages(.json)
POST    /api/v1/users/:id/follow(.json)
GET     /api/v1/v1(.:format)
GET     /api/version/swagger_doc/:name(.:format)
```

OAuth2.0
-----------
```
client_id: a78fb1383c14c6332165bc44c1a364b38d26fc68
client_secret: 118a1de593252b71f178cef60ae8b6af7c484a51bead92a6671a2630b548e68e
```

Running tests
-----------
```
rake spec
```

<br>
<center>Made with :heart: by Hotaviano</center>
