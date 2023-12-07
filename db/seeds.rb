admin = User.find_by( role: 'admin' )
User.create(name: 'Admin',username: 'admin', email: 'admin@mo-dev.site', password: '753951', role: 'admin') unless admin