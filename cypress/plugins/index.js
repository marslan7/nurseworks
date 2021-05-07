/// <reference types="cypress" />
// ***********************************************************
// This example plugins/index.js can be used to load plugins
//
// You can change the location of this file or turn off loading
// the plugins file with the 'pluginsFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/plugins-guide
// ***********************************************************

// This function is called when a project is opened or re-opened (e.g. due to
// the project's config changing)

/**
 * @type {Cypress.PluginConfig}
 */
// eslint-disable-next-line no-unused-vars
module.exports = (on, config) => {
  
  let faker = require('faker');

  on("task", {
    newUser() {
        user = {
            first_name: faker.name.firstName(),
            last_name: faker.name.lastName(),
            email: faker.internet.email().toLowerCase(),
            password: "password",
            phone: faker.phone.phoneNumber("#########"),
        };
        return user;
    },
    newSupportRequest(type) {
      supportReq = {
          req_type: type,
          content: faker.lorem.paragraph(),
      };
      return supportReq;
  },
  });
  
}
