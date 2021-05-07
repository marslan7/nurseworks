describe('Basic Login', function() {
  
  beforeEach(() => {
    cy.app('clean') // have a look at cypress/app_commands/clean.rb
    cy.appFactories([
      ['create', 'user', {email: "cm@gmail.com", password: "cm@gmail.com"}]
    ])
  })

  it('Login', function() {
    cy.login("cm@gmail.com", "cm@gmail.com")
    cy.url().should("contain", "/");
    cy.contains("Dashboard").should("exist");
  })
  
  it('Wrong Password', function() {
    cy.login("cm@gmail.com", "cm@gmail.comXXXX")
    cy.url().should("contain", "/");
    cy.contains("Invalid Email or password").should("exist");
  })
 
})
