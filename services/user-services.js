const bcyrpt = require("bcryptjs");
const xss = require('xss');
const REGEX_UPPER_LOWER_NUMBER_SPECIAL = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&])[\S]+/;

const UserService = {

  // ----- New User / User Signup Services -----//

  validateUserPassword(user_password) {
    if (user_password.length <= 8)
      return "Password must be longer than 8 characters";

    if (user_password.length >= 24)
      return "Password must be shorter than 24 characters";

    if (user_password.startsWith(" ") || user_password.endsWith(" "))
      return "Password must not start or end with spaces";

    if (!REGEX_UPPER_LOWER_NUMBER_SPECIAL.test(user_password))
      return "Password must contain 1 upper case, 1 lower case, 1 number, and 1 special character";

    return null;
  },

  hasUserWithUserName(db, user_name) {
    return db('users').select("user_name").where({ user_name }).first();
  },

  hashUserPassword(user_password) {
    return bcyrpt.hash(user_password, 12);  
  },

  insertUser(db, user) {
    return db('users').insert(user).returning('*').then(([user]) => user);  
  },

  serializeUser(user) {
    return {
      user_id: user.user_id,
      user_name: xss(user.user_name),
      user_date_created: user.user_date_created,
    };
  },

  // ----- Main User Services -----//

  //TODO
  // CRUD Platforms for User
  getAllPlatforms(db, user_id) {
    return db('platforms').select('*').where(user_id)
  },

  createNewPlatform(db, newPlatform) {
    return db('platforms').insert(newPlatform).returning('*').then(([res]) => res)
  },

  editPlaform(db, platform_id, newPlatform) {
    return db('platforms').where({platform_id}).update(newPlatform, ['*'])
  },

  deletePlatform(db, platform_id) {
    return db('platforms').delete().where({platform_id})
  },

  // CRUD Platform Fees for User
  // CRUD Dead Items for User
  // CRUD Shipping Supplies for User
  // CRUD General Fees for User
  // CRUD Item Locations for User
  // CRUD Item Categories for User
  // CRUD Item Sub-Categories for User
  // CRUD Items For User 

}

module.exports = UserService;