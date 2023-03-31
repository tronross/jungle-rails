describe('Add product to cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('Visits the home page on load', () => {
    cy.get('.navbar-brand').should('be.visible');
  });

  it('Adds a product to the cart when the add-to-cart button is clicked', () => {
    
    cy.get('[alt="Scented Blade"]').parent()
    
    cy.get('.btn').should('have.text', '\n         Add \n').click()
  });
})