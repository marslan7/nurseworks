describe('Basic Registration', function() {
  
  let user;

  beforeEach(() => {
    cy.app('clean') // have a look at cypress/app_commands/clean.rb
    cy.task("newUser").then((object) => {
      user = object;
    });
  })

  it.only('SignUp', function() {

    cy.visit('/users/sign_up')
    cy.get('#user_first_name').type(user.first_name);
    cy.get('#user_last_name').type(user.last_name);
    cy.get('#user_phone').type(user.phone);
    cy.get('#user_email').type(user.email);
    cy.get('#user_password').type(user.password);
    cy.get('#user_password_confirmation').type(user.password);
    cy.get('input[type="submit"]').click();
    cy.url().should("contain", "/");
    cy.contains("Dashboard").should("exist");

    cy.contains('.nav-link', 'Profile').click()
    cy.contains(user.first_name).should("exist");
    cy.contains(user.last_name).should("exist");
    cy.contains(user.email).should("exist");
    cy.contains(user.phone).should("exist");
    cy.contains("User").should("exist");
  })


  it('Already SignedUp', function() {

    cy.appFactories([
      ['create', 'user', {email: user.email, password: user.password}]
    ])
 
    cy.visit('/users/sign_up')
    cy.get('#user_first_name').type(user.first_name);
    cy.get('#user_last_name').type(user.last_name);
    cy.get('#user_phone').type(user.phone);
    cy.get('#user_email').type(user.email);
    cy.get('#user_password').type(user.password);
    cy.get('#user_password_confirmation').type(user.password);
    cy.get('input[type="submit"]').click();
    cy.contains("Email has already been taken").should("exist");

  })
  
})
