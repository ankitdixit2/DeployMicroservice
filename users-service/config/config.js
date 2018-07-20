//  config.js
//
//  Simple application configuration. Extend as needed.
module.exports = {
	port: process.env.PORT || 80,
  db: {
    host: process.env.DATABASE_HOST || '0.0.0.0',
    database: 'users',
    user: 'users_service',
    password: '123',
    port: 3306,
  }
};
