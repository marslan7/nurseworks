describe('Support Requests', function() {

    let supportReq;
    let user;

    beforeEach(() => {
        cy.app('clean') // have a look at cypress/app_commands/clean.rb
        cy.task("newUser").then((object) => {
            user = object;

            cy.appFactories([
                ['create', 'user', user]
            ])
        });
            

        cy.task("newSupportRequest", "Time off notification").then((object) => {
            supportReq = object;
        });

    })
    
    const types = [
        "Time off notification",
        "Request for additional hours",
        "Request for payout",
        "Address and phone number changes",
        "Request for Tax 1099",
        "Request for wage verification",
        "Request for pay stub",
        "Request for CNA renewal form completion",
        "Request for Name change",
        "Schedule of Admin Fees",
        "Other"
    ]

    types.forEach((type) => {
        it(`Create Support Request ${type}`, function() {
            cy.login(user.email, user.password)
            cy.contains('.nav-link', 'Support').click()
            cy.get('#new_support_request_btn').click()

        
            cy.get("#support_request_req_type").select(type)
            cy.get("#support_request_content").type(supportReq.content)

            const fileInput = 'input[type=file]';
            cy.upload_file("sample_attachment.txt", "text/html", fileInput);

            cy.get("#save_support_request").click()

            cy.contains(type).should("exist");
            cy.contains(supportReq.content).should("exist");
            cy.contains(user.first_name).should("exist");
            cy.contains(user.last_name).should("exist");
            cy.contains("Open").should("exist");
            cy.contains("Download").should("exist");
            cy.get('#download_link')                         // sets <a> as the subject
                    .should('have.attr', 'href')             // changes subject to href attribute
                    .should('not.be.empty')                  // now test the href
                    .and('contain', 'sample_attachment.txt'); 
        })
    })  
    
    

    it('Close Support Request', function() {
        cy.login(user.email, user.password)

        let idx = Math.floor(Math.random() * (types.length - 1)) + 0
        let type = types[idx]
        cy.appFactories([
            ['create', 'support_request', {req_type: type}]
        ])
        cy.visit("/support_requests")
        cy.contains('a', type).click()

        cy.get("#edit_support_request").click()
        cy.get("#support_request_closed").select("Completed")
        cy.get("#save_support_request").click()
        
        cy.contains("Completed").should("exist");
            
    })

  })
  