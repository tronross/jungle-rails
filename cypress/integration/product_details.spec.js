describe('Product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('Visits the home page on load', () => {
    cy.get('.navbar-brand').should('be.visible');
  });

  it('Loads the product details page when image is clicked on home page', () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.get('p').should('have.text', '\n    The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.© 2021 Jungle, Inc')
  });
})